Config              = {}
Config.MarkerType   = 25
Config.DrawDistance = 100.0
Config.ZoneSize     = {x = 2.0, y = 2.0, z = 0.25}
Config.MarkerColor  = {r = 100, g = 204, b = 100}
Config.RequiredCopsCoke = 0
Config.RequiredCopsMeth = 0
Config.RequiredCopsWeed = 0
Config.RequiredCopsOpium = 0
Config.Locale = 'en'

Config.Zones = {
	-- Coke farm teleport, near the docks where merryweather are...
	CokeFarm =       {x=1090.4, y=-3197.4, z=-39.6},

	-- These are both within the same interior
	CokeTreatment =  {x=1114.9, y=-3144.1, z=-37.7},
	CokeResell = 	 {x=1116.1, y=-3160.9, z=-37.0},

	-- These are default...
	MethFarm =	 {x=1391.3, y=3608.1, z=38.15},	
	MethTreatment =  {x=-1147.4, y=4940.1, z=221.5},
	
	-- Within box
	MethResell = 	 {x=1002.1, y=-3194.9, z=-38.9},
	
	-- All of these are within the factory
	WeedFarm =       {x=1054.4, y=-3193.5, z=-39.1},
	WeedTreatment =  {x=1037.5, y=-3205.3, z=-38.1},
	WeedResell = 	 {x=-1172.2, y=-1571.75, z=3.90},
	
	-- This is in a field .. somewhere .. 
	OpiumFarm = 	 {x=1541.7, y=6335.3, z=23.5},

	-- These are both in the same interior ...
	OpiumTreatment = {x=1007.9, y=-3152.0, z=-38.9},
	OpiumResell = 	 {x=1007.9, y=-3169.8, z=-39.2}
}

Config.Map = {
  -- {name="Coke Farm",       color=4, scale=0.8, id=497, x=1550.77,  y=2153.34,  z=78.2125},
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


