local cscripts = folder.."../../Cockpit/Scripts/"
dofile(cscripts.."devices.lua")
dofile(cscripts.."command_defs.lua")

local res = external_profile("Config/Input/Aircrafts/common_joystick_binding.lua")

join(res.keyCommands,{
    ---------------------------------------------
    -- Stick ------------------------------------
    ---------------------------------------------
    {combos = {{key = 'JOY_BTN1'}}, down = Keys.PlaneFireOn, up = Keys.PlaneFireOff, name = _('Trigger'),                category = {_('Stick')}},
    
    ---------------------------------------------
    -- Communitcations -------------------------
    --------------------------------------------- 
    {down = iCommandPilotGestureSalute, name = _('Pilot Salute'),       category = {_('Communications')}},
    {down = iCommandPlaneShipTakeOff,   name = _('Catapult Hook-Up'),   category = {_('Communications')}},
})

-- joystick axes 
join(res.axisCommands,{

    {combos = defaultDeviceAssignmentFor("roll"),   action = iCommandPlaneRoll,         name = _('Roll'),              category = {_('Flight Control')}},
    {combos = defaultDeviceAssignmentFor("pitch"),  action = iCommandPlanePitch,        name = _('Pitch'),             category = {_('Flight Control')}},
	{combos = defaultDeviceAssignmentFor("rudder"), action = iCommandPlaneRudder,		name = _('Rudder'),            category = {_('Flight Control')}},
	{combos = defaultDeviceAssignmentFor("thrust"), action = iCommandPlaneThrustCommon, name = _('Thrust'),            category = {_('Flight Control')}},
    {action = device_commands.wheelbrake_AXIS,                                          name = _('Wheel Brake'),       category = {_('Systems')}},
    {action = device_commands.left_wheelbrake_AXIS,                                     name = _('Wheel Brake Left'),  category = {_('Systems')}},
    {action = device_commands.right_wheelbrake_AXIS,                                    name = _('Wheel Brake Right'), category = {_('Systems')}},
})
return res