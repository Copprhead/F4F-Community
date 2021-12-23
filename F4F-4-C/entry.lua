local self_ID = "F4F-4-C by Copprhead"
declare_plugin(self_ID,
{
installed 	 = true, -- if false that will be place holder , or advertising
dirName	  	 = current_mod_path,

displayName	 = _("F4F-4 Community"),
fileMenuName = _("F4F-4-C"),
version		 = "0.0.1",
state		 = "installed",
info		 = _("F4F-4 Community Module"),
encyclopedia_path = current_mod_path..'/Encyclopedia',
binaries = { 'F4F-4-C', },
--binaries 	 =
--{
--'F4F-4-C',
--},

InputProfiles =
{
	["F4F-4-C"]     = current_mod_path .. '/Input',
},

Skins	= 
	{
		{
			name	= "F4F-4-C",
			dir		= "Skins/1"
		},
	},

Missions =
	{
		{
			name		= _("F4F-4-C"),
			dir			= "Missions",
		},
	},	

Options = 
	{
		{
			name		= _("F4F-4-C"),
			nameId		= "F4F-4-C",
			dir			= "Options",
		},
	},
LogBook =
	{
		{
			name		= _("F4F-4-C"),
			type		= "F4F-4-C",
		},
	},	
})

-- External
mount_vfs_liveries_path (current_mod_path.."/Liveries")
mount_vfs_model_path	(current_mod_path.."/Shapes")
mount_vfs_texture_path  (current_mod_path.."/Textures/f4f_common")

-- Cockpit
mount_vfs_model_path	(current_mod_path.."/Cockpit/Shapes")
mount_vfs_texture_path  (current_mod_path.."/Cockpit/Textures/f4f_cockpit")


dofile(current_mod_path.."/Suspension.lua")
local FM=
{
	[1] = self_ID,
	[2] = 'F4F-4-C',
	center_of_mass = {0.0, 0.0, 0.0}, --x=0.183, y=0.261
	moment_of_inertia = {10968, 39500, 35116, -1763.0}, --763 --xy = -5518 --xy = -1763
	suspension = suspension,
}

---------------------------------------------------------------------------------------

make_flyable('F4F-4-C',current_mod_path..'/Cockpit/Scripts/', FM, nil)
--set_manual_path('F4F-4-C', current_mod_path .. '/Doc/manual')

----------------------------------------------------------------------------------------
dofile(current_mod_path..'/F4F-4-C.lua')
plugin_done()
