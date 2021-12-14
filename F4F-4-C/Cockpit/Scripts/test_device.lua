local dev 	    = GetSelf()
local current_mach  = get_param_handle("CURRENT_MACH") -- obtain shared parameter (created if not exist ), i.e. databus
local current_alt = get_param_handle("CURRENT_ALT")
local current_hdg = get_param_handle("CURRENT_HDG")
local current_ias = get_param_handle("CURRENT_IAS")
local current_pitch = get_param_handle("CURRENT_PITCH")
local current_vv = get_param_handle("CURRENT_VV")
local current_G = get_param_handle("CURRENT_G")
local current_RPM = get_param_handle("CURRENT_RPM")
local current_AOA = get_param_handle("CURRENT_AOA")
local current_rollRate = get_param_handle("ROLL_RATE")
local current_pitchRate = get_param_handle("PITCH_RATE")
local current_yawRate = get_param_handle("YAW_RATE")
local current_lateralAcceleration = get_param_handle("CURRENT_LAT_ACCEL")
local current_logState = get_param_handle("LOG_STATE")

current_mach:set(0.0) -- set to 0.0
current_alt:set(0)
current_hdg:set(0)
current_ias:set(0)
current_pitch:set(0)
current_vv:set(0)
current_G:set(1)
current_RPM:set(0)
current_AOA:set(0)
current_rollRate:set(0)
current_pitchRate:set(0)
current_yawRate:set(0)
current_lateralAcceleration:set(0)
current_logState:set("")


local update_time_step = 0.1
local feet_per_meter = 3.28084
local feet_per_meter_per_minute = feet_per_meter * 60
local degrees_per_radian = 57.2957795
local ias_conversion_to_knots = 1.9504132  -- guess based on sea level TAS vs. IAS value
local log_duration = 1 * 60					-- seconds of logging
local start_logging = 60 / update_time_step
local end_logging = (60 + log_duration) / update_time_step
local log_counter = 0


make_default_activity(update_time_step)
--update will be called 10 times per second

local sensor_data = get_base_data()

local DC_BUS_V  = get_param_handle("DC_BUS_V")
DC_BUS_V:set(0)

function post_initialize()
	electric_system = GetDevice(3) --devices["ELECTRIC_SYSTEM"]
	print("Initialized Time, IAS, Altitude, AOA, Pitch, VerticalVelocity, pitchRate, joystickY, joystickX")
end

function update()
	local v = current_mach:get()
	-- print(v)
	current_mach:set(sensor_data.getMachNumber())
	current_alt:set(sensor_data.getBarometricAltitude()*feet_per_meter)
	current_hdg:set(360-(sensor_data.getHeading()*degrees_per_radian))
	current_ias:set(sensor_data.getIndicatedAirSpeed()*ias_conversion_to_knots)
	current_pitch:set(sensor_data.getPitch()*degrees_per_radian)
	current_AOA:set(sensor_data.getAngleOfAttack()*degrees_per_radian)
	current_vv:set(sensor_data.getVerticalVelocity()*feet_per_meter_per_minute)
	current_G:set(sensor_data.getVerticalAcceleration())
	current_RPM:set(sensor_data.getEngineLeftRPM())
	current_rollRate:set(sensor_data.getRateOfRoll())
	current_pitchRate:set(sensor_data.getRateOfPitch())
	current_yawRate:set(sensor_data.getRateOfYaw())
	current_lateralAcceleration:set(sensor_data.getLateralAcceleration())
	-- debug
	local stickY = sensor_data.getStickPitchPosition()
	local stickX = sensor_data.getStickRollPosition()
	
	-- log values if logging is enabled
	if (log_counter >= start_logging and log_counter < end_logging) then
		current_logState:set("LOGGING")
		-- log log_counter, ias, alt, AOA, pitch, vv, pitchRate, control Y position
		print(log_counter,",",current_ias:get(),",",current_alt:get(),",",current_AOA:get(),",",current_pitch:get(),",",current_vv:get(),",",current_pitchRate:get(),",",stickY,",",stickX,",",current_rollRate:get())
	else
		current_logState:set("")
	end
	log_counter = log_counter + 1
	
	-- getThrottleLeftPosition
	if electric_system ~= nil then
	   local DC_V     =  electric_system:get_DC_Bus_1_voltage()
	   local prev_val =  DC_BUS_V:get()
	   -- add some dynamic: 
	   DC_V = prev_val + (DC_V - prev_val) * update_time_step   
	   DC_BUS_V:set(DC_V)
	end	
end




