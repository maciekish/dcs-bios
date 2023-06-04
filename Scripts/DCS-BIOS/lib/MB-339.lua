BIOS.protocol.beginModule("MB-339", 0x8200)
BIOS.protocol.setExportModuleAircrafts({"MB-339A", "MB-339APAN"})
--by WarLord v1.0a
local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineFloat = BIOS.util.defineFloat
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter
local define3PosTumb = BIOS.util.define3PosTumb
local defineSpringloaded_3PosTumb = BIOS.util.defineSpringloaded_3PosTumb

-- remove Arg# Pilot 1000 / Copilot 1002

----------------------------------------- Extra Functions
local function defineIndicatorLightGear(msg, arg_number, category, description) --red
	local value = moduleBeingDefined.memoryMap:allocateInt {
		maxValue = 1
	}
	assert(value.shiftBy ~= nil)
	moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function(dev0)
		if dev0:get_argument_value(arg_number) >= 0.5 and dev0:get_argument_value(arg_number) < 0.9 then
			value:setValue(1)
		else
		    value:setValue(0)
		end
	end
	document {
		identifier = msg,
		category = category,
		description = description,
		control_type = "led",
		inputs = {},
		outputs = {
			{ ["type"] = "integer",
			  suffix = "",
			  address = value.address,
			  mask = value.mask,
			  shift_by = value.shiftBy,
			  max_value = 1,
			  description = "Multi Led Color 1; Light is on between 0.4 and 0.59"
			}
		}
	}
end

--Breakers
defineToggleSwitch("CB_IFF", 1, 3911, 1114, "Circuit Breakers", "C/B IFF")
defineToggleSwitch("CB_HYD_PRESS", 1, 3912, 1115, "Circuit Breakers", "C/B Hyd Press")
defineToggleSwitch("CB_OIL_PRESS", 1, 3913, 1116, "Circuit Breakers", "C/B Oil Press")
defineToggleSwitch("CB_HSI", 1, 3914, 1121, "Circuit Breakers", "C/B HSI")
defineToggleSwitch("CB_ADI", 1, 3915, 1122, "Circuit Breakers", "C/B ADI")
defineToggleSwitch("CB_FD_CMPTR", 1, 3916, 1123, "Circuit Breakers", "C/B F/D Cmptr")
defineToggleSwitch("CB_SIGHT", 1, 3917, 1124, "Circuit Breakers", "C/B Sight")
defineToggleSwitch("CB_AHR_GPS", 1, 3918, 1125, "Circuit Breakers", "C/B AHR/GPS")
defineToggleSwitch("CB_HSI_COMD", 1, 3919, 1126, "Circuit Breakers", "C/B HSI/COMD")
defineToggleSwitch("CB_VOR_ILS", 1, 3920, 1127, "Circuit Breakers", "C/B VOR ILS")
defineToggleSwitch("CB_UTIL_PW", 1, 3921, 1131, "Circuit Breakers", "C/B Util Pwr")
defineToggleSwitch("CB_TACAN", 1, 3922, 1132, "Circuit Breakers", "C/B TACAN")
defineToggleSwitch("CB_FORM_LT", 1, 3923, 1134, "Circuit Breakers", "C/B Form Lt")
defineToggleSwitch("CB_AHR_GPS", 1, 3924, 1135, "Circuit Breakers", "C/B AHR/GPS")
defineToggleSwitch("CB_ADF", 1, 3925, 1136, "Circuit Breakers", "C/B ADF")
defineToggleSwitch("CB_TACAN", 1, 3922, 1132, "Circuit Breakers", "C/B TACAN")
defineToggleSwitch("CB_STBY_ATT_FWD", 1, 3929, 1213, "Circuit Breakers", "C/B Fwd Stby Att Ind")
defineToggleSwitch("CB_STBY_ATT_AFT", 1, 3930, 1214, "Circuit Breakers", "C/B Aft Stby Att Ind")
defineToggleSwitch("CB_COMM2", 1, 3931, 1215, "Circuit Breakers", "C/B COMM2")
defineToggleSwitch("CB_IFF_2", 1, 3933, 1217, "Circuit Breakers", "C/B IFF 2")
defineToggleSwitch("CB_WING_FLAP", 1, 3934, 1221, "Circuit Breakers", "C/B Wing Flap")
defineToggleSwitch("CB_SPD_BRAKE", 1, 3935, 1222, "Circuit Breakers", "C/B Spd Brake")
defineToggleSwitch("CB_POS_IND", 1, 3936, 1223, "Circuit Breakers", "C/B Pos Ind")
defineToggleSwitch("CB_LG", 1, 3937, 1224, "Circuit Breakers", "C/B LG")
defineToggleSwitch("CB_LG_DN_MON", 1, 3938, 1225, "Circuit Breakers", "C/B LG Down Mon")
defineToggleSwitch("CB_FUEL_QTY", 1, 3939, 1226, "Circuit Breakers", "C/B Fuel Qty")
defineToggleSwitch("CB_JPT_IND", 1, 3940, 1227, "Circuit Breakers", "C/B Jpt Ind")
defineToggleSwitch("CB_AIR_COND", 1, 3941,1231, "Circuit Breakers", "C/B Air Cond")
defineToggleSwitch("CB_ENG_START", 1, 3942,1232, "Circuit Breakers", "C/B Eng Start")
defineToggleSwitch("CB_DUMP_OFF", 1, 3946,1236, "Circuit Breakers", "C/B Dump Shut-Off")
defineToggleSwitch("CB_OXY_PRESS", 1, 3949,1242, "Circuit Breakers", "C/B Oxy Press")
defineToggleSwitch("CB_ARMT_SEL", 1, 3950,1243, "Circuit Breakers", "C/B Armt Sel")
defineToggleSwitch("CB_FUEL_PUMP", 1, 3951,1244, "Circuit Breakers", "C/B Fuel Pump")
defineToggleSwitch("CB_STORE_JETT", 1, 3952,1245, "Circuit Breakers", "C/B Store Jett")
defineToggleSwitch("CB_INV_MAIN", 1, 3953,1246, "Circuit Breakers", "C/B Main Inv")
defineToggleSwitch("CB_INV_STBY", 1, 3954,1247, "Circuit Breakers", "C/B Stby Inv")
defineToggleSwitch("CB_TRIM_A_E", 1, 3955,1251, "Circuit Breakers", "C/B Ail & Elev Trim")
defineToggleSwitch("CB_AIL_SERVO", 1, 3956,1252, "Circuit Breakers", "C/B Ail Servo")
defineToggleSwitch("CB_CAUTION_L", 1, 3957,1253, "Circuit Breakers", "C/B Caution Lt")
defineToggleSwitch("CB_INV_CONTR_MAIN", 1, 3959,1255, "Circuit Breakers", "C/B Main Inv Contr")
defineToggleSwitch("CB_INV_CONTR_STBY", 1, 3961,1257, "Circuit Breakers", "C/B Stby Inv Contr")
defineToggleSwitch("CB_ANTI_SKID", 1, 3962,1411, "Circuit Breakers", "C/B Anti-Skid")
defineToggleSwitch("CB_AC_PRI_BUS", 1, 3963,1412, "Circuit Breakers", "C/B AC Pri Bus")
defineToggleSwitch("CB_LDG_L_MTR", 1, 3965,1414, "Circuit Breakers", "C/B Ldg Lt Mtr")
defineToggleSwitch("CB_BCN", 1, 3966,1415, "Circuit Breakers", "C/B Bcn")
defineToggleSwitch("CB_NAV_L", 1, 3967,1416, "Circuit Breakers", "C/B Nav Lt")
defineToggleSwitch("CB_AOA", 1, 3973,1431, "Circuit Breakers", "C/B AOA")
defineToggleSwitch("CB_NW_STEER", 1, 3974,1432, "Circuit Breakers", "C/B NW Steer")
defineToggleSwitch("CB_JPT_LIMIT", 1, 3975,1433, "Circuit Breakers", "C/B JPT Limiter")
defineToggleSwitch("CB_FUEL_FLOW_IND", 1, 3977,1435, "Circuit Breakers", "C/B Fuel Flow ind")
defineToggleSwitch("CB_FUEL_TRANS", 1, 3978,1436, "Circuit Breakers", "C/B Fuel Trans")
defineToggleSwitch("CB_TRIM_R", 1, 3979,1437, "Circuit Breakers", "C/B Rud Trim")
defineToggleSwitch("CB_TAXI_L", 1, 3982,1445, "Circuit Breakers", "C/B Taxi Lt")
defineToggleSwitch("CB_LDG_L", 1, 3983,1446, "Circuit Breakers", "C/B Ldg Lt")
defineToggleSwitch("CB_PITOT_FWD", 1, 3984,1452, "Circuit Breakers", "C/B Fwd Pitot")
defineToggleSwitch("CB_PITOT_AFT", 1, 3985,1453, "Circuit Breakers", "C/B Aft Pitot")
defineToggleSwitch("CB_ENG_ANTI_ICE", 1, 3986,1454, "Circuit Breakers", "C/B Engine Anti-Ice")
defineToggleSwitch("CB_WHSLD_DEM", 1, 3987,1455, "Circuit Breakers", "C/B Whsld Dem")
defineToggleSwitch("CB_ICE_DETR", 1, 3988,1456, "Circuit Breakers", "C/B Ice Detr")
defineToggleSwitch("CB_SIGHT", 1, 3989,1457, "Circuit Breakers", "C/B Sight")
defineToggleSwitch("CB_CDU_FWD", 1, 3990,1511, "Circuit Breakers", "C/B Fwd Cdu")
defineToggleSwitch("CB_CDU_AFT", 1, 3991,1512, "Circuit Breakers", "C/B Aft Cdu")
defineToggleSwitch("CB_AHR_GPS", 1, 3992,1513, "Circuit Breakers", "C/B AHR/GPS")
defineToggleSwitch("CB_COMM_RDU", 1, 3995,1522, "Circuit Breakers", "C/B COMM RDU")

--Electrical
defineToggleSwitch("BATTERY_SW", 1, 3095, 300, "Electrical", "Battery Switch")
defineToggleSwitch("GEN1_SW", 1, 3096, 301, "Electrical", "Generator 1 Switch")
defineToggleSwitch("GEN2_SW", 1, 3097, 302, "Electrical", "Generator 2 Switch")
defineToggleSwitch("AC_PW_SW", 1, 3098, 303, "Electrical", "AC Power Switch")
defineToggleSwitch("BUS_RESET_SW", 1, 3099, 231, "Electrical", "Bus Reset Switch")
defineToggleSwitch("BUS_RESET_CV", 1, 3100, 233, "Electrical", "Bus Reset Cover")

--Simple avionics
defineRotary("FW_SET_INDEX", 1, 3101, 541, "Avionics FW", "Forward Set Index")
defineRotary("FW_ALT_KNOB", 1, 3102, 241, "Avionics FW", "Forward Altimeter Pressure Setting")
definePushButton("FW_G_RESET", 1, 3104, 259, "Avionics FW", "Forward Reset Min/Max G")

defineFloat("FW_ALT_100_G", 50, {0, 1}, "Avionics Gauges FW", "Forward Altimeter 100 ft count Needle")
defineFloat("FW_ALT_1000_G", 52, {0, 1}, "Avionics Gauges FW", "Forward Altimeter 1000 ft count")
defineFloat("FW_ALT_10000_G", 53, {0, 1}, "Avionics Gauges FW", "Forward Altimeter 10000 ft count")

defineRotary("AFT_ALTIMETER_KNOB", 1, 3103, 570, "Avionics AFT", "Aft Altimeter Pressure Setting")
definePushButton("AFT_G_RESET", 1, 3105, 691, "Avionics AFT", "Aft Reset Min/Max G")

defineFloat("FLAP_G", 1, {0, 1}, "Avionics Gauges", "Flaps Position Indicator")
defineFloat("SPEED_BRK_G", 2, {0, 1}, "Avionics Gauges", "Speed Brake Position Indicator")
defineFloat("LONG_TRIM_G", 3, {-1, 1}, "Avionics Gauges", "Longitudinal Trim Indicator")
defineFloat("ACCEL_G", 6, {-1, 1}, "Avionics Gauges", "Accelerometer")
defineFloat("FLAP_LVR_G", 7, {0, 1}, "Avionics Gauges", "Flaps Lever")
defineFloat("FW_AIR_SPEED_IND_G", 8, {0, 1}, "Avionics Gauges FW", "Forward Mach Airspeed Indicator")
defineFloat("FW_ADI_PITCH_G", 9, {-1, 1}, "Avionics Gauges FW", "Forward ADI Pitch")
defineFloat("FW_ADI_BANK_G", 10, {-1, 1}, "Avionics Gauges FW", "Forward ADI Bank")
defineFloat("FW_ADI_GS_G", 11, {-1, 1}, "Avionics Gauges FW", "Forward ADI Glide Slope Indicator")
defineFloat("AFT_ADI_GS_G", 12, {-1, 1}, "Avionics Gauges AFT", "Aft ADI Glide Slope Indicator")
defineFloat("AFT_ADI_TURN_G", 13, {-1, 1}, "Avionics Gauges AFT", "Aft ADI Rate-of-Turn Indicator")
defineFloat("TACHO_RPM_G", 16, {0, 1}, "Avionics Gauges", "Tachometer Percent RPM")
defineFloat("AFT_ALT_CFLAG_G", 19, {0, 1}, "Avionics Gauges AFT", "Aft Altimeter CODE OFF Flag")
defineFloat("ADI_OFF_G", 21, {0, 1}, "Avionics Gauges", "ADI OFF Flag")
defineFloat("FW_ADI_GS_WARN_G", 22, {0, 1}, "Avionics Gauges", "Forward ADI Glide Slope Warning Flag")
defineFloat("FW_ADI_FD_FLAG_G", 23, {0, 1}, "Avionics Gauges", "Forward ADI Flight Director Flag")
defineFloat("TACHO_G", 33, {0, 1}, "Avionics Gauges", "Tachometer")
defineFloat("HYD_PRESS_MAIN_G", 150, {0, 1}, "Avionics Gauges", "Main Hydraulic Pressure Gauge")
defineFloat("HYD_PRESS_EMERG_G", 151, {0, 1}, "Avionics Gauges", "Emergency Hydraulic Pressure Gauge")
defineFloat("OIL_PRESS_G", 152, {0, 1}, "Avionics Gauges", "Oil Pressure Gauge")
defineFloat("OXY_PRESS_G", 153, {0, 1}, "Avionics Gauges", "Oxygen Pressure Gauge")

--Chrono
definePushButton("FW_CLOCK_BTN", 1, 3106, 44, "Clock FW", "Forward Clock Start/Stop/Reset")
defineToggleSwitch("FW_CLOCK_SET_PULL", 1, 3107, 45, "Clock FW", "Forward Clock Set Pull")
defineRotary("FW_CLOCK_SET_KNOB", 1, 3108, 51, "Clock FW", "Forward Clock Set Rotate")

defineFloat("FW_CLOCK_M_G", 46, {0, 1}, "Clock Gauges FW", "Forward Clock Minutes Indicator")
defineFloat("FW_CLOCK_H_G", 47, {0, 1}, "Clock Gauges FW", "Forward Clock Hours Indicator")
defineFloat("FW_CLOCK_S_G", 48, {0, 1}, "Clock Gauges FW", "Forward Clock Seconds Indicator")
defineFloat("FW_CLOCK_SET_G", 49, {0, 1}, "Clock Gauges FW", "Forward Clock Set Indicator")

definePushButton("AFT_CLOCK_BTN", 1, 3109, 28, "Clock AFT", "Aft Clock Start/Stop/Reset")
defineToggleSwitch("AFT_CLOCK_SET_PULL", 1, 3110, 29, "Clock AFT", "Aft Clock Set Pull")
defineRotary("AFT_CLOCK_SET_KNOB", 1, 3111, 30, "Clock AFT", "Aft Clock Set Rotate")

defineFloat("AFT_CLOCK_M_G", 24, {0, 1}, "Clock Gauges AFT", "Aft Clock Minutes Indicator")
defineFloat("AFT_CLOCK_H_G", 25, {0, 1}, "Clock Gauges AFT", "Aft Clock Hours Indicator")
defineFloat("AFT_CLOCK_S_G", 26, {0, 1}, "Clock Gauges AFT", "Aft Clock Seconds Indicator")
defineFloat("AFT_CLOCK_SET_G", 27, {0, 1}, "Clock Gauges AFT", "Aft Clock Set Indicator")

