dofile(LockOn_Options.common_script_path.."devices_defs.lua")
dofile(LockOn_Options.script_path.."devices.lua")
dofile(LockOn_Options.script_path.."command_defs.lua")

local dev = GetSelf()

local update_time_step = 0.02  --50 time per second
make_default_activity(update_time_step)

local sensor_data = get_base_data()

--local canopy_int_anim_arg = 26
local folding_wing_anim_arg = 8
--local canopy_lever_cpt_anim_arg = 129

--Creating local variables
local WING_FOLDING_COMMAND = 0   -- 0 unfold, 1 fold

dev:listen_command(Keys.FoldingWing)

function SetCommand(command, value)
	if (command == Keys.FoldingWing) then
        WING_FOLDING_COMMAND = 1 - WING_FOLDING_COMMAND --toggle
    end
end

function post_initialize()
    --WING_FOLDING_COMMAND = 0
    --set_aircraft_draw_argument_value(folding_wing_anim_arg, 0)

    --local birth = LockOn_Options.init_conditions.birth_place
    --if birth == "GROUND_COLD" then
    --    WING_FOLDING_COMMAND = 1
    --    set_aircraft_draw_argument_value(folding_wing_anim_arg, 1)
    --else
    --    WING_FOLDING_COMMAND = 0
    --end
end

local current_wing_position = 0

function update()    
    --local current_wing_position = get_aircraft_draw_argument_value(folding_wing_anim_arg)
    --print("folding wing: " .. current_wing_position)

    --if(current_wing_position < 1) then
    --    current_wing_position = current_wing_position + 0.01
    --    print("folding wing: trying to fold" .. current_wing_position)        
    --end
    --set_aircraft_draw_argument_value(folding_wing_anim_arg, current_wing_position)
   

    --
	--if (WING_FOLDING_COMMAND == 0 and current_wing_position > 0) then
    --    current_wing_position = current_wing_position - 0.01
    --    set_aircraft_draw_argument_value(folding_wing_anim_arg, current_wing_position)
	--elseif (WING_FOLDING_COMMAND == 1 and current_wing_position < 1) then
	--	current_wing_position = current_wing_position + 0.01
    --    set_aircraft_draw_argument_value(folding_wing_anim_arg, current_wing_position)
    --end    
end

need_to_be_closed = false -- close lua state after initialization