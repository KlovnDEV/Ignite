Config               = {}

Config.DrawDistance  = 100
Config.Size          = { x = 1.5, y = 1.5, z = 0.5 }
Config.Color         = { r = 0, g = 128, b = 255 }
Config.Type          = 1

Config.Locale        = 'en'

Config.LicenseEnable = true -- only turn this on if you are using esx_license
Config.LicensePrice  = 5000

Config.Zones = {

	GunShop = {
		Legal = true,
		Items = {},
		Locations = {
			vector3(-662.1, -935.3, -30.8),
			vector3(810.2, -2157.3, -58.6),
			vector3(1693.4, 3759.5, -63.7),
			vector3(-330.2, 6083.8, -60.4),
			vector3(252.3, -50.0, -18.9),
			vector3(22.0, -1107.2, -58.8),
			vector3(2567.6, 294.3, -92.7),
			vector3(-1117.5, 2698.6, -12.5),
			vector3(842.4, -1033.4, -19.1)
		}
	},

	BlackWeashop = {
		Legal = false,
		Items = {},
		Locations = {
			vector3(908.34, -3206.71, -96.9),
			vector3(111.08, -736.51, 249.5)
		}
	}

}