-- ADI
definePotentiometer("FW_ADI_PITCH", 1, 3112, 15, {0, 1}, "ADI FW", "Forward ADI Pitch Adjustment")
defineToggleSwitch("FW_ADI_CAGE", 1, 3114, 403, "ADI FW", "Forward ADI Cage")
definePotentiometer("FW_ADI_ADJUST", 1, 3115, 401, {-1, 1}, "ADI FW", "Forward ADI Adjust")

definePotentiometer("AFT_ADI_PITCH", 1, 3113, 388, {0, 1}, "ADI AFT", "Aft ADI Pitch Adjustment")
defineToggleSwitch("AFT_ADI_CAGE", 1, 3116, 404, "ADI AFT", "Aft ADI Cage")
definePotentiometer("AFT_ADI_ADJUST", 1, 3117, 402, {-1, 1}, "ADI AFT", "Aft ADI Adjust")

--HSI
defineRotary("FW_HSI_HDG", 1, 3118, 362, "HSI FW", "Forward HSI Heading Set")
defineRotary("FW_HSI_CRS", 1, 3119, 353, "HSI FW", "Forward HSI Course Set")
definePushButton("FW_HSI_TCN", 1, 3219, 346, "HSI FW", "Forward HSI TACAN")
definePushButton("FW_HSI_VOR", 1, 3220, 347, "HSI FW", "Forward HSI VOR")
definePushButton("FW_HSI_RNAV", 1, 3221, 348, "HSI FW", "Forward HSI RNAV")

defineRotary("AFT_HSI_HDG", 1, 3120, 196, "HSI AFT", "Aft HSI Heading Set")
defineRotary("AFT_HSI_CRS", 1, 3121, 187, "HSI AFT", "Aft HSI Course Set")
definePushButton("AFT_HSI_TCN", 1, 3222, 57, "HSI AFT", "Aft HSI TACAN")
definePushButton("AFT_HSI_VOR", 1, 3223, 58, "HSI AFT", "Aft HSI VOR")
definePushButton("AFT_HSI_RNAV", 1, 3224, 59, "HSI AFT", "Aft HSI RNAV")

defineIndicatorLightGear("AFT_HSI_TCN_L", 54, "HSI Lights AFT", "Aft HSI TACAN Light (green)")
defineIndicatorLightGear("AFT_HSI_VOR_L", 55, "HSI Lights AFT", "Aft HSI VOR Light (green)")
defineIndicatorLightGear("AFT_HSI_RNAV_L", 56, "HSI Lights AFT", "Aft HSI RNAVv")

--Flight dir
definePushButton("FW_FD_HDG", 1, 3122, 333, "Flight Dir FW", "Forward F/D HDG")
definePushButton("FW_FD_GS_ARM", 1, 3123, 334, "Flight Dir FW", "Forward F/D GS ARM")
definePushButton("FW_FD_STBY", 1, 3124, 335, "Flight Dir FW", "Forward F/D STBY")
definePushButton("FW_FD_RADIO_NAV", 1, 3125, 336, "Flight Dir FW", "Forward F/D RADIO NAV")
definePushButton("FW_FD_GS", 1, 3126, 337, "Flight Dir FW", "Forward F/D GS")
definePushButton("FW_FD_ALT_HOLD", 1, 3127, 338, "Flight Dir FW", "Forward F/D ALT HOLD")

definePushButton("AFT_FD_HDG", 1, 3128, 693, "Flight Dir AFT", "Aft F/D HDG")
definePushButton("AFT_FD_GS_ARM", 1, 3129, 695, "Flight Dir AFT", "Aft F/D GS ARM")
definePushButton("AFT_FD_STBY", 1, 3130, 697, "Flight Dir AFT", "Aft F/D STBY")
definePushButton("AFT_FD_RADIO_NAV", 1, 3131, 699, "Flight Dir AFT", "Aft F/D RADIO NAV")
definePushButton("AFT_FD_GS", 1, 3132, 701, "Flight Dir AFT", "Aft F/D GS")
definePushButton("AFT_FD_ALT_HOLD", 1, 3133, 703, "Flight Dir AFT", "Aft F/D ALT HOLD")

--Fuel
defineMultipositionSwitch("FW_FUEL_TANK_SEL", 1, 3134, 257, 5, 0.25, "Fuel FW", "Forward Fuel Tank Selector")
definePushButton("FW_FUEL_TEST", 1, 3135, 258, "Fuel FW", "Forward Fuel Quantity Test")
defineToggleSwitch("FW_FUEL_OFF_SW", 1, 3138, 248, "Fuel FW", "Foreward Fuel Shut-Off Switch")
defineToggleSwitch("FW_FUEL_OFF_CVR", 1, 3139, 237, "Fuel FW", "Foreward Fuel Shut-Off Guard")
defineToggleSwitch("FW_FUEL_TRANS", 1, 3142, 249, "Fuel FW", "Foreward Fuel Transfer")
defineToggleSwitch("FW_FUEL_DUMP", 1, 3143, 593, "Fuel FW", "Foreward Fuel Dump")

defineMultipositionSwitch("AFT_FUEL_TANK_SEL", 1, 3136, 328, 5, 0.25, "Fuel AFT", "Aft Fuel Tank Selector")
definePushButton("AFT_FUEL_TEST", 1, 3137, 374, "Fuel AFT", "Aft Fuel Quantity Test")
defineToggleSwitch("AFT_FUEL_OFF_SW", 1, 3140, 516, "Fuel AFT", "Aft Fuel Shut-Off Switch")
defineToggleSwitch("AFT_FUEL_OFF_CVR", 1, 3141, 517, "Fuel AFT", "Aft Fuel Shut-Off Guard")
defineToggleSwitch("AFT_FUEL_DUMP", 1, 3144, 160, "Fuel AFT", "Aft Fuel Dump")

--L/G & Ground
defineToggleSwitch("FW_LG_GEAR_LVR", 1, 3154, 4, "Gear FW", "Foreward Gear Lever")
defineToggleSwitch("FW_LG_ASKID", 1, 3145, 250, "Gear FW", "Foreward Anti-Skid")
definePotentiometer("FW_LG_PBRAKE", 1, 3147, 266, {0, 1}, "Gear FW", "Forward Parking Brake Pull")
defineToggleSwitch("FW_LG_PBRAKE_LOCK", 1, 3148, 263, "Gear FW", "Foreward Parking Brake Lock")
defineToggleSwitch("FW_LG_EMERG_GEAR", 1, 3149, 681, "Gear FW", "Foreward Emergency Landing Gear")
definePushButton("FW_LG_DL_OVERRIDE", 1, 5000, 379, "Gear FW", "Foreward Down-Lock Override")
defineSpringloaded_3PosTumb("FW_RUDDER_TRIM", 1, 3151, 3150, 540, "Gear FW", "Foreward Rudder Trim")

defineToggleSwitch("AFT_LG_GEAR_LVR", 1, 3154, 106, "Gear AFT", "Aft Gear Lever")
defineToggleSwitch("AFT_LG_ASKID", 1, 3146, 518, "Gear AFT", "Aft Anti-Skid")
definePushButton("AFT_LG_DL_OVERRIDE", 1, 5001, 14, "Gear AFT", "Aft Down-Lock Override")
defineSpringloaded_3PosTumb("AFT_RUDDER_TRIM", 1, 3152, 3153, 519, "Gear AFT", "Aft Rudder Trim")

defineIndicatorLightGear("NOSE_GEAR_L", 20, "Gear Light", "Nose Gear Light (green)")
defineIndicatorLightGear("RIGHT_GEAR_L", 31, "Gear Light", "Right Gear Light (green)")
defineIndicatorLightGear("LEFT_GEAR_L", 32, "Gear Light", "Left Gear Light (green)")
defineIndicatorLightGear("GEAR_HND_L", 42, "Gear Light", "Gear Handle Light (red)")

