dofile(current_mod_path.."/Views.lua")
dofile(current_mod_path.."/Weapons.lua")

F4F_4_C =  {
        
	Name 				=   'F4F-4-C',
	DisplayName			= _('F4F-4-C'),

	EmptyWeight = 2612,
    MaxFuelWeight = 300, 
    MaxHeight = 12010, 
    MaxSpeed = 512, 
    MaxTakeOffWeight = 3607,

	Picture 			= "F4F-4-C.png",
	Rate 				= 20, -- RewardPoint in Multiplayer

	WingSpan = 11.58,
    --WorldID  = F4F_4_C,
	defFuelRatio = 0.68,
	
	HumanCockpit 		= false,
	HumanCockpitPath    = current_mod_path..'/Cockpit/Scripts/',
	
	country_of_origin	= "USA",

	Shape 				= "F4F-4-C",
	propellorShapeType  = "3ARG_PROC_BLUR",
    propellorShapeName  = "F4F-4-C_Propeller.fbx",
	debrisGeneration     = true,

	shape_table_data 	= 
	{
		{
			file  	 = 'F4F-4-C';
			life  	 = 18; -- lifebar
			vis   	 = 3; -- visibility gain.
			desrt    = 'F4F-4-C_destr'; -- Name of destroyed object file name
			fire  	 = { 300, 2}; -- Fire on the ground after destoyed: 300sec 2m
			username = 'F4F-4-C';
			index    =  WSTYPE_PLACEHOLDER;
			classname 	= "lLandPlane";
			positioning = "BYNORMAL";
			drawonmap 	= true;
		},
		{
			name  = "F4F-4-C_destr";
			file  = "F4F-4-C-destr";
			fire  = { 240, 2};
		},
	},

	mapclasskey 		= "P0091000024",
	attribute  			= {wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER ,"Battleplanes",},
	Categories 			= {"{78EFB7A2-FD52-4b57-A6A6-3BF0E1D6555F}", "Interceptor",},	


	panelRadio = {
			[1] = {
				name = _("AN/ARC-150(V)-2"), --UHF
				range = {
					{min = 225.0, max = 399.975}
				},
				channels = {
					[1] = { name = _("Channel 1"), default = 225.0, modulation = _("AM")}, -- default
					[2] = { name = _("Channel 2"), default = 258.0, modulation = _("AM")},
					[3] = { name = _("Channel 3"), default = 260.0, modulation = _("AM")},
					[4] = { name = _("Channel 4"), default = 270.0, modulation = _("AM")},
					[5] = { name = _("Channel 5"), default = 255.0, modulation = _("AM")},
					[6] = { name = _("Channel 6"), default = 259.0, modulation = _("AM")},
					[7] = { name = _("Channel 7"), default = 262.0, modulation = _("AM")},
					[8] = { name = _("Channel 8"), default = 257.0, modulation = _("AM")},
					[9] = { name = _("Channel 9"), default = 253.0, modulation = _("AM")},
					[10] = { name = _("Channel 10"), default = 263.0, modulation = _("AM")},
				}
			},
			[2] = {
				name = _("SRT-651/N"), --VHF/UHF
				range = {{min = 30.0, max = 88.0},
						 {min = 108.0, max = 174.0},
						 {min = 225.0, max = 399.975}},
				channels = {
					[1] = { name = _("Channel 1"), default = 225.0, connect = true}, -- default
					[2] = { name = _("Channel 2"), default = 258.0},
					[3] = { name = _("Channel 3"), default = 260.0},
					[4] = { name = _("Channel 4"), default = 270.0},
					[5] = { name = _("Channel 5"), default = 255.0},
					[6] = { name = _("Channel 6"), default = 259.0},
					[7] = { name = _("Channel 7"), default = 262.0},
					[8] = { name = _("Channel 8"), default = 257.0},
					[9] = { name = _("Channel 9"), default = 253.0},
					[10] = { name = _("Channel 10"), default = 263.0},
				}
			},
		},

	-------------------------
	M_empty 					= 3356, -- kg
	M_nominal					= 3900,
	M_max 						= 5400, -- kg
	M_fuel_max 					= 495, -- kg 
	H_max 					 	= 10668, -- m
	
	average_fuel_consumption 	= 0.302, -- this is highly relative, but good estimates are 36-40l/min = 28-31kg/min = 0.47-0.52kg/s -- 45l/min = 35kg/min = 0.583kg/s
	CAS_min 					= 53, -- if this is not OVERAL FLIGHT TIME, but jus LOITER TIME, than it sholud be 10-15 minutes.....CAS capability in minute (for AI)
	V_opt 						= 240/1.944,-- Cruise speed (for AI)
	V_take_off 					= 120/1.944, -- Take off speed in m/s (for AI)
	V_land 						= 125/1.944, -- Land speed in m/s (for AI)
	V_max_sea_level 			= 320/1.944, -- Max speed at sea level in m/s (for AI)
	V_max_h 					= 210/1.944, -- Max speed at max altitude in m/s (for AI)
	Vy_max 						= 12, -- Max climb speed in m/s (for AI)
	Mach_max 					= 0.562, -- Max speed in Mach (for AI)
	Ny_min 						= -4, -- Min G (for AI)
	Ny_max 						= 8.0,  -- Max G (for AI)
	Ny_max_e 					= 8.0,  -- Max G (for AI)
	AOA_take_off 				= math.rad(9.0), -- AoA in take off (for AI)
	bank_angle_max 				= 60, -- Max bank angle (for AI)
	
	has_afteburner 				= false, -- AFB yes/no
	has_speedbrake 				= false, -- Speedbrake yes/no
	has_differential_stabilizer	= false, -- differential stabilizers
	
	main_gear_pos 				= { 0.77, -1.9 + 0.2, 0.9},
	nose_gear_pos 				= {-4.5, -0.825 + 0.100, 0.0},  
	tand_gear_max 				= 0.577,
	wing_area 					= 24, -- wing area in m2
	wing_span 					= 11.58, -- wing spain in m
	
	--FIXED_WING			= 0
	--VARIABLE_GEOMETRY	= 1			ARG = 7???
	--FOLDED_WING			= 2    ARG = 8 (0-1)
	--VARIABLE_GEOMETRY_FOLDED = 3
	wing_type 					= 2,

	thrust_sum_max 				= 8000, -- thrust in kg (44kN)
	thrust_sum_ab 				= 8000, -- thrust inkg (71kN)
	length 						= 12.13, -- full lenght in m
	height 						= 8.76, -- height in m
	flaps_maneuver 				= 0, -- Max flaps in take-off and maneuver (0.5 = 1st stage; 1.0 = 2nd stage) (for AI)
	range 						= 1360, -- Max range in km (for AI)
	RCS 						= 2.5, -- Radar Cross Section m2
	IR_emission_coeff 			= 0.1, -- Normal engine -- IR_emission_coeff = 1 is Su-27 without afterburner. It is reference.
	IR_emission_coeff_ab 		= 0, -- With afterburner
	wing_tip_pos 				= {-2.1,	0,	5.6},
	nose_gear_wheel_diameter 	= 0.28, -- in m
	main_gear_wheel_diameter 	= 0.65, -- in m
	brakeshute_name 			= 0, -- Landing - brake chute visual shape after separation
	engines_count				= 1, -- Engines count
	engines_nozzles =
	{
		[1] = 
		{
			pos 		=  {2.427,-0.565,0.563}, -- nozzle coords
			elevation   =  0, -- AFB cone elevation –- for engines mounted at an angle to fuselage, change elevation
			diameter	 = 0*0.1, -- AFB cone diameter
			exhaust_length_ab   = -3.0, -- lenght in m
			exhaust_length_ab_K = 0.3, -- AB animation
			engine_number  = 1, --both to first engine
			smokiness_level     = 	0.1,  --both to first engine
		},
	
		[2] = 
		{
			pos 		=  {2.427,-0.565,-0.563}, -- nozzle coords
			elevation   =  0, -- AFB cone elevation
			diameter	 = 0*0.1, -- AFB cone diameter
			exhaust_length_ab   = -3.0, -- lenght in m
			exhaust_length_ab_K = 0.3, -- AB animation
			engine_number  = 1, --both to first engine
			smokiness_level     = 	0.1,  --both to first engine
		},
	},
	crew_size	 = 1,
	crew_members = 
	{
		[1] = 
		{
			ejection_seat_name = 18,	-- Martin Baker seat object model
			drop_canopy_name = "F4F-4-C_Canopy",
			pos =  {1,	1,	0},
			canopy_pos = {0,	0,	0},
		}, -- end of [1]
	}, -- end of crew_members

	fires_pos = 
	{
		[1] = 	{-2.117,	-0.9,	0},
		[2] = 	{0.500,	0.213,	0},
		[3] = 	{0.500,	0.213,	-2.182},
		[4] = 	{-0.82,	0.265,	2.774},
		[5] = 	{-0.82,	0.265,	-2.774},
		[6] = 	{-0.82,	0.255,	2.7274},
		[7] = 	{-0.82,	0.255,	-2.7274},
		[8] = 	{0.5,	-0.5,	2.7578},
		[9] = 	{0.5,	-0.5,	-2.578},
		[10] = 	{0.50,	0.084,	2.754},
		[11] = 	{0.50,	0.084,	-2.7534},
	}, -- end of fires_pos
		
	--mechanimations = {
    --    Door0 = {
    --        {Transition = {"Close", "Open"},  Sequence = {{C = {{"Arg", 38, "to", 0.9, "at", 0.11111111111111},},},}, Flags = {"Reversible"},},
    --        {Transition = {"Open", "Close"},  Sequence = {{C = {{"Arg", 38, "to", 0.0, "at", 0.16666666666667},},},}, Flags = {"Reversible", "StepsBackwards"},},
    --        {Transition = {"Any", "Bailout"}, Sequence = {{C = {{"TearCanopy", 0},},},},},
    --    },
    --},

	--net_animation = { 420 --[[external_model_throttle_arg]]},

	detection_range_max		 = 0,
	radar_can_see_ground 	 = false, -- this should be examined (what is this exactly?)
	CanopyGeometry = { -- Mk1 eyeball sensor for visual spotting targets
		azimuth = {-160.0, 160.0}, -- pilot view horizontal (AI)
		elevation = {-40.0, 90.0} -- pilot view vertical (AI)
	},
	Sensors = { },

	HumanRadio = {
		frequency     = 124.0, -- onboard radio, default DCSW frequency, chnl 0
		editable     = true,
		minFrequency     = 30.000,
		maxFrequency     = 399.975,
		rangeFrequency = {
			{min = 30.0,  max = 87.975},
			{min = 108.0, max = 173.975},
			{min = 225.0, max = 399.975},
		},
	},
	
	stores_number	=	0,
	Pylons = {},

	 -- Guns
     Guns = {
         -- Left outb
         Browning_AN_M2({
             muzzle_pos = {0.8, 0.164, -3.105},
             effect_arg_number = 436,
             mixes = {
                 --[[ Early ]]  {1, 1, 3, 3, 4},
	 			--[[ Late ]]  {2, 2, 3, 3, 4},
             },
             count = 270,
             barrel_circular_error = 0.0,
             rates = {798},
             azimuth_initial = -0.341,
             elevation_initial = 0.257,
             supply_position = {-0.724, -0.180, -3.000},
             ejector_pos = {-1.055, -0.120, -0.013},
         }),
	 			
         -- Right outb
         Browning_AN_M2({
	 		muzzle_pos = {0.8, 0.164, 3.105},
             effect_arg_number = 350,
             mixes = {
                 --[[ Early ]]  {4, 1, 1, 3, 3},
	 			--[[ Late ]]  {4, 2, 2, 3, 3},
             },
             count = 270,
             barrel_circular_error = 0.0,
             rates = {804},
             azimuth_initial = 0.341,
             elevation_initial = 0.257,
             supply_position = {-0.724, -0.180, 3.000},
             ejector_pos = {-1.055, -0.120, 0.013},
         }),
	 
	 
         -- Left cntr
         Browning_AN_M2({
             muzzle_pos = {0.84, 0.104, -2.385},
             effect_arg_number = 435,
             mixes = {
                 --[[ Early ]]  {3, 4, 1, 1, 3},
	 			--[[ Late ]]  {3, 4, 2, 2, 3},
             },
             count = 270,
             barrel_circular_error = 0.0,
             rates = {800},
             azimuth_initial = -0.286,
             elevation_initial = 0.458,
             supply_position = {-0.724, -0.180, -3.000},
             ejector_pos = {-1.055, -0.122, -0.009},
         }),
	 
	 	-- Right cntr
         Browning_AN_M2({
	 		muzzle_pos = {0.84, 0.104, 2.385},
             effect_arg_number = 432,
             mixes = {
                 --[[ Early ]]  {3, 3, 4, 1, 1},
	 			--[[ Late ]]  {3, 3, 4, 2, 2},
             },
             count = 270,
             barrel_circular_error = 0.0,
             rates = {801},
             azimuth_initial = 0.286,
             elevation_initial = 0.458,
             supply_position = {-0.724, -0.180, 3.000},
             ejector_pos = {-1.055, -0.122, 0.009},
         }),
	 
         -- Left inb
         Browning_AN_M2({
             muzzle_pos = {0.85, 0.086, -2.175},
             effect_arg_number = 434,
             mixes = {
                 --[[ Early ]]  {1, 3, 3, 4, 1},
	 			--[[ Late ]]  {2, 3, 3, 4, 2},
             },
             count = 500,
             barrel_circular_error = 0.0,
             rates = {803},
             azimuth_initial = -0.379,
             elevation_initial = 0.364,
             supply_position = {-0.724, -0.180, -3.000},
             ejector_pos = {-1.055, -0.123, -0.008},
         }),
	 
         -- Right inb
         Browning_AN_M2({
	 		muzzle_pos = {0.85, 0.086, 2.175},
             effect_arg_number = 433,
             mixes = {
                 --[[ Early ]]  {1, 1, 3, 3, 4},
	 			--[[ Late ]]  {2, 2, 3, 3, 4},
             },
             count = 500,
             barrel_circular_error = 0.0,
             rates = {797},
             azimuth_initial = 0.379,
             elevation_initial = 0.364,
             supply_position = {-0.724, -0.180, 3.000},
             ejector_pos = {-1.055, -0.123, 0.008},
         }),
     },
     ammo_type = {
         _("Early"),
         _("Late"),
     },
	
	Tasks = {
        aircraft_task(GroundAttack),
        aircraft_task(RunwayAttack),
        aircraft_task(PinpointStrike),
        aircraft_task(CAS),
        aircraft_task(AFAC),
		aircraft_task(CAP),
        aircraft_task(Escort),
        aircraft_task(FighterSweep),
        aircraft_task(Intercept),
    },	
	DefaultTask = aircraft_task(Intercept),
	
	SFM_Data = {
		aerodynamics = 
		{
			Cy0	=	0.1,
			Mzalfa	=	4.355,
			Mzalfadt	=	0.8,
			kjx = 2.25,
			kjz = 0.00125,
			Czbe = -0.016,
			cx_gear = 0.0277,
			cx_flap = 0.095,
			cy_flap = 0.31,
			cx_brk = 0.06,
			table_data = {
			--      M		Cx0		 Cya		 B		 B4	      Omxmax	Aldop	Cymax
				{0  /666.739,	   0.0708,	0.0880,		  0.0069,	0.1382,	 0.15,	     18,    	1.7771,	},
				{10 /666.739,	   0.0708,	0.0880,		  0.0069,	0.1382,	 0.20,	     18,    	1.7771,	},
				{30 /666.739,	   0.0708,	0.0880,		  0.0069,	0.1382,	 0.30,	     18,    	1.7771,	},
				{50 /666.739,	   0.0708,	0.0880,		  0.0069,	0.1382,	 0.40,	     18,	    1.7771,	},
				{70 /666.739,	   0.0708,	0.0880,		  0.0069,	0.1382,	 0.50,	     18,	    1.7771,	},
				{80 /666.739,	   0.0708,	0.0880,		  0.0069,	0.1382,	 0.55,	     18,	    1.7771,	},
				{90 /666.739,	   0.0708,	0.0880,		  0.0069,	0.1382,	 0.60,	     18,	    1.7771,	},
				{100/666.739,	   0.0708,	0.0880,		  0.0069,	0.1382,	 0.65,	     18,	    1.7771,	},
				{110/666.739,	   0.0708,	0.0880,		  0.0069,	0.1382,	 0.70,	     18,	    1.7771,	},
				{130/666.739,	   0.0708,	0.0807,		  0.0069,	0.1382,	 0.90,	     18,	    1.6462,	},
				{150/666.739,	   0.0708,	0.0770,		  0.0069,	0.1382,	 1.2,	     18,	    1.5798,	},
				{170/666.739,	   0.0708,	0.0759,		  0.0069,	0.1382,	 1.2,	     18,	    1.5596,	},
				{190/666.739,	   0.0708,	0.0761,		  0.0069,	0.1382,	 1.6,	     18,	    1.5629,	},
				{210/666.739,	   0.0708,	0.0756,		  0.0069,	0.1382,	 2.1,	     18,	    1.5542,	},
				{220/666.739,	   0.0708,	0.0798,		  0.0069,	0.1382,	 2.1,	     18,	    1.6250,	},
				{230/666.739,	   0.0708,	0.0841,		  0.0069,	0.1382,	 2.1,	     18,	    1.7063,	},
				{240/666.739,	   0.0708,	0.0853,		  0.0069,	0.1382,	 2.6,	     17,	    1.7250,	},
				{250/666.739,	   0.0708,	0.0866,		  0.0069,	0.1382,	 2.6,	     16,	    1.7514,	},
				{270/666.739,	   0.0708,	0.0864,		  0.0069,	0.1382,	 2.6,	     15,	    1.7476,	},
				{290/666.739,	   0.0708,	0.0964,		  0.0069,	0.1382,	 3.1,	     14,	    1.9293,	},
				{310/666.739,	   0.0708,	0.1054,		  0.0069,	0.1382,	 3.5,	     12, 	    2.0907,	},
				{360/666.739,	   0.0708,	0.1054,		  0.0069,	0.1382,	 3.5,	     7,	 	    2.0907  },
				{600/666.739,	   0.0708,	0.1054,		  0.0069,	0.1382,	 3.5,	     1,	 	    2.0907  },
			}
		}, -- end of aerodynamics
		engine = 
		{
			Nmg		=	23.0,
			MinRUD	=	0,
			MaxRUD	=	1,
			MaksRUD	=	1,
			ForsRUD	=	1,
			type	=	"Piston",
			hMaxEng	=	12.0,
			dcx_eng	=	0.0015,
			cemax	=	0.37,
			cefor	=	0.37,
			dpdh_m	=	1800,
			dpdh_f	=	1800,
			k_adiab_1			= 0.037923,
			k_adiab_2			= 0.0562,
			MAX_Manifold_P_1	= 155774,		
			MAX_Manifold_P_2	= 206570,		
			MAX_Manifold_P_3	= 226648,		
			k_after_cool		= 0.54,
			Displ				= 27,
			k_Eps				= 6,
			Stroke				= 0.152,
			V_pist_0			= 12,
			Nu_0				= 1.2,
			Nu_1				= 0.9,
			Nu_2				= 0.001,
			N_indic_0			= 1023040,
			N_fr_0				= 0.072,
			N_fr_1				= 0.02,
			Init_Mom			= 220,
			D_prop				= 3.45,
			MOI_prop			= 65,
			k_gearbox			= 2.088,
			P_oil				= 495438,
			k_boost				= 3,
			k_cfug				= 0.003,
			k_oil				= 0.00004,
			k_piston			= 3000,
			k_reg				= 0.003,
			k_vel				= 0.017,
			table_data = 
			{
			--   M			Pmax
				{0.0,		16620.0},
				{0.1,		15600.0},
				{0.2,		14340.0},
				{0.3,		13320.0},
				{0.4,		12230.0},
				{0.5,		11300.0},
				{0.6,		10600.0},
				{0.7,		10050.0},
				{0.8,		 9820.0},
				{0.9,		 5902.0},
				{1.9,		 3469.0}
			},
            Startup_Prework = 15.0,
            Startup_RPMs = {
                {0.0, 0},
                {1.0, 60},
                {7.0, 60},
                {9.0, 400},
                {11.0, 880},
                {15.0, 550},
            },
            Startup_Ignition_Time = 8.0,
            Shutdown_Duration = 9.8,
                Nominal_RPM = 2700.0,
				prop_pitch_min		= 21.1,	-- prop pitch min, degrees 
				prop_pitch_max		= 45.0,	-- prop pitch max, degrees 
				prop_pitch_feather	= 0.0,	-- prop pitch feather position, degrees if feather < prop_pitch_max no feathering available
                prop_blades_count   = 3,
                prop_locations      = {
					{2.45, -0.06, 0.000}, {0.0, 0.0, math.rad(-1.87)},                    
                },
		}, -- end of engine
	},

	--damage , index meaning see in  Scripts\Aircrafts\_Common\Damage.lua
	Damage = {
		[0]		= {critical_damage = 5, args = {146}},
		[3]		= {critical_damage = 20,args = {65}}  ,
		[4]		= {critical_damage = 20, args = {150}},
		[5]		= {critical_damage = 20, args = {147}},
		[7]		= {critical_damage = 4, args = {249}} ,
		[9]		= {critical_damage = 3, args = {154}},
		[10]	= {critical_damage = 3, args = {153}},
		[11]	= {critical_damage = 3, args = {167}},
		[12]	= {critical_damage = 3, args = {161}},
		[15]	= {critical_damage = 5, args = {267}},
		[16]	= {critical_damage = 5, args = {266}},
		[23]	= {critical_damage = 8, args = {223}, deps_cells = {25}},
		[24]	= {critical_damage = 8, args = {213}, deps_cells = {26, 60}},
		[25]	= {critical_damage = 3, args = {226}},
		[26]	= {critical_damage = 3, args = {216}},
		[29]	= {critical_damage = 9, args = {224}, deps_cells = {31, 25, 23}},
		[30]	= {critical_damage = 9, args = {214}, deps_cells = {32, 26, 24, 60}},
		[31]	= {critical_damage = 4, args = {229}},
		[32]	= {critical_damage = 4, args = {219}},
		[35]	= {critical_damage = 10, args = {225}, deps_cells = {29, 31, 25, 23}},
		[36]	= {critical_damage = 10, args = {215}, deps_cells = {30, 32, 26, 24, 60}} ,
		[37]	= {critical_damage = 4, args = {227}},
		[38]	= {critical_damage = 4, args = {217}},
		[39]	= {critical_damage = 7,	args = {244}, deps_cells = {53}},
		[40]	= {critical_damage = 7, args = {241}, deps_cells = {54}},
		[45]	= {critical_damage = 9, args = {235}, deps_cells = {39, 51, 53}},
		[46]	= {critical_damage = 9, args = {233}, deps_cells = {40, 52, 54}},
		[51]	= {critical_damage = 3, args = {239}},
		[52]	= {critical_damage = 3, args = {237}},
		[53]	= {critical_damage = 3, args = {248}},
		[54]	= {critical_damage = 3, args = {247}},
		[55]	= {critical_damage = 20, args = {81}, deps_cells = {39, 40, 45, 46, 51, 52, 53, 54}},
		[59]	= {critical_damage = 5, args = {148}},
		[60]	= {critical_damage = 1, args = {144}},

		[83]	= {critical_damage = 3, args = {134}} ,-- nose wheel
		[84]	= {critical_damage = 3, args = {136}}, -- left wheel
		[85]	= {critical_damage = 3, args = {135}} ,-- right wheel
	},

	
	DamageParts = 
	{  
--DAMAGEOFF		[1] = "F4F-4-C-part-wing-R", -- wing R
--DAMAGEOFF		[2] = "F4F-4-C-part-wing-L", -- wing L
--DAMAGEOFF		[3] = "F4F-4-C-part-nose", -- nose
--DAMAGEOFF		[4] = "F4F-4-C-part-tail", -- tail
	},

	--Failures = {
	--},

	LandRWCategories = 
    {
        [1] = 
        {
            Name = "AircraftCarrier",
        }, -- end of [1]
    }, -- end of LandRWCategories
	TakeOffRWCategories = 
    {
        [1] = 
        {
            Name = "AircraftCarrier With Catapult",
        }, -- end of [1]
		[2] = 
        {
			Name = "AircraftCarrier With Tramplin",
        }, -- end of [2]
    }, -- end of TakeOffRWCategories
	

	lights_data = {
        typename = "collection",
        lights = {
			[WOLALIGHT_STROBES]	= {
				typename	=	"collection",
				lights 		= {
					{ typename = "argnatostrobelight", argument = 83, period = 1.2},		-- beacon lights
				},
			},--must be collection
			[WOLALIGHT_LANDING_LIGHTS]	= {
				typename	= 	"collection",
				lights		= {
					{ typename  = "argumentlight",	argument  = 51, },
				},
			},--must be collection
			[WOLALIGHT_TAXI_LIGHTS]	= {
				typename	= 	"collection",
				lights		= {
					{ typename  = "argumentlight",	argument  = 208, },
				},
			},--must be collection
			[WOLALIGHT_NAVLIGHTS]	= {
				typename 	= "collection",
				lights 		= {
					{ typename  = "argumentlight", argument  = 49, },				-- red
				},
			},--must be collection
			[WOLALIGHT_FORMATION_LIGHTS] = {
				typename	= "collection",
				lights		= {
					{ typename  = "argumentlight",	argument  = 88, },
				},		-- green bars
			},--must be collection

			-- STROBE / ANTI-COLLISION
			[WOLALIGHT_BEACONS] = {
				typename = "collection",
				lights = {
					-- 0 -- Anti-collision strobe
					{ typename = "argnatostrobelight", argument = 200, period = 0.4, flash_time = 0.1, },
				},
			},
        }
    },
		
	ViewSettings = ViewSettings,
	SnapViews	 = SnapViews,
	
	Countries = {"Abkhazia","Argentina","Australia","Austria","Belarus","Belgium","Brazil","Bulgaria","Canada","China", "Chile","Croatia",
                 "Czech Republic","Denmark","Egypt","Finland","France","Georgia","Germany","Greece","Hungary",
                 "India","Insurgents","Iran","Iraq","Israel","Italy","Japan","Kazakhstan","The Netherlands","North Korea",
                 "Norway","Pakistan","Poland","Romania","Russia","Saudi Arabia","Serbia","Slovakia","South Korea",
                 "South Ossetia","Spain","Sweden","Switzerland","Syria","Turkey","UK","Ukraine","USA","USAF Aggressors"},
}

add_aircraft(F4F_4_C)
