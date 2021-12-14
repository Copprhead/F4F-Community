dofile(LockOn_Options.script_path.."HUD/Indicator/definitions.lua")

function AddElement(object)
    object.use_mipfilter    = true
	object.additive_alpha   = true
	object.h_clip_relation  = h_clip_relations.COMPARE
	object.level			= HUD_DEFAULT_LEVEL
    Add(object)
end
local BASE_COLOR  = {255,0  ,0,255}
local BASE_COLOR2 = {0  ,255,0,255} --128,165,0,120
local GRID_   			= MakeMaterial("Bazar/Textures/AvionicsCommon.tga",BASE_COLOR2) -- image of the fixed net
local BASE_COLOR_MAT    = MakeMaterial(nil,BASE_COLOR)

local shape_rotation = 0

shape_rotation = math.tan(shape_rotation/57.3) * 1000 -- to mils -- NOTE: this does nothing currently, returns 0


local full_radius =  108 -- is this the radius of "HUD/net view field"? Units (pixels or angular units)?
local grid_shift  = -35 -- explain shift?
local grid_radius =  full_radius + grid_shift

local grid_origin	         = CreateElement "ceSimple"
grid_origin.name 		     = create_guid_string() -- no such function in this script. Not in definitions.lua either. Could be in elements_defs.lua
grid_origin.collimated 		 = true
--AddElement(grid_origin)

local grid	    = CreateElement "ceTexPoly" --this could be the text area on HUD
grid.name 		= create_guid_string() -- this must be external function call.
grid.vertices   = {{-grid_radius, grid_radius},
				   { grid_radius, grid_radius},
				   { grid_radius,-grid_radius},
				   {-grid_radius,-grid_radius}}
grid.indices	= {0,1,2,2,3,0}
grid.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
grid.material   = GRID_	   
grid.init_pos   = {0,grid_shift + shape_rotation} 
grid.collimated = true
grid.parent_element = grid_origin.name
--AddElement(grid)


local FONT_         = MakeFont({used_DXUnicodeFontData = "FUI/Fonts/font_cockpit_rus_2"},BASE_COLOR,50,"test_font") --this is font object declaration. Mig-21 does not have fonts, therefore disabled.


local ias_output           = CreateElement "ceStringPoly"
ias_output.name            = create_guid_string()
ias_output.material        = FONT_
ias_output.init_pos        = {-grid_radius,0}
ias_output.alignment       = "CenterCenter"
ias_output.stringdefs      = {0.01,0.75 * 0.01, 0, 0}
ias_output.formats         = {"%.0f IAS","%s"} 
ias_output.element_params  = {"CURRENT_IAS"}
ias_output.controllers     = {{"text_using_parameter",0,0}} --first index is for element_params (starting with 0) , second for formats ( starting with 0)
ias_output.additive_alpha  = true
ias_output.collimated     = true
--AddElement(ias_output)

local mach_output           = CreateElement "ceStringPoly"
mach_output.name            = create_guid_string()
mach_output.material        = FONT_
mach_output.init_pos        = {-grid_radius,-15}
mach_output.alignment       = "CenterCenter"
mach_output.stringdefs      = {0.01,0.75 * 0.01, 0, 0}
mach_output.formats         = {"M%.3f","%s"} 
mach_output.element_params  = {"CURRENT_MACH"}
mach_output.controllers     = {{"text_using_parameter",0,0}} 
mach_output.additive_alpha  = true
mach_output.collimated     = true
--AddElement(mach_output)

local rpm_output           = CreateElement "ceStringPoly"
rpm_output.name            = create_guid_string()
rpm_output.material        = FONT_
rpm_output.init_pos        = {-grid_radius,-30}
rpm_output.alignment       = "CenterCenter"
rpm_output.stringdefs      = {0.01,0.75 * 0.01, 0, 0}
rpm_output.formats         = {"%.0f %%","%s"} 
rpm_output.element_params  = {"CURRENT_RPM"}
rpm_output.controllers     = {{"text_using_parameter",0,0}} 
rpm_output.additive_alpha  = true
rpm_output.collimated     = true
--AddElement(rpm_output)

local alt_output           = CreateElement "ceStringPoly"
alt_output.name            = create_guid_string()
alt_output.material        = FONT_
alt_output.init_pos        = {grid_radius,0}
alt_output.alignment       = "CenterCenter"
alt_output.stringdefs      = {0.01,0.75 * 0.01, 0, 0}
alt_output.formats         = {"%.0f ALT","%s"} 
alt_output.element_params  = {"CURRENT_ALT"}
alt_output.controllers     = {{"text_using_parameter",0,0}} 
alt_output.additive_alpha  = true
alt_output.collimated     = true
--AddElement(alt_output)