--Lights
define3PosTumb("FW_LIGHT_TAXI_LAND", 1, 3156, 321, "Lights FW", "Forward Taxi/Landing Lights")
definePotentiometer("FW_LIGHT_FORMATION", 1, 3157, 502, {0, 1}, "Lights FW", "Forward Formation Lights")
definePotentiometer("FW_LIGHT_INSTRUMENT", 1, 3158, 503, {0, 1}, "Lights FW", "Forward Instruments Lights")
definePotentiometer("FW_LIGHT_FLOOD", 1, 3159, 504, {0, 1}, "Lights FW", "Forward Flood Lights")
definePotentiometer("FW_LIGHT_CONSOLE", 1, 3160, 505, {0, 1}, "Lights FW", "Forward Console Lights")
defineToggleSwitch("FW_LIGHT_NAV_FLASH", 1, 3167, 41, "Lights FW", "Forward Nav Lights Flash/Steady")
define3PosTumb("FW_LIGHT_NAV_BRIGHT", 1, 3168, 40, "Lights FW", "Forward Nav Lights Bright/Dim")
defineToggleSwitch("FW_LIGHT_BEACON", 1, 3169, 685, "Lights FW", "Forward Beacon Lights")
defineToggleSwitch("FW_LIGHT_WARN_BRIGHT", 1, 3170, 322, "Lights FW", "Forward Warn Lights Bright/Dim")

definePotentiometer("AFT_LIGHT_INSTRUMENT", 1, 3161, 510, {0, 1}, "Lights AFT", "Aft Instruments Lights")
definePotentiometer("AFT_LIGHT_FLOOD", 1, 3162, 512, {0, 1}, "Lights AFT", "Aft Flood Lights")
definePotentiometer("AFT_LIGHT_CONSOLE", 1, 3163, 511, {0, 1}, "Lights AFT", "Aft Console Lights")
defineToggleSwitch("AFT_LIGHT_WARN_BRIGHT", 1, 3171, 107, "Lights AFT", "Aft Warn Lights Bright/Dim")

--Warning panel
definePushButton("WARN_L_TEST", 1, 3172, 304, "Warning Panel", "Warn Lights Test")
definePushButton("FW_MASTER_CAUTION", 1, 3173, 591, "Warning Panel", "Forward Master Caution Reset")
definePushButton("AFT_MASTER_CAUTION", 1, 3173, 591, "Warning Panel", "Aft Master Caution Reset")
definePushButton("WARN_SILENT", 1, 3177, 382, "Warning Panel", "Warning Silence")

--Engine
defineToggleSwitch("ENG_MASTER", 1, 3178, 238, "Engine", "Engine Master")
defineToggleSwitch("ENG_JPT_LIMIT", 1, 3179, 240, "Engine", "JPT Limiter")
definePushButton("ENG_START", 1, 3180, 239, "Engine", "Engine Start")

--Flight Controls
defineToggleSwitch("FW_FC_CANOPY_LOCK", 1, 3181, 182, "Flight Controls FW", "Forward Canopy LOCK/UNLOCK")
defineToggleSwitch("FW_FC_CANOPY_HOOK", 1, 3182, 183, "Flight Controls FW", "Forward Partial Opening Hook")
definePushButton("FW_FC_CANOPY_UNLOCK", 1, 5002, 582, "Flight Controls FW", "Forward Canopy UNLOCK")
defineToggleSwitch("FW_FC_CANOPY_HND", 1, 3183, 750, "Flight Controls FW", "Forward Canopy Handle")
defineToggleSwitch("FW_FC_LOCK", 1, 3186, 232, "Flight Controls FW", "Forward Flight Controls LOCK/UNLOCK")
defineToggleSwitch("FW_FC_MIRRORS", 1, 3187, 400, "Flight Controls FW", "Forward Mirrors OPEN/CLOSE")
defineToggleSwitch("FW_FC_AILERON_SERVO_CV", 1, 3193, 235, "Flight Controls FW", "Forward Aileron Servo Guard")
defineToggleSwitch("FW_FC_AILERON_SERVO", 1, 3194, 260, "Flight Controls FW", "Forward Aileron Servo Switch")

defineToggleSwitch("AFT_FC_CANOPY_LOCK", 1, 3184, 43, "Flight Controls AFT", "Aft Canopy LOCK/UNLOCK")
defineToggleSwitch("AFT_FC_MIRRORS", 1, 3187, 594, "Flight Controls AFT", "Aft Mirrors OPEN/CLOSE")
defineToggleSwitch("AFT_FC_AILERON_SERVO_CV", 1, 3195, 288, "Flight Controls AFT", "Aft Aileron Servo Guard")
defineToggleSwitch("AFT_FC_AILERON_SERVO", 1, 3196, 289, "Flight Controls AFT", "Aft Aileron Servo Switch")

--Pressurisation
defineToggleSwitch("PRESS_RAMAIR_SCOOP", 1, 3197, 590, "Pressurisation", "Ram Air Scoop")
defineToggleSwitch("PRESS_CABIN_PRESS", 1, 3198, 264, "Pressurisation", "Cabin Pressure Switch")
defineToggleSwitch("PRESS_CABIN_PRESS_CVR", 1, 3199, 234, "Pressurisation", "Cabin Pressure Switch Guard")
definePotentiometer("PRESS_CABIN_TEMP", 1, 3200, 179, {0, 1}, "Pressurisation", "Cabin Temp")

--Smoke
defineToggleSwitch("SMOKE_MASTER", 1, 3201, 330, "Smoke", "Smoke Master Switch")
defineToggleSwitch("SMOKE_WHITE", 1, 3202, 331, "Smoke", "Smoke White Switch")
defineToggleSwitch("SMOKE_COLOR", 1, 3203, 332, "Smoke", "Smoke Color Switch")

--Anti Ice
define3PosTumb("AI_ENG_AICE", 1, 3204, 262, "Anti Ice", "Engine Anti-Ice")
define3PosTumb("AI_FW_PITOT_AICE", 1, 3205, 261, "Anti Ice", "Front Pitot Anti-Ice")
define3PosTumb("AI_AFT_PITOT_AICE", 1, 3206, 149, "Anti Ice", "Rear Pitot Anti-Ice")
define3PosTumb("AI_WS_DEMIST", 1, 3207, 178, "Anti Ice", "Windshield Demist")
define3PosTumb("AI_WS_RAIN", 1, 3208, 177, "Anti Ice", "Windshield Rain RMVL")

-- Ejection seat
defineToggleSwitch("SEAT_FIRE", 1, 3209, 205, "Seat", "Seat Firing Handle")
defineSpringloaded_3PosTumb("SEAT_ADJ", 1, 3211, 3212, 323, "Seat", "Adj Seat UP/DOWN")
defineToggleSwitch("SEAT_PIN_CANOPY", 1, 3213, 377, "Seat", "Ejection Safety Pin to Canopy")
defineToggleSwitch("SEAT_PIN_SEAT", 1, 3214, 376, "Seat", "Ejection Safety Pin to Seat")

--Control shift
definePushButton("FW_CONTROL_TCN", 1, 3225, 324, "Control Shift FW", "Forward TACAN Control Shift")
definePushButton("FW_CONTROL_ILS", 1, 3226, 326, "Control Shift FW", "Forward VOR-ILS Control Shift")
definePushButton("FW_CONTROL_NAV", 1, 3227, 384, "Control Shift FW", "Forward NAV Control Shift")
definePushButton("FW_CONTROL_COM1", 1, 3228, 307, "Control Shift FW", "Forward COMM1 Control Shift")
definePushButton("FW_CONTROL_COM2", 1, 3229, 309, "Control Shift FW", "Forward COMM2 Control Shift")
definePushButton("FW_CONTROL_ADF", 1, 3230, 317, "Control Shift FW", "Forward ADF Control Shift")

definePushButton("AFT_CONTROL_TCN", 1, 3231, 273, "Control Shift AFT", "Aft TACAN Control Shift")
definePushButton("AFT_CONTROL_ILS", 1, 3232, 275, "Control Shift AFT", "Aft VOR-ILS Control Shift")
definePushButton("AFT_CONTROL_NAV", 1, 3233, 277, "Control Shift AFT", "Aft NAV Control Shift")
definePushButton("AFT_CONTROL_COM1", 1, 3234, 267, "Control Shift AFT", "Aft COMM1 Control Shift")
definePushButton("AFT_CONTROL_COM2", 1, 3235, 269, "Control Shift AFT", "Aft COMM2 Control Shift")
definePushButton("AFT_CONTROL_ADF", 1, 3236, 271, "Control Shift AFT", "Aft ADF Control Shift")

--CDU
defineToggleSwitch("FW_CDU_GPS_PW", 1, 3237, 345, "CDU FW", "Forward CDU AHRS/GPS System")
definePushButton("FW_CDU_ROW1", 1, 3238, 600, "CDU FW", "Forward CDU Row 1")
definePushButton("FW_CDU_ROW2", 1, 3239, 601, "CDU FW", "Forward CDU Row 2")
definePushButton("FW_CDU_ROW3", 1, 3240, 602, "CDU FW", "Forward CDU Row 3")
definePushButton("FW_CDU_ROW4", 1, 3241, 603, "CDU FW", "Forward CDU Row 4")
definePushButton("FW_CDU_MARK", 1, 3242, 605, "CDU FW", "Forward CDU MARK")
definePushButton("FW_CDU_SET", 1, 3243, 609, "CDU FW", "Forward CDU SET")
definePushButton("FW_CDU_BRT", 1, 3244, 610, "CDU FW", "Forward CDU BRT")
definePushButton("FW_CDU_INC", 1, 3245, 611, "CDU FW", "Forward CDU +")
definePushButton("FW_CDU_DEC", 1, 3246, 612, "CDU FW", "Forward CDU -")
definePushButton("FW_CDU_N1", 1, 3247, 613, "CDU FW", "Forward CDU N. 1")
definePushButton("FW_CDU_N2", 1, 3248, 614, "CDU FW", "Forward CDU N. 2")
definePushButton("FW_CDU_N3", 1, 3249, 615, "CDU FW", "Forward CDU N. 3")
definePushButton("FW_CDU_N4", 1, 3250, 616, "CDU FW", "Forward CDU N. 4")
definePushButton("FW_CDU_N5", 1, 3251, 617, "CDU FW", "Forward CDU N. 5")
definePushButton("FW_CDU_N6", 1, 3252, 618, "CDU FW", "Forward CDU N. 6")
definePushButton("FW_CDU_N7", 1, 3253, 619, "CDU FW", "Forward CDU N. 7")
definePushButton("FW_CDU_N8", 1, 3254, 620, "CDU FW", "Forward CDU N. 8")
definePushButton("FW_CDU_N9", 1, 3255, 621, "CDU FW", "Forward CDU N. 9")
definePushButton("FW_CDU_N0", 1, 3257, 622, "CDU FW", "Forward CDU N. 0")
definePushButton("FW_CDU_CLR", 1, 3258, 623, "CDU FW", "Forward CDU CLR")
definePushButton("FW_CDU_ENT", 1, 3259, 624, "CDU FW", "Forward CDU ENT")
definePushButton("FW_CDU_MODE", 1, 3260, 606, "CDU FW", "Forward CDU MODE")
definePushButton("FW_CDU_STEER", 1, 3261, 607, "CDU FW", "Forward CDU STEER")
definePushButton("FW_CDU_FIX", 1, 3262, 604, "CDU FW", "Forward CDU FIX")
definePushButton("FW_CDU_FLT_PLN", 1, 3263, 608, "CDU FW", "Forward CDU FLT PLN")

definePushButton("AFT_CDU_ROW1", 1, 3264, 625, "CDU AFT", "Aft CDU Row 1")
definePushButton("AFT_CDU_ROW2", 1, 3265, 626, "CDU AFT", "Aft CDU Row 2")
definePushButton("AFT_CDU_ROW3", 1, 3266, 627, "CDU AFT", "Aft CDU Row 3")
definePushButton("AFT_CDU_ROW4", 1, 3267, 628, "CDU AFT", "Aft CDU Row 4")
definePushButton("AFT_CDU_MARK", 1, 3268, 630, "CDU AFT", "Aft CDU MARK")
definePushButton("AFT_CDU_SET", 1, 3269, 634, "CDU AFT", "Aft CDU SET")
definePushButton("AFT_CDU_BRT", 1, 3270, 635, "CDU AFT", "Aft CDU BRT")
definePushButton("AFT_CDU_INC", 1, 3271, 636, "CDU AFT", "Aft CDU +")
definePushButton("AFT_CDU_DEC", 1, 3272, 637, "CDU AFT", "Aft CDU -")
definePushButton("AFT_CDU_N1", 1, 3273, 638, "CDU AFT", "Aft CDU N. 1")
definePushButton("AFT_CDU_N2", 1, 3274, 639, "CDU AFT", "Aft CDU N. 2")
definePushButton("AFT_CDU_N3", 1, 3275, 640, "CDU AFT", "Aft CDU N. 3")
definePushButton("AFT_CDU_N4", 1, 3276, 641, "CDU AFT", "Aft CDU N. 4")
definePushButton("AFT_CDU_N5", 1, 3277, 642, "CDU AFT", "Aft CDU N. 5")
definePushButton("AFT_CDU_N6", 1, 3278, 643, "CDU AFT", "Aft CDU N. 6")
definePushButton("AFT_CDU_N7", 1, 3279, 644, "CDU AFT", "Aft CDU N. 7")
definePushButton("AFT_CDU_N8", 1, 3280, 645, "CDU AFT", "Aft CDU N. 8")
definePushButton("AFT_CDU_N9", 1, 3281, 646, "CDU AFT", "Aft CDU N. 9")
definePushButton("AFT_CDU_N0", 1, 3282, 647, "CDU AFT", "Aft CDU N. 0")
definePushButton("AFT_CDU_CLR", 1, 3283, 648, "CDU AFT", "Aft CDU CLR")
definePushButton("AFT_CDU_ENT", 1, 3284, 649, "CDU AFT", "Aft CDU ENT")
definePushButton("AFT_CDU_MODE", 1, 3285, 631, "CDU AFT", "Aft CDU MODE")
definePushButton("AFT_CDU_STEER", 1, 3286, 632, "CDU AFT", "Aft CDU STEER")
definePushButton("AFT_CDU_FIX", 1, 3287, 629, "CDU AFT", "Aft CDU FIX")
definePushButton("AFT_CDU_FLT_PLN", 1, 3288, 633, "CDU AFT", "Aft CDU FLT PLN")

--Weapons
defineToggleSwitch("WP_GND_FIRE_CVR", 1, 3289, 236, "Weapons", "Ground Fire Guard")
defineToggleSwitch("WP_MASTER_ARM", 1, 3290, 475, "Weapons", "Master Armament")
definePushButton("WP_JETT_SALVO", 1, 3291, 473, "Weapons", "Salvo Jettison")
definePushButton("WP_JETT_SEL", 1, 3292, 70, "Weapons", "Selective Jettison")
define3PosTumb("WP_BOMB_FUZE", 1, 3293, 494, "Weapons", "Bomb Fuze")
defineToggleSwitch("WP_SEQUENCE", 1, 3294, 495, "Weapons", "Sequence Ripple/Single")
defineToggleSwitch("WP_STAT1", 1, 3295, 488, "Weapons", "Station 1")
defineToggleSwitch("WP_STAT2", 1, 3296, 489, "Weapons", "Station 2")
defineToggleSwitch("WP_STAT3", 1, 3297, 490, "Weapons", "Station 3")
defineToggleSwitch("WP_STAT4", 1, 3298, 491, "Weapons", "Station 4")
defineToggleSwitch("WP_STAT5", 1, 3299, 492, "Weapons", "Station 5")
defineToggleSwitch("WP_STAT6", 1, 3300, 493, "Weapons", "Station 6")
defineToggleSwitch("WP_GND_FIRE", 1, 3301, 506, "Weapons", "Ground Fire")
defineToggleSwitch("WP_MASTER_ARM_INIB_CVR", 1, 3302, 169, "Weapons", "Master Arm Inib Guard")
defineToggleSwitch("WP_MASTER_ARM_INIB", 1, 3303, 170, "Weapons", "Master Arm Inib")

defineFloat("WP_STAT1_G", 69, {0, 1}, "Weapons Gauges", "Station 1 Drum")
defineFloat("WP_STAT2_G", 68, {0, 1}, "Weapons Gauges", "Station 2 Drum")
defineFloat("WP_STAT3_G", 67, {0, 1}, "Weapons Gauges", "Station 3 Drum")
defineFloat("WP_STAT4_G", 66, {0, 1}, "Weapons Gauges", "Station 4 Drum")
defineFloat("WP_STAT5_G", 65, {0, 1}, "Weapons Gauges", "Station 5 Drum")
defineFloat("WP_STAT6_G", 64, {0, 1}, "Weapons Gauges", "Station 6 Drum")
defineFloat("WP_SEQU_G", 161, {0, 1}, "Weapons Gauges", "Sequence Drum")
defineFloat("WP_BOMB_FUZE_G", 162, {-1, 1}, "Weapons Gauges", "Bomb Fuze Drum")

defineIndicatorLight("WP_MASTER_ARM_L", 163, "Weapons Light", "Master Arm Light (red)")

--Gunsight
define3PosTumb("GUN_PWR", 1, 3304, 478, "Gunsight", "Gunsight Power")
definePotentiometer("GUN_BRIGHT", 1, 3306, 479, {0, 1}, "Gunsight", "Gunsight Brightness")
definePushButton("GUN_TEST", 1, 3307, 480, "Gunsight", "Gunsight Test")
defineMultipositionSwitch("GUN_DEP_100", 1, 3308, 481, 10, 0.1, "Gunsight", "Gunsight Depression reticle x 100")
defineMultipositionSwitch("GUN_DEP_10", 1, 3309, 482, 10, 0.1, "Gunsight", "Gunsight Depression reticle x 10")
defineMultipositionSwitch("GUN_DEP_1", 1, 3310, 483, 10, 0.1, "Gunsight", "Gunsight Depression reticle x 1")

--VOR
definePotentiometer("FW_VOR_FREQU_1MHZ", 1, 3311, 563, {0, 1}, "VOR FW", "Forward VOR Frequency 1MHz")
definePotentiometer("FW_VOR_FREQU_50KHZ", 1, 3312, 564, {0, 1}, "VOR FW", "Forward VOR Frequency 50 kHz")
definePushButton("FW_VOR_TEST", 1, 3313, 561, "VOR FW", "Forward VOR Frequency Test")
defineToggleSwitch("FW_VOR_PW", 1, 3314, 562, "VOR FW", "Forward VOR Frequency Power Switch")

definePotentiometer("AFT_VOR_FREQU_1MHZ", 1, 3315, 539, {0, 1}, "VOR AFT", "Aft VOR Frequency 1MHz")
definePotentiometer("AFT_VOR_FREQU_50KHZ", 1, 3316, 34, {0, 1}, "VOR AFT", "Aft VOR Frequency 50 kHz")
definePushButton("AFT_VOR_TEST", 1, 3317, 537, "VOR AFT", "Aft VOR Frequency Test")
defineToggleSwitch("AFT_VOR_PW", 1, 3318, 538, "VOR AFT", "Aft VOR Frequency Power Switch")

defineFloat("AFT_VOR_1000", 35, {0, 1}, "VOR AFT Gauges", "Aft VOR Frequency 1000")
defineFloat("AFT_VOR_100", 36, {0, 1}, "VOR AFT Gauges", "Aft VOR Frequency 100")
defineFloat("AFT_VOR_10", 37, {0, 1}, "VOR AFT Gauges", "Aft VOR Frequency 10")
defineFloat("AFT_VOR_1", 38, {0, 1}, "VOR AFT Gauges", "Aft VOR Frequency 1")

--TACAN
defineMultipositionSwitch("FW_TCN_MODE", 1, 3319, 569, 5, 0.25, "TACAN FW", "Forward TACAN Mode")
defineToggleSwitch("FW_TCN_XY", 1, 3320, 552, "TACAN FW", "Forward TACAN X/Y Switch")
defineMultipositionSwitch("FW_TCN_1", 1, 3321, 553, 10, 0.1, "TACAN FW", "Forward TACAN Units")
defineMultipositionSwitch("FW_TCN_10", 1, 3322, 554, 13, 0.08333, "TACAN FW", "Forward TACAN Tens")
definePushButton("FW_TCN_TEST", 1, 3323, 555, "TACAN FW", "Forward TACAN Test")

defineMultipositionSwitch("AFT_TCN_MODE", 1, 3324, 571, 5, 0.25, "TACAN AFT", "Aft TACAN Mode")
defineToggleSwitch("AFT_TCN_XY", 1, 3325, 572, "TACAN AFT", "Aft TACAN X/Y Switch")
defineMultipositionSwitch("AFT_TCN_1", 1, 3326, 573, 10, 0.1, "TACAN AFT", "Aft TACAN Units")
defineMultipositionSwitch("AFT_TCN_10", 1, 3327, 574, 13, 0.08333, "TACAN AFT", "Aft TACAN Tens")
definePushButton("AFT_TCN_TEST", 1, 3328, 575, "TACAN AFT", "Aft TACAN Test")

--Comm1
defineMultipositionSwitch("FW_COM1_FUNC", 1, 3329, 664, 4, 0.33, "Comm1 FW", "Forward Comm 1 Function")
defineMultipositionSwitch("FW_COM1_MODE", 1, 3330, 665, 3, 0.50, "Comm1 FW", "Forward Comm 1 Mode")
defineMultipositionSwitch("FW_COM1_FREQU_1", 1, 3331, 678, 4, 0.33, "Comm1 FW", "Forward Comm 1 Frequency xxxx1")
defineMultipositionSwitch("FW_COM1_FREQU_10", 1, 3332, 677, 10, 0.111, "Comm1 FW", "Forward Comm 1 Frequency xxx1x")
defineMultipositionSwitch("FW_COM1_FREQU_100", 1, 3333, 676, 10, 0.111, "Comm1 FW", "Forward Comm 1 Frequency xx1xx")
defineMultipositionSwitch("FW_COM1_FREQU_1000", 1, 3334, 675, 10, 0.111, "Comm1 FW", "Forward Comm 1 Frequency x1xxx")
defineMultipositionSwitch("FW_COM1_FREQU_10000", 1, 3335, 674, 2, 1, "Comm1 FW", "Forward Comm 1 Frequency 1xxxx")
defineToggleSwitch("FW_COM1_SQUELCH", 1, 3336, 173, "Comm1 FW", "Forward Comm 1 Squelch")
definePushButton("FW_COM1_TONE", 1, 3337, 175, "Comm1 FW", "Forward Comm 1 Tone")
definePushButton("FW_COM1_MEM", 1, 3338, 679, "Comm1 FW", "Forward Comm 1 Mem")
defineMultipositionSwitch("FW_COM1_CHAN", 1, 3339, 673, 20, 0.0526, "Comm1 FW", "Forward Comm 1 Channel")

defineMultipositionSwitch("AFT_COM1_FUNC", 1, 3340, 279, 4, 0.33, "Comm1 AFT", "Aft Comm 1 Function")
defineMultipositionSwitch("AFT_COM1_MODE", 1, 3341, 280, 3, 0.50, "Comm1 AFT", "Aft Comm 1 Mode")
defineMultipositionSwitch("AFT_COM1_FREQU_1", 1, 3342, 526, 4, 0.33, "Comm1 AFT", "Aft Comm 1 Frequency xxxx1")
defineMultipositionSwitch("AFT_COM1_FREQU_10", 1, 3343, 525, 10, 0.111, "Comm1 AFT", "Aft Comm 1 Frequency xxx1x")
defineMultipositionSwitch("AFT_COM1_FREQU_100", 1, 3344, 524, 10, 0.111, "Comm1 AFT", "Aft Comm 1 Frequency xx1xx")
defineMultipositionSwitch("AFT_COM1_FREQU_1000", 1, 3345, 523, 10, 0.111, "Comm1 AFT", "Aft Comm 1 Frequency x1xxx")
defineMultipositionSwitch("AFT_COM1_FREQU_10000", 1, 3346, 522, 2, 1, "Comm1 AFT", "Aft Comm 1 Frequency 1xxxx")
defineToggleSwitch("AFT_COM1_SQUELCH", 1, 3347, 174, "Comm1 AFT", "Aft Comm 1 Squelch")
definePushButton("AFT_COM1_TONE", 1, 3348, 176, "Comm1 AFT", "Aft Comm 1 Tone")
definePushButton("AFT_COM1_MEM", 1, 3349, 527, "Comm1 AFT", "Aft Comm 1 Mem")
defineMultipositionSwitch("AFT_COM1_CHAN", 1, 3350, 521, 20, 0.0526, "Comm1 AFT", "Aft Comm 1 Channel")

--Comm2
defineMultipositionSwitch("FW_COM2_MODE", 1, 3351, 650, 5, 0.25, "Comm2 FW", "Forward Comm 2 Mode")
defineMultipositionSwitch("FW_COM2_FUNC", 1, 3352, 651, 5, 0.25, "Comm2 FW", "Forward Comm 2 Function")
definePotentiometer("FW_COM2_BRIGHT", 1, 3353, 652, {0, 1}, "Comm2 FW", "Forward Comm 2 Brightness")
defineSpringloaded_3PosTumb("FW_COM2_CHN_1", 1, 3354, 3355, 654, "Comm2 FW", "Forward Comm 2 Channel x1")
defineSpringloaded_3PosTumb("FW_COM2_CHN_10", 1, 3356, 3357, 655, "Comm2 FW", "Forward Comm 2 Channel 1x")
defineSpringloaded_3PosTumb("FW_COM2_FREQU_1", 1, 3358, 3359, 656, "Comm2 FW", "Forward Comm 2 Frequency xxxx1")
defineSpringloaded_3PosTumb("FW_COM2_FREQU_10", 1, 3360, 3361, 657, "Comm2 FW", "Forward Comm 2 Frequency xxx1x")
defineSpringloaded_3PosTumb("FW_COM2_FREQU_100", 1, 3362, 3363, 658, "Comm2 FW", "Forward Comm 2 Frequency xx1xx")
defineSpringloaded_3PosTumb("FW_COM2_FREQU_1000", 1, 3364, 3365, 659, "Comm2 FW", "Forward Comm 2 Frequency x1xxx")
defineSpringloaded_3PosTumb("FW_COM2_FREQU_10000", 1, 3366, 3367, 660, "Comm2 FW", "Forward Comm 2 Frequency 1xxxx")
defineSpringloaded_3PosTumb("FW_COM2_SQUELCH", 1, 3368, 3368, 662, "Comm2 FW", "Forward Comm 2 Squelch")
defineToggleSwitch("FW_COM2_MOD", 1, 3370, 661, "Comm2 FW", "Forward Comm 2 Modulation")
defineToggleSwitch("FW_COM2_TOD", 1, 3371, 663, "Comm2 FW", "Forward Comm 2 TOD")

defineMultipositionSwitch("AFT_COM2_MODE", 1, 3372, 290, 5, 0.25, "Comm2 AFT", "Aft Comm 2 Mode")
defineMultipositionSwitch("AFT_COM2_FUNC", 1, 3373, 291, 5, 0.25, "Comm2 AFT", "Aft Comm 2 Function")
definePotentiometer("AFT_COM2_BRIGHT", 1, 3374, 292, {0, 1}, "Comm2 AFT", "Aft Comm 2 Brightness")
defineSpringloaded_3PosTumb("AFT_COM2_CHN_1", 1, 3375, 3376, 294, "Comm2 AFT", "Aft Comm 2 Channel x1")
defineSpringloaded_3PosTumb("AFT_COM2_CHN_10", 1, 3377, 3378, 295, "Comm2 AFT", "Aft Comm 2 Channel 1x")
defineSpringloaded_3PosTumb("AFT_COM2_FREQU_1", 1, 3379, 3380, 296, "Comm2 AFT", "Aft Comm 2 Frequency xxxx1")
defineSpringloaded_3PosTumb("AFT_COM2_FREQU_10", 1, 3381, 3382, 297, "Comm2 AFT", "Aft Comm 2 Frequency xxx1x")
defineSpringloaded_3PosTumb("AFT_COM2_FREQU_100", 1, 3383, 3384, 154, "Comm2 AFT", "Aft Comm 2 Frequency xx1xx")
defineSpringloaded_3PosTumb("AFT_COM2_FREQU_1000", 1, 3385, 3386, 155, "Comm2 AFT", "Aft Comm 2 Frequency x1xxx")
defineSpringloaded_3PosTumb("AFT_COM2_FREQU_10000", 1, 3387, 3388, 156, "Comm2 AFT", "Aft Comm 2 Frequency 1xxxx")
defineSpringloaded_3PosTumb("AFT_COM2_SQUELCH", 1, 3389, 3389, 158, "Comm2 AFT", "Aft Comm 2 Squelch")
defineToggleSwitch("AFT_COM2_MOD", 1, 3391, 157, "Comm2 AFT", "Aft Comm 2 Modulation")
defineToggleSwitch("AFT_COM2_TOD", 1, 3392, 159, "Comm2 AFT", "Aft Comm 2 TOD")

--ICS
defineToggleSwitch("FW_ICS_COM1_SW", 1, 3393, 115, "ICS FW", "Forward ICS COM1 Switch")
definePotentiometer("FW_ICS_COM1_VOL", 1, 3394, 116, {0, 1}, "ICS FW", "Forward ICS COM1 Volume")
defineToggleSwitch("FW_ICS_COM2_SW", 1, 3395, 117, "ICS FW", "Forward ICS COM2 Switch")
definePotentiometer("FW_ICS_COM2_VOL", 1, 3396, 118, {0, 1}, "ICS FW", "Forward ICS COM2 Volume")
defineToggleSwitch("FW_ICS_TCN_SW", 1, 3397, 119, "ICS FW", "Forward ICS TACAN Switch")
definePotentiometer("FW_ICS_TCN_VOL", 1, 3398, 120, {0, 1}, "ICS FW", "Forward ICS TACAN Volume")
defineToggleSwitch("FW_ICS_VORLOC_SW", 1, 3399, 121, "ICS FW", "Forward ICS VOR/LOC Switch")
definePotentiometer("FW_ICS_VORLOC_VOL", 1, 3400, 122, {0, 1}, "ICS FW", "Forward ICS VOR/LOC Volume")
defineToggleSwitch("FW_ICS_ADF_SW", 1, 3401, 123, "ICS FW", "Forward ICS ADF Switch")
definePotentiometer("FW_ICS_ADF_VOL", 1, 3402, 124, {0, 1}, "ICS FW", "Forward ICS ADF Volume")
defineToggleSwitch("FW_ICS_MARK_SW", 1, 3403, 125, "ICS FW", "Forward ICS Markers Switch")
definePotentiometer("FW_ICS_MARK_VOL", 1, 3404, 126, {0, 1}, "ICS FW", "Forward ICS Markers Volume")
defineToggleSwitch("FW_ICS_INTPH_SW", 1, 3405, 127, "ICS FW", "Forward ICS Interphone Switch")
definePotentiometer("FW_ICS_INTPH_VOL", 1, 3406, 128, {0, 1}, "ICS FW", "Forward ICS Interphone Volume")
definePotentiometer("FW_ICS_MASTER_VOL", 1, 3407, 129, {0, 1}, "ICS FW", "Forward ICS Master Volume")
definePushButton("FW_ICS_CALL", 1, 3408, 130, "ICS FW", "Forward ICS Call Switch")
defineToggleSwitch("FW_ICS_RADIO_SEL", 1, 3409, 131, "ICS FW", "Forward ICS COM1/COM2 TX Selector")

defineToggleSwitch("AFT_ICS_COM1_SW", 1, 3410, 132, "ICS AFT", "Aft ICS COM1 Switch")
definePotentiometer("AFT_ICS_COM1_VOL", 1, 3411, 133, {0, 1}, "ICS AFT", "Aft ICS COM1 Volume")
defineToggleSwitch("AFT_ICS_COM2_SW", 1, 3412, 134, "ICS AFT", "Aft ICS COM2 Switch")
definePotentiometer("AFT_ICS_COM2_VOL", 1, 3413, 135, {0, 1}, "ICS AFT", "Aft ICS COM2 Volume")
defineToggleSwitch("AFT_ICS_TCN_SW", 1, 3414, 136, "ICS AFT", "Aft ICS TACAN Switch")
definePotentiometer("AFT_ICS_TCN_VOL", 1, 3415, 137, {0, 1}, "ICS AFT", "Aft ICS TACAN Volume")
defineToggleSwitch("AFT_ICS_VORLOC_SW", 1, 3416, 138, "ICS AFT", "Aft ICS VOR/LOC Switch")
definePotentiometer("AFT_ICS_VORLOC_VOL", 1, 3417, 139, {0, 1}, "ICS AFT", "Aft ICS VOR/LOC Volume")
defineToggleSwitch("AFT_ICS_ADF_SW", 1, 3418, 140, "ICS AFT", "Aft ICS ADF Switch")
definePotentiometer("AFT_ICS_ADF_VOL", 1, 3419, 141, {0, 1}, "ICS AFT", "Aft ICS ADF Volume")
defineToggleSwitch("AFT_ICS_MARK_SW", 1, 3420, 142, "ICS AFT", "Aft ICS Markers Switch")
definePotentiometer("AFT_ICS_MARK_VOL", 1, 3421, 143, {0, 1}, "ICS AFT", "Aft ICS Markers Volume")
defineToggleSwitch("AFT_ICS_INTPH_SW", 1, 3422, 144, "ICS AFT", "Aft ICS Interphone Switch")
definePotentiometer("AFT_ICS_INTPH_VOL", 1, 3423, 145, {0, 1}, "ICS AFT", "Aft ICS Interphone Volume")
definePotentiometer("AFT_ICS_MASTER_VOL", 1, 3424, 146, {0, 1}, "ICS AFT", "Aft ICS Master Volume")
definePushButton("AFT_ICS_CALL", 1, 3425, 147, "ICS AFT", "Aft ICS Call Switch")
defineToggleSwitch("AFT_ICS_RADIO_SEL", 1, 3426, 148, "ICS AFT", "Aft ICS COM1/COM2 TX Selector")

--Oxygen
defineToggleSwitch("FW_OXY_PW", 1, 3427, 587, "Oxygen FW", "Forward Oxygen Power Supply")
defineToggleSwitch("FW_OXY_DILUIT", 1, 3428, 589, "Oxygen FW", "Forward Oxygen Diluiter Lever (Normal / 100%)")
defineToggleSwitch("FW_OXY_EMERG", 1, 3429, 588, "Oxygen FW", "Forward Oxygen Emergency Lever")

defineToggleSwitch("AFT_OXY_PW", 1, 3430, 113, "Oxygen AFT", "Aft Oxygen Power Supply")
defineToggleSwitch("AFT_OXY_DILUIT", 1, 3431, 113, "Oxygen AFT", "Aft Oxygen Diluiter Lever (Normal / 100%)")
defineToggleSwitch("AFT_OXY_EMERG", 1, 3432, 111, "Oxygen AFT", "Aft Oxygen Emergency Lever")

--Cockpit
definePushButton("FW_GLOVE_COMP", 1, 3433, 206, "Cockpit", "Forward Glove Compartment")
defineToggleSwitch("FW_CANOPY_SEVERANCE_LVR", 1, 3215, 583, "Cockpit", "Forward Canopy Severance Handle")
defineToggleSwitch("FW_CANOPY_SEVERANCE_PIN", 1, 3216, 584, "Cockpit", "Forward Canopy Severance Safety Pin")

definePushButton("AFT_GLOVE_COMP", 1, 3434, 207, "Cockpit", "Aft Glove Compartment")
defineToggleSwitch("AFT_CANOPY_SEVERANCE_LVR", 1, 3217, 741, "Cockpit", "Aft Canopy Severance Handle")
defineToggleSwitch("AFT_CANOPY_SEVERANCE_PIN", 1, 3218, 742, "Cockpit", "Aft Canopy Severance Safety Pin")

defineToggleSwitch("CURTAIN_HANDLE", 1, 3435, 1999, "Cockpit", "Curtain Handle")

defineFloat("CANOPY_POS_G", 181, {0, 1}, "Cockpit Gauges", "Canopy Position")

--ELT
defineSpringloaded_3PosTumb("ELT_SW", 1, 3436, 3436, 727, "ELT", "ELT Switch")

--IFF
defineMultipositionSwitch("IFF_MASTER", 1, 3438, 714, 5, 0.25, "IFF", "IFF Master")
defineMultipositionSwitch("IFF_CODE", 1, 3439, 713, 5, 0.25, "IFF", "IFF Code")
define3PosTumb("IFF_ANT", 1, 3440, 715, "IFF", "IFF ANT Switch")
define3PosTumb("IFF_M4_CONT", 1, 3441, 710, "IFF", "IFF Mode 4 Control")
define3PosTumb("IFF_M4_AUDIO", 1, 3442, 711, "IFF", "IFF Mode 4 Audio")
definePushButton("IFF_RAD", 1, 3443, 716, "IFF", "IFF RAD Switch")
define3PosTumb("IFF_M1_CONT", 1, 3444, 720, "IFF", "IFF Mode 1 Control")
define3PosTumb("IFF_M2_CONT", 1, 3445, 719, "IFF", "IFF Mode 2 Control")
define3PosTumb("IFF_M3A_CONT", 1, 3446, 718, "IFF", "IFF Mode 3/A Control")
define3PosTumb("IFF_M3C_CONT", 1, 3447, 717, "IFF", "IFF Mode 3/C Control")
defineSpringloaded_3PosTumb("IFF_IDENT_MIC", 1, 3448, 3448, 712, "IFF", "IFF IDENT-MIC Switch")
definePushButton("IFF_CODE_SW_1", 1, 3450, 734, "IFF", "IFF Code Switch 1")
definePushButton("IFF_CODE_SW_2", 1, 3451, 735, "IFF", "IFF Code Switch 2")
definePushButton("IFF_CODE_SW_3", 1, 3452, 736, "IFF", "IFF Code Switch 3")
definePushButton("IFF_CODE_SW_4", 1, 3453, 737, "IFF", "IFF Code Switch 4")
definePushButton("IFF_CODE_SW_5", 1, 3454, 738, "IFF", "IFF Code Switch 5")
definePushButton("IFF_CODE_SW_6", 1, 3455, 739, "IFF", "IFF Code Switch 6")
definePushButton("IFF_TEST_GO", 1, 3456, 743, "IFF", "IFF Test Switch GO")
definePushButton("IFF_TEST_NOGO", 1, 3457, 744, "IFF", "IFF Test Switch NOGO")
definePushButton("IFF_TEST_REPLY", 1, 3458, 745, "IFF", "IFF Test Switch REPLY")

--Externals
defineIntegerFromGetter("EXT_SPEED_BRAKE", function()
	return math.floor(LoGetAircraftDrawArgumentValue(21)*65535)
end, 65535, "External Aircraft Model", "Speed Brake")
defineIntegerFromGetter("EXT_POSITION_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Position Lights (red+green)")
defineIntegerFromGetter("EXT_STROBE_TAIL", function()
	if LoGetAircraftDrawArgumentValue(192) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Tail Strobe Light (red)")
defineIntegerFromGetter("EXT_FORMATION_LIGHTS", function()
	return math.floor(LoGetAircraftDrawArgumentValue(200)*65535)
end, 65535, "External Aircraft Model", "Formation Lights (light green)")
defineIntegerFromGetter("EXT_BOTTOM_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(201) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Middle Bottom Light (white)")
defineIntegerFromGetter("EXT_TOP_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(202) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Top Light (white)")
defineIntegerFromGetter("EXT_TAIL_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(203) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Tail Light (white)")
defineIntegerFromGetter("EXT_FRONT_LANDLIGHT", function()
	if LoGetAircraftDrawArgumentValue(208) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Front Landing Light (white)")
defineIntegerFromGetter("EXT_WING_LANDLIGHT", function()
	if LoGetAircraftDrawArgumentValue(209) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Wing Landing Light (white)")
defineIntegerFromGetter("EXT_WOW_NOSE", function()
	if LoGetAircraftDrawArgumentValue(1) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
defineIntegerFromGetter("EXT_WOW_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(4) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Right Gear")
defineIntegerFromGetter("EXT_WOW_LEFT", function()
	if LoGetAircraftDrawArgumentValue(6) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Left Gear")

BIOS.protocol.endModule()