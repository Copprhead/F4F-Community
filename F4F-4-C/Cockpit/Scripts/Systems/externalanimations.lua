dofile(LockOn_Options.script_path.."command_defs.lua")

-- dofile(LockOn_Options.script_path.."Systems/electric_system_api.lua")
-- dofile(LockOn_Options.script_path.."Systems/hydraulic_system_api.lua")

local dev = GetSelf()

local update_time_step = 0.02
make_default_activity(update_time_step) -- enables call to update

local sensor_data = get_base_data()

local PROP_STATE         =   0
local engineMaxRPM		= 2700

function post_initialize()
	set_aircraft_draw_argument_value(407, PROP_STATE)
end

function update()
	----sensor is from 0 to 100 so it is divided by 100 and multiplied by the prop max RPM.
	--local engineRPM = (sensor_data.getEngineLeftRPM() / 100) * engineMaxRPM
	--local propRPM = engineRPM * 2/3 -- Pratt & Whitney R-1830 Twin Wasp has 3:2 reduction gear
	--
	--if(propRPM > 0) then
	--	local propStep = propRPM / 60 * update_time_step
	--	propState = (propState + propStep)%1
	--	set_aircraft_draw_argument_value(DRAW_FAN,propState)
	--end

	local engineRPM = sensor_data.getEngineLeftRPM() / 100
	--local propRPM = engineRPM * 2/3 -- Pratt & Whitney R-1830 Twin Wasp has 3:2 reduction gear
	if engineRPM > 0 then
		local propStep = 0.2 * engineRPM
		PROP_STATE = (PROP_STATE + propStep)%1
	end
	set_aircraft_draw_argument_value(407, PROP_STATE)

	if engineRPM > 0.2 then
		set_aircraft_draw_argument_value(475, -1)
	else
		set_aircraft_draw_argument_value(475, 0)
	end

	local ROLL_STATE = sensor_data.getStickPitchPosition() / 100
	set_aircraft_draw_argument_value(11, ROLL_STATE) -- right aileron
	set_aircraft_draw_argument_value(12, -ROLL_STATE) -- left aileron

	local PITCH_STATE = sensor_data.getStickRollPosition() / 100
	set_aircraft_draw_argument_value(15, PITCH_STATE) -- right elevator

	local RUDDER_STATE = sensor_data.getRudderPosition() / 100
	set_aircraft_draw_argument_value(17, -RUDDER_STATE)
end

need_to_be_closed = false -- close lua state after initialization
