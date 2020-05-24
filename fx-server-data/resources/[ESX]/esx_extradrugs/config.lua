Config              = {}
Config.MarkerType   = 25
Config.DrawDistance = 100.0
Config.ZoneSize     = {x = 1.6, y = 1.6, z = 0.25}
Config.MarkerColor  = {r = 100, g = 204, b = 100}
Config.RequiredCopsCoke = 0
Config.RequiredCopsMeth = 0
Config.RequiredCopsWeed = 0
Config.RequiredCopsOpium = 0
Config.Locale = 'en'

Config.Zones = {
	-- Ketamine
	CokeFarm =       {x=-249.51, y=6324.84, z=32.1},
	CokeTreatment =  {x=2436.2, y=4965.5, z=42.1},
	CokeResell = 	 {x=2338.31, y=2570.64, z=47.72},

	-- Xanax
	MethFarm =	 {x=322.21, y=-581.38, z=28.39},	
	MethTreatment =  {x=254.39, y=-1342.77, z=24.54},
	MethResell = 	 {x=-54.31, y=-1225.61, z=28.1},
	
	-- Valium
	WeedFarm =       {x=330.68, y=-581.02, z=28.39},
	WeedTreatment =  {x=354.8, y=-576.63, z=28.39},
	WeedResell = 	 {x=-53.69, y=-1213.19, z=28.1},
	
	-- This is in a field .. somewhere .. 
	--OpiumFarm = 	 {x=1541.7, y=6335.3, z=23.0},

	-- These are both in the same interior ...
	--OpiumTreatment = {x=1007.9, y=-3152.0, z=-38.9},
	--OpiumResell = 	 {x=1007.9, y=-3169.8, z=-39.2}
}

Config.Map = {
  --{name="",       color=4, scale=0.8, id=497, x=1550.77,  y=2153.34,  z=78.2125},
  -- {name="Coke Treatment",  color=4, scale=0.8, id=497, x=-458.13967895508, y=-2278.6174316406, z=7.5158290863037},
  -- {name="Coke Sales",      color=4, scale=0.8, id=497, x=-1756.1984863281, y=427.31674194336,  z=126.68292999268},
  -- {name="Meth Farm",       color=3, scale=0.8, id=501, x=1525.298828125,   y=1710.0217285156,  z=109.00956726074},
  -- {name="Meth Treatment",  color=3, scale=0.8, id=501, x=-1147.4151611328, y=4940.0087890625,  z=221.00686645508},
  -- {name="Meth Sales",      color=3, scale=0.8, id=501, x=-63.592178344727, y=-1224.0709228516, z=27.768648147583},
  -- {name="Opium Farm",      color=21, scale=0.8, id=403, x=1541.784790039,   y=6335.3999023438,  z=23.028722381592},
  -- {name="Opium Treatment", color=21, scale=0.8, id=403, x=-98.50640,   y=1909.970,     z=194.51},
  -- {name="Opium Sales",     color=21, scale=0.8, id=403, x=2331.0881347656,  y=2570.2250976562,  z=46.681819915772},
  {name="Weed",       color=2, scale=0.9, id=140, x=836.6,         y=2175.76,  z=52.961572647095},
  -- {name="Cannabis Processing",  color=2, scale=0.8, id=140, x=1257.620,  y=1923.070,  z=76.500}
  -- {name="Weed Sales",      color=2, scale=0.8, id=140, x=-54.249694824219, y=-1443.3666992188, z=31.068626403809}
}

local TeleportFromTo = {
 
	["Courtroom"] = {
		positionFrom = { ['x'] = 1013.1706542969, ['y'] = 2905.4699707031, ['z'] = 41.374877929688, nom = "Entered the Bunker"},
		positionTo = { ['x'] = 1009.8477172852, ['y'] = 2905.8864746094, ['z'] = 34.620891571045, nom = "Get out of Bunker"},
	},	
	["Cokeroom"] = {
		positionFrom = { ['x'] = 589.41, ['y'] = -3269.9, ['z'] = 6.07, nom = "Entered The Coke room"},
		positionTo = { ['x'] = 1088.8, ['y'] = -3188.31, ['z'] = -38.92, nom = "Get Out Of Coke room"},
	},	
	["Coke Treatment room"] = {
		positionFrom = { ['x'] = 2685.17, ['y'] = 3515.49, ['z'] = 53.30, nom = "Entered The Coke Treatment Room"},
		positionTo = { ['x'] = 1120.95, ['y'] = -3152.47, ['z'] = -37.06, nom = "Get Out Of Coke Treatment Room"},
	},
	["Coke Resell room"] = {
		positionFrom = { ['x'] = 2813.36, ['y'] = 1469.59, ['z'] = 24.74, nom = "Entered The Coke Resell Room"},
		positionTo = { ['x'] = 997.7, ['y'] = -3157.98, ['z'] = -38.91, nom = "Get out of Coke Resell Room"},
	},
	["Meth Treatment room"] = {
		positionFrom = { ['x'] = 1743.79, ['y'] = -1622.97, ['z'] = 116.19, nom = "Entered The Meth Treatment Room"},
		positionTo = { ['x'] = 997.93, ['y'] = -3201.22, ['z'] = -36.39, nom = "Get Out Of Meth Treatment Room"},
	},
	["Meth Weed Farm room"] = {
		positionFrom = { ['x'] = 839.37, ['y'] = 2176.16, ['z'] = 52.29, nom = "Entered The Weed Farm Room"},
		positionTo = { ['x'] = 1065.71, ['y'] = -3183.25, ['z'] = -39.16, nom = "Get Out Of Weed Farm Room"},
	},
	
}