local vv_output           = CreateElement "ceStringPoly"
vv_output.name            = create_guid_string()
vv_output.material        = FONT_
vv_output.init_pos        = {grid_radius,-15}
vv_output.alignment       = "CenterCenter"
vv_output.stringdefs      = {0.01,0.75 * 0.01, 0, 0}
vv_output.formats         = {"%.0f FPM","%s"} 
vv_output.element_params  = {"CURRENT_VV"}
vv_output.controllers     = {{"text_using_parameter",0,0}} 
vv_output.additive_alpha  = true
vv_output.collimated     = true
--AddElement(vv_output)

local hdg_output           = CreateElement "ceStringPoly"
hdg_output.name            = create_guid_string()
hdg_output.material        = FONT_
hdg_output.init_pos        = {0,grid_radius}
hdg_output.alignment       = "CenterCenter"
hdg_output.stringdefs      = {0.01,0.75 * 0.01, 0, 0}
hdg_output.formats         = {"%.0f","%s"} 
hdg_output.element_params  = {"CURRENT_HDG"}
hdg_output.controllers     = {{"text_using_parameter",0,0}} 
hdg_output.additive_alpha  = true
hdg_output.collimated     = true
--AddElement(hdg_output)

local latAccel_output           = CreateElement "ceStringPoly"
latAccel_output.name            = create_guid_string()
latAccel_output.material        = FONT_
latAccel_output.init_pos        = {0,grid_radius-15}
latAccel_output.alignment       = "CenterCenter"
latAccel_output.stringdefs      = {0.01,0.75 * 0.01, 0, 0}
latAccel_output.formats         = {"LFT %.3f RT","%s"} 
latAccel_output.element_params  = {"CURRENT_LAT_ACCEL"}
latAccel_output.controllers     = {{"text_using_parameter",0,0}} 
latAccel_output.additive_alpha  = true
latAccel_output.collimated     = true
--AddElement(latAccel_output)

local pitch_output           = CreateElement "ceStringPoly"
pitch_output.name            = create_guid_string()
pitch_output.material        = FONT_
pitch_output.init_pos        = {0,0}
pitch_output.alignment       = "CenterCenter"
pitch_output.stringdefs      = {0.01,0.75 * 0.01, 0, 0}
pitch_output.formats         = {"--- %.0f ---","%s"} 
pitch_output.element_params  = {"CURRENT_PITCH"}
pitch_output.controllers     = {{"text_using_parameter",0,0}} 
pitch_output.additive_alpha  = true
pitch_output.collimated     = true
--AddElement(pitch_output)

local pitchRate_output           = CreateElement "ceStringPoly"
pitchRate_output.name            = create_guid_string()
pitchRate_output.material        = FONT_
pitchRate_output.init_pos        = {0,0+15}
pitchRate_output.alignment       = "CenterCenter"
pitchRate_output.stringdefs      = {0.01,0.75 * 0.01, 0, 0}
pitchRate_output.formats         = {"^ %f ^ PR","%s"} 
pitchRate_output.element_params  = {"PITCH_RATE"}
pitchRate_output.controllers     = {{"text_using_parameter",0,0}} 
pitchRate_output.additive_alpha  = true
pitchRate_output.collimated     = true
--AddElement(pitchRate_output)

local logging_output           = CreateElement "ceStringPoly"
logging_output.name            = create_guid_string()
logging_output.material        = FONT_
logging_output.init_pos        = {0,0+30}
logging_output.alignment       = "CenterCenter"
logging_output.stringdefs      = {0.01,0.75 * 0.01, 0, 0}
logging_output.formats         = {"%s","%s"} 
logging_output.element_params  = {"LOG_STATE"}
logging_output.controllers     = {{"text_using_parameter",0,0}} 
logging_output.additive_alpha  = true
logging_output.collimated     = true
--AddElement(logging_output)

local aoa_output           = CreateElement "ceStringPoly"
aoa_output.name            = create_guid_string()
aoa_output.material        = FONT_
aoa_output.init_pos        = {0,-15}
aoa_output.alignment       = "CenterCenter"
aoa_output.stringdefs      = {0.01,0.75 * 0.01, 0, 0}
aoa_output.formats         = {"%.0f AOA","%s"} 
aoa_output.element_params  = {"CURRENT_AOA"}
aoa_output.controllers     = {{"text_using_parameter",0,0}} 
aoa_output.additive_alpha  = true
aoa_output.collimated     = true
--AddElement(aoa_output)

local rollRate_output           = CreateElement "ceStringPoly"
rollRate_output.name            = create_guid_string()
rollRate_output.material        = FONT_
rollRate_output.init_pos        = {0,-30}
rollRate_output.alignment       = "CenterCenter"
rollRate_output.stringdefs      = {0.01,0.75 * 0.01, 0, 0}
rollRate_output.formats         = {"^ %.2f v RR","%s"} 
rollRate_output.element_params  = {"ROLL_RATE"}
rollRate_output.controllers     = {{"text_using_parameter",0,0}} 
rollRate_output.additive_alpha  = true
rollRate_output.collimated     = true
--AddElement(rollRate_output)

local g_output           = CreateElement "ceStringPoly"
g_output.name            = create_guid_string()
g_output.material        = FONT_
g_output.init_pos        = {0,-grid_radius}
g_output.alignment       = "CenterCenter"
g_output.stringdefs      = {0.01,0.75 * 0.01, 0, 0}
g_output.formats         = {"%.2f G","%s"} 
g_output.element_params  = {"CURRENT_G"}
g_output.controllers     = {{"text_using_parameter",0,0}} 
g_output.additive_alpha  = true
g_output.collimated     = true
--AddElement(g_output)

local yawRate_output           = CreateElement "ceStringPoly"
yawRate_output.name            = create_guid_string()
yawRate_output.material        = FONT_
yawRate_output.init_pos        = {0,-grid_radius+15}
yawRate_output.alignment       = "CenterCenter"
yawRate_output.stringdefs      = {0.01,0.75 * 0.01, 0, 0}
yawRate_output.formats         = {"< %.2f > YR","%s"} 
yawRate_output.element_params  = {"YAW_RATE"}
yawRate_output.controllers     = {{"text_using_parameter",0,0}} 
yawRate_output.additive_alpha  = true
yawRate_output.collimated     = true
--AddElement(yawRate_output)

function texture_box (UL_X,UL_Y,W,H) --this is texture box function. Receives some coordinates and dimensions, returns 4 pairs of values. Nothing is calling this function inside script.
	local texture_size_x = 128
	local texture_size_y = 128
	local ux = UL_X / texture_size_x
	local uy = UL_Y / texture_size_y
	local w  = W / texture_size_x
	local h  = W / texture_size_y

	return {{ux	    ,uy},
			{ux + w ,uy},
			{ux + w ,uy + h},
			{ux	 	,uy + h}}
end

function create_textured_box(UL_X,UL_Y,DR_X,DR_Y) -- function that creates textured square. This function is called 2 times in below code.

	local size_per_pixel = 3/6
	local texture_size_x = DR_X-UL_X
	local texture_size_y = DR_Y-UL_Y
	local W = DR_X - UL_X
	local H = DR_Y - UL_Y

	local half_x = 0.5 * W * size_per_pixel
	local half_y = 0.5 * H * size_per_pixel
	local ux 	 = UL_X / texture_size_x
	local uy 	 = UL_Y / texture_size_y
	local w  	 = W / texture_size_x
	local h 	 = H / texture_size_y

	local object = CreateElement "ceTexPoly"
	object.vertices =  {{-half_x, half_y},
						{ half_x, half_y},
						{ half_x,-half_y},
						{-half_x,-half_y}}
	object.indices	  = {0,1,2,2,3,0}
    object.tex_coords = {{ux -w/2    ,uy-h/2},
    					 {ux + w/2 ,uy-h/2},
    					 {ux + w/2 ,uy + h/2},
    				     {ux-w/2 	 ,uy + h/2}}
	--object.tex_coords = {{ux     ,uy},
	--					 {ux + w ,uy},
	--					 {ux + w ,uy + h},
	--					 {ux 	 ,uy + h}}	 
				 
	return object

end

--local BASE_COLOR  = {255,0  ,0,60}
local GUNSIGHT_COLOR = {255,128,0,192}
local GunsightTexture   = MakeMaterial("gunsight.dds",GUNSIGHT_COLOR)

gun_sight_mark 					= create_textured_box(-235,-235,235,235) -- this is create_textured_box function call with parameters
gun_sight_mark.material       	= GunsightTexture	
gun_sight_mark.name 			= BASE_COLOR_MAT
gun_sight_mark.collimated	  	= true
--gun_sight_mark.element_params   = {"WS_GUN_PIPER_AVAILABLE",
--								   "WS_GUN_PIPER_AZIMUTH",
--								   "WS_GUN_PIPER_ELEVATION"} 
--								   
--gun_sight_mark.controllers 	   = {{"parameter_in_range"				,0,0.9,1.1},--check that piper available using WS_GUN_PIPER_AVAILABLE
--								  {"move_left_right_using_parameter",1, 0.73 },	--azimuth move by WS_GUN_PIPER_AZIMUTH , 0.73 is default collimator distance (from eye to HUD plane)
--								  {"move_up_down_using_parameter"   ,2, 0.73 }, --elevation move by WS_GUN_PIPER_ELEVATION
--								 }

gun_sight_mark.element_params   = {"WS_GUN_PIPER_AVAILABLE"} 								   
gun_sight_mark.controllers 	   = {{"parameter_in_range"				,0,0.9,1.1}}

AddElement(gun_sight_mark)
