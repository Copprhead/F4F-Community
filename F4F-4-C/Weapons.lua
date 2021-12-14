 
 declare_weapon({category = CAT_SHELLS, name = "M2_Ball", user_name = _("M2_Ball"),
     model_name      = "tracer_bullet_A-10",
     projectile      = "Ball",
     mass            = 0.046,
     round_mass      = 0.117 + 0.020,
     cartridge_mass  = 0.012 + 0.000,
     explosive       = 0,
     v0              = 823.5,
     Dv0             = 0.0082,
     Da0             = 0.00085,
     Da1             = 0.0,
     life_time       = 7.0,
     caliber         = 12.7,
     s               = 0.0,
     j               = 0.0,
     l               = 0.0,
     charTime        = 0,
     cx              = {0.5, 0.61, 0.80, 0.17, 2.0},
     k1              = 1.4e-08,
     tracer_off      = -1,
     tracer_on       = 0.1,
     smoke_tail_life_time = 0,
     scale_tracer    = 0,
     cartridge       = 0,
     scale_smoke     = 0.1,
     smoke_opacity   = 0.1,
 })
 
 declare_weapon({category = CAT_SHELLS, name = "M2_AP", user_name = _("M2_AP"),
     model_name      = "tracer_bullet_A-10",
     projectile      = "AP",
     mass            = 0.0458,
     round_mass      = 0.117 + 0.020,
     cartridge_mass  = 0.012 + 0.000,
     explosive       = 0,
     v0              = 830.0,
     Dv0             = 0.0082,
     Da0             = 0.00085,
     Da1             = 0.0,
     life_time       = 7.0,
     caliber         = 12.7,
     s               = 0.0,
     j               = 0.0,
     l               = 0.0,
     charTime        = 0,
     cx              = {0.5, 0.61, 0.80, 0.17, 2.0},
     k1              = 1.4e-08,
     tracer_off      = -1,
     tracer_on       = 0.1,
     smoke_tail_life_time = 0,
     scale_tracer    = 0,
     cartridge       = 0,
     scale_smoke     = 0.1,
     smoke_opacity   = 0.1,
 })
 
 
 declare_weapon({category = CAT_SHELLS, name = "M1_Incendiary", user_name = _("M1_Incendiary"),
     model_name      = "tracer_bullet_A-10",
     projectile      = "AP",
     mass            = 0.0403,
     round_mass      = 0.114 + 0.020,
     cartridge_mass  = 0.012 + 0.000,
     payload         = 0.001,
     payloadEffect   = "Thermal",
     payloadMaterial = "Thermite",
     v0              = 860.0,
     Dv0             = 0.0082,
     Da0             = 0.00085,
     Da1             = 0.0,
     life_time       = 7.0,
     caliber         = 12.7,
     s               = 0.0,
     j               = 0.0,
     l               = 0.0,
     charTime        = 0,
     cx              = {0.5, 0.61, 0.80, 0.17, 2.0},
     k1              = 1.35e-08,
     tracer_off      = -1,
     tracer_on       = 0.1,    
     smoke_tail_life_time = 0,
     scale_tracer    = 0,
     cartridge       = 0,
     scale_smoke     = 0.1,
     smoke_opacity   = 0.1,
 })
 
 declare_weapon({category = CAT_SHELLS, name = "M1_Tracer", user_name = _("M1_Tracer"),
     model_name      = "tracer_bullet_red",
     projectile      = "Ball",
     mass            = 0.046,
     round_mass      = 0.117 + 0.020,
     cartridge_mass  = 0.012 + 0.000,
     explosive       = 0,
     v0              = 823.5,
     Dv0             = 0.0082,
     Da0             = 0.00085,
     Da1             = 0.0,
     life_time       = 7.0,
     caliber         = 12.7,
     s               = 0.0,
     j               = 0.0,
     l               = 0.0,
     charTime        = 0,
     cx              = {0.5, 0.61, 0.80, 0.17, 2.0},
     k1              = 1.4e-08,
     tracer_off      = 4.0,
     tracer_on       = 0.1,
     smoke_tail_life_time = 0.5,
     scale_tracer    = 1,
     cartridge       = 0,
     scale_smoke     = 0.1,
     smoke_opacity   = 0.1,
 })
 
 function Browning_AN_M2(tbl)
 
 	tbl.category = CAT_GUN_MOUNT 
 	tbl.name 	 = "Browning_AN_M2"
 	tbl.display_name = _(".50 Browning AN/M2")
    tbl.supply = {
         shells = {
             "M2_Ball",
             "M2_AP",
 			"M1_Incendiary",
             "M1_Tracer",
         },
         mixes = {{1, 2, 3, 4}},
         count = 100,
     }
 	if tbl.mixes then 
 	   tbl.supply.mixes =  tbl.mixes
 	   tbl.mixes	    = nil
 	end
 	if tbl.count then
         tbl.supply.count = tbl.count
         tbl.count = nil
     end
 	tbl.gun = {
         max_burst_length = 9999, -- some large number
         rates = {700}, -- 600 to 800
         recoil_coeff = 0.9,
         barrels_count = 1,
     }
     if tbl.rates then
         tbl.gun.rates = tbl.rates
         tbl.rates = nil
     end
 	tbl.ejector_pos = tbl.ejector_pos or {-0.5, -0.5, 0.0}
     tbl.ejector_dir = tbl.ejector_dir or {0, -1, 0} -- ejector at bottom
     tbl.supply_position = tbl.supply_position or {0.0, 0.0, 0.0}
     tbl.aft_gun_mount = false
     tbl.effective_fire_distance = 1000
     tbl.drop_cartridge = tbl.drop_cartridge or 204
     if tbl.muzzle_pos_connector ~= nil then
         tbl.muzzle_pos = {0, 0, 0}
     end
     tbl.azimuth_initial = tbl.azimuth_initial or 0
     tbl.elevation_initial = tbl.elevation_initial or 0
     if tbl.effects == nil then
         tbl.effects = {
             {name = "HeatEffectExt", shot_heat = 7.823, barrel_k = 0.462 * 6.0, body_k = 0.462 * 32.0},
             {name = "FireEffect", arg = tbl.effect_arg_number or 436, duration = 0.02, attenuation = 2.0, light_pos = {0.5, 0.0, 0.0}},
             {name = "SmokeEffect"},
         }
     end
 
     return declare_weapon(tbl)
 end
 