Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 25
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'en'

Config.BallasStations = {

  Ballas = {

    Blip = {
      Pos     = { x = 425.130, y = -979.558, z = 30.711 },
      Sprite  = 60,
      Display = 4,
      Scale   = 1.2,
      Colour  = 29,
    },

    AuthorizedWeapons = {
      { name = 'WEAPON_KNIFE',     price = 0 },
      { name = 'WEAPON_SWITCHBLADE', price = 0},
      { name = 'WEAPON_BAT', price = 0},
      { name = 'WEAPON_PISTOL', price = 0}

    },

	  AuthorizedVehicles = {
		  { name = 'elegy',  label = 'Elegy Custom' },
		  { name = 'manchez',      label = 'Dirtbike' },
		  { name = 'buffalo', label = 'Buffalo'}
	  },

    Cloakrooms = {
      { x = 2438.28125, y = 4970.6508789063, z = 41.558597564697 },
    },

    Armories = {
      { x = -15.49, y = -1430.43, z = 30.85},
    },

    Vehicles = {
      {
        Spawner    = { x = -23.96, y = -1427.56, z = 29.95 },
        SpawnPoint = { x = -25.39, y = -1445.36, z = 30.05 },
        Heading    = 175.0,
      }
    },

	Helicopters = {
      {
        Spawner    = { x = 2530.029296875, y = 4964.0009765625, z = 44.254215240479 },
        SpawnPoint = { x = 2470.0180664063, y = 4957.8735351563, z = 45.12523651123 },
        Heading    = 0.0,
      }
    },

    VehicleDeleters = {
      { x = -24.76, y = -1433.81, z = 30.65 },
      { x = 2457.7590332031, y = 5015.5239257813, z = 45.603271484375 },
    },

    BossActions = {
      { x = 71.65, y = -1973.2, z = 20.10 }
    },

  },

 }

