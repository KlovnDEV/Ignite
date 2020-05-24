Config = {}
Config.Blip		= {sprite= 524, color = 30}
Config.BoatBlip		= {sprite= 410, color = 30}
Config.AirplaneBlip	= {sprite= 524, color = 188}
Config.MecanoBlip	= {sprite= 357, color = 26}
Config.Price		= 50 -- pound price to get vehicle back
Config.SwitchGaragePrice = 25 -- price to pay to switch vehicles in garage
Config.StoreOnServerStart = true -- Store all vehicles in garage on server start?

Config.Garages = {
	Garage_Centre = {
		Pos = {x=215.800, y=-810.057, z=30.727},
		Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Press ~INPUT_PICKUP~ to access Garage services",
		SpawnPoint = {
			Pos = {x=229.700, y= -800.1149, z= 30.5722},
			Heading = 160.0,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = "Press ~INPUT_PICKUP~ to takeout a vehicle"
		},
		DeletePoint = {
			Pos = {x=215.124, y=-791.377, z=30.946},
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Press ~INPUT_PICKUP~ to store vehicle"
		}, 	
	},
	Garage_NightClub = {
		Pos ={x = 664.54406738281,y = 629.0244140625,z = 128.91111755371 },
		Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		SpawnPoint = {
			Pos = {x = 657.646,y = 630.719,z = 128.911 },
			Heading = 340.0,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule"
		},
		DeletePoint = {
			Pos = {x = 650.57611083984,y = 625.05859375,z = 128.9111328125 },
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule"
		}, 	
	},
	Garage_Centre2 = {
		Pos = {x = -1523.191,y = -451.017,z = 35.596},
		Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		SpawnPoint = {
			Pos = {x = -1519.22,y = -434.582,z = 35.442},
			Heading = 160.0,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule"
		},
		DeletePoint = {
			Pos = {x = -1528.022,y = -443.280,z = 35.442},
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule"
		}, 	
	},
	Garage_Paleto = {
		Pos = {x=105.359, y=6613.586, z=32.3973},
		Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		SpawnPoint = {
			Pos = {x=128.7822, y= 6622.9965, z= 31.7828},
			Heading = 160.0,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule"
		},
		DeletePoint = {
			Pos = {x=126.3572, y=6608.4150, z=31.8565},
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule"
		}, 	
	},
	Garage_SandyShore = {
		Pos = {x=1694.571, y=3610.924, z=35.319},
		Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		SpawnPoint = {
			Pos = {x=1713.492, y= 3598.938, z= 35.338},
			Heading = 160.0,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule"
		},
		DeletePoint = {
			Pos = {x = 1695.156,y = 3601.061,z = 35.530},
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule"
		}, 	
	},
	Garage_Ocean1 = {
		Pos = {x = -3140.323,y = 1124.463,z = 20.706},
		Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		SpawnPoint = {
			Pos = {x = -3132.638,y = 1126.662,z = 20.667},
			Heading = 160.0,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule"
		},
		DeletePoint = {
			Pos = {x = -3136.902,y = 1102.685,z = 20.654},
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule"
		}, 	
	},
	Garage_Ocean2 = {
		Pos = {x = -2982.561,y = 327.506,z = 14.935},
		Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		SpawnPoint = {
			Pos = {x = -2977.238,y = 337.777,z = 14.768},
			Heading = 160.0,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule"
		},
		DeletePoint = {
			Pos = {x = -2971.814,y = 355.331,z = 14.771},
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule"
		}, 	
	},
	Garage_Sud = {
		Pos = {x = 443.6696,y = -1969.4372,z = 24.401},
		Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		SpawnPoint = {
			Pos = {x = 437.8140,y = -1958.572,z = 22.957},
			Heading = 182.0,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule"
		},
		DeletePoint = {
			Pos = {x = 457.91,y = -1971.343,z = 22.553},
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule"
		}, 	
	},
	
	Garage_Groove = {
		Pos = {x = -69.514305114746,y = -1822.9477539063,z = 26.941974639893 },
		Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		SpawnPoint = {
			Pos = {x = -67.72095489502,y = -1835.7784423828,z = 26.883722305298 },
			Heading = 225.887,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule"
		},
		DeletePoint = {
			Pos = {x = -60.4020652771,y = -1829.5288085938,z = 26.836933135986 },
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule"
		}, 	
	},
}	
	-- Garage_Tournoi = {
		-- Pos = {x = 3171.8381347656,y = -1667.3009033203,z = 6.4746117591858 },
		-- Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		-- Name = 'Garage',
		-- HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		-- Functionmenu = OpenMenuGarage,
		-- SpawnPoint = {
			-- Pos = {x = 3164.1762695313,y = -1667.0953369141,z = 6.4746117591858 },
			-- Heading = 264.63,
			-- Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			-- HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			-- Functionmenu = ListVehiclesMenu,
		-- },
		-- DeletePoint = {
			-- Pos = {x = 3158.0983886719,y = -1661.5126953125,z = 7.0836601257324 },
			-- Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			-- HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			-- Functionmenu = StockVehicleMenu,
		-- }, 	
	-- },
	-- Garage_YouTool = {
		-- Pos = {x = 2709.8679199219,y = 3455.1743164063,z = 56.317573547363 },
		-- Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		-- Name = 'Garage',
		-- HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		-- Functionmenu = OpenMenuGarage,
		-- SpawnPoint = {
			-- Pos = {x = 2691.1271972656,y = 3454.1496582031,z = 55.785736083984 },
			-- Heading = 239.90,
			-- Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			-- HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			-- Functionmenu = ListVehiclesMenu,
		-- },
		-- DeletePoint = {
			-- Pos = {x = 2702.1945800781,y = 3454.7746582031,z = 55.667736053467 },
			-- Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			-- HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			-- Functionmenu = StockVehicleMenu,
		-- }, 	
	-- },


Config.GaragesMecano = {
	Bennys = {
		Name = 'Fourriere Externe',
		SpawnPoint = {
			Pos = {x = 477.729,y = -1888.856,z = 26.094},
			Heading = 303.0,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir un véhicule de fourrière"
		},
		DeletePoint = {
			Pos = {x = 459.733,y = -1890.335,z = 25.776},
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer le véhicule en fourrière"
		}, 	
	},
	police = {
		Name = 'Fourriere Externe',
		SpawnPoint = {
			Pos = {x = 449.253,y = -1024.322,z = 28.57},
			Heading = 100.0,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir un véhicule de fourrière"
		},
		DeletePoint = {
			Pos = {x = 452.305,y = -996.752,z = 25.776},
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer le véhicule en fourrière"
		}, 	
	},
	police2 = {
		Name = 'Fourriere Externe',
		SpawnPoint = {
			Pos = {x = 1868.325,y = 3694.566,z = 33.61},
			Heading = 100.0,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir un véhicule de fourrière"
		},
		DeletePoint = {
			Pos = {x = 1860.925,y = 3706.958,z = 33.36},
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer le véhicule en fourrière"
		}, 	
	},
	police3 = {
		Name = 'Fourriere Externe',
		SpawnPoint = {
			Pos = {x = -474.000,y = 6029.71,z = 30.94},
			Heading = 226.0,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir un véhicule de fourrière"
		},
		DeletePoint = {
			Pos = {x = -462.932,y = 60.41,z = 31.34},
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer le véhicule en fourrière"
		}, 	
	},
	-- Bennys2 = {
		-- Marker = 1,
		-- SpawnPoint = {
			-- Pos = {x=-190.455, y= -1290.654, z= 30.295},
			-- Color = {r=0,g=255,b=0},
			-- Size  = {x = 3.0, y = 3.0, z = 1.0},
			-- Marker = 1
		-- },
		-- DeletePoint = {
			-- Pos = {x=-190.379, y=-1284.667, z=30.233},
			-- Color = {r=255,g=0,b=0},
			-- Size  = {x = 3.0, y = 3.0, z = 1.0},
			-- Marker = 1
		-- }, 	
	-- },
}



Config.SocietyGarages = {
	police =  { -- database job name
		{
			Pos = {x = 446.39,y = -984.844,z = 30.696 },
			Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
			Name = 'Garage',
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage de aviation",
			SpawnPoint = {
				Pos = {x = -1285.1153564453,y = -3382.1647949219,z = 13.940155029297 },
				Heading = 160.0,
				Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
				HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre engin d'aviation"
			},
			DeletePoint = {
				Pos = {x = -1287.5788574219,y = -3390.4025878906,z = 13.940155029297 },
				Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
				HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre engin d'aviation"
			}, 	
		},
		{
			Pos = {x = 448.1153564453,y = -976.86,z = 30.696 },
			Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
			Name = 'Garage',
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage de aviation",
			SpawnPoint = {
				Pos = {x = -1285.1153564453,y = -3382.1647949219,z = 13.940155029297 },
				Heading = 160.0,
				Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
				HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre engin d'aviation"
			},
			DeletePoint = {
				Pos = {x = -1287.5788574219,y = -3390.4025878906,z = 13.940155029297 },
				Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
				HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre engin d'aviation"
			}, 	
		},
	},
	brinks =  {
		{
			Pos = {x = 443.1153564453,y = -993.86,z = 30.696 },
			Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
			Name = 'Garage',
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage de aviation",
			SpawnPoint = {
				Pos = {x = -1285.1153564453,y = -3382.1647949219,z = 13.940155029297 },
				Heading = 160.0,
				Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
				HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre engin d'aviation"
			},
			DeletePoint = {
				Pos = {x = -1287.5788574219,y = -3390.4025878906,z = 13.940155029297 },
				Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
				HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre engin d'aviation"
			}, 	
		},
    },
	ambulance =  {
		{
			Pos = {x = 443.1153564453,y = -993.86,z = 30.696 },
			Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
			Name = 'Garage',
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage de aviation",
			SpawnPoint = {
				Pos = {x = -1285.1153564453,y = -3382.1647949219,z = 13.940155029297 },
				Heading = 160.0,
				Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
				HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre engin d'aviation"
			},
			DeletePoint = {
				Pos = {x = -1287.5788574219,y = -3390.4025878906,z = 13.940155029297 },
				Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
				HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre engin d'aviation"
			}, 	
		},
	},
	taxi =  {
		{
			Pos = {x = 443.1153564453,y = -993.86,z = 30.696 },
			Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
			Name = 'Garage',
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage de aviation",
			SpawnPoint = {
				Pos = {x = -1285.1153564453,y = -3382.1647949219,z = 13.940155029297 },
				Heading = 160.0,
				Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
				HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre engin d'aviation"
			},
			DeletePoint = {
				Pos = {x = -1287.5788574219,y = -3390.4025878906,z = 13.940155029297 },
				Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
				HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre engin d'aviation"
			}, 	
		},
    },
}
