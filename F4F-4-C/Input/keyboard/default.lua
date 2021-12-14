local cscripts = folder.."../../Cockpit/Scripts/"
dofile(cscripts.."devices.lua")
dofile(cscripts.."command_defs.lua")

local res = external_profile("Config/Input/Aircrafts/common_keyboard_binding.lua")

join(res.keyCommands,{
    ---------------------------------------------
    -- Stick ------------------------------------
    ---------------------------------------------
    {combos = {{key = 'Space'}}, down = Keys.PlaneFireOn, up = Keys.PlaneFireOff,                    name = _('Trigger'),                category = {_('Stick')}},
    
    -- Canopy Control
    {combos = {{key = 'C', reformers = {'LCtrl'}}}, down = iCommandPlaneFonar, name = _('Canopy Open/Close'), category = {_('Left Console')}},
        
    {combos = {{key = 'W', reformers = {'LCtrl'}}}, down = Keys.FoldWings, name = _('Fold Wings'), category = {_('Left Console')}},
    {combos = {{key = 'W', reformers = {'LShift'}}}, down = Keys.UnfoldWings, name = _('Unfold Wings'), category = {_('Left Console')}},

    ---------------------------------------------
    -- Communitcations -------------------------
    --------------------------------------------- 
    {down = iCommandPilotGestureSalute,                                                     name = _('Pilot Salute'),       category = {_('Communications')}},
    {combos = {{key = 'U'}}, down = iCommandPlaneShipTakeOff,                               name = _('Catapult Hook-Up'),   category = {_('Communications')}},
})
return res