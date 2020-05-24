Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerColor                = { r = 255, g = 0, b = 60 }
Config.EnablePlayerManagement     = false -- enables the actual car dealer job. You'll need esx_addonaccount, esx_billing and esx_society
Config.EnableOwnedVehicles        = true
Config.EnableSocietyOwnedVehicles = false -- use with EnablePlayerManagement disabled, or else it wont have any effects
Config.ResellPercentage           = 40

Config.Locale                     = 'en'

Config.LicenseEnable = false -- require people to own drivers license when buying vehicles? Only applies if EnablePlayerManagement is disabled. Requires esx_license

-- looks like this: 'LLL NNN'
-- The maximum plate length is 8 chars (including spaces & symbols), don't go past it!
Config.PlateLetters  = 5
Config.PlateNumbers  = 2
Config.PlateUseSpace = true

Config.Zones = {

	ShopEntering = {
		Pos   = vector3(1773.41, 3324.19, 41.4),
		Size  = {x = 1.5, y = 1.5, z = 0.4},
		Type  = 1
	},

	ShopInside = {
		Pos     = vector3(1750.39, 3329.13, 40.1),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Type    = -1
	},

	ShopOutside = {
		Pos     = vector3(1782.44, 3327.38, 41.27),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 220.0,
		Type    = -1
	},
--
--	BossActions = {
--		Pos   = vector3(-3112.0, -1114.2, 25.4),
--		Size  = {x = 1.5, y = 1.5, z = 1.0},
--		Type  = -1
--	},
--
--	GiveBackVehicle = {
--		Pos   = vector3(-1318.2, -1668.5, 120.6),
--		Size  = {x = 3.0, y = 3.0, z = 1.0},
--		Type  = (Config.EnablePlayerManagement and 1 or -1)
--	},
--
--	ResellVehicle = {
--		Pos   = vector3(-4114.6, -80.7, 2544.6),
--		Size  = {x = 3.0, y = 3.0, z = 1.0},
--		Type  = 1
--	}

}
