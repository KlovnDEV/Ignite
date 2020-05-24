-- CONFIG --

-- Blacklisted vehicle models
carblacklist = {
	"RHINO",
	"LAZER",
	"BUZZARD",
	"BUZZARD2",
	"MAVERICK",
	"FROGGER",
	"FROGGER2",
	"CARGOBOB",
	"CARGOBOB2",
	"CARGOBOB3",
	"SAVAGE",
	"SWIFT",
	"SWIFT2",
	"LUXOR",
	"LUXOR2",
	"HYDRA",
	"TITAN",
	"SHAMAL",
	"DODO",
	"DUSTER",
	"BLIMP",
	"BLIMP2",
	"MILJET",
	"NIMBUS",
	"STUNT",
	"VELUM",
	"VELUM2",
	"CARGOPLANE",
	"CUBAN800",
	"MAMMATUS",
	"VESTRA",
	"BARRACKS",
	"BARRACKS2",
	"BARRACKS3",
	"CRUSADER",
	"HALFTRACK",
	"VOLATUS",
	"SUPERVOLITO",
	"SUPERVOLITO2"
	

}

-- CODE --

Citizen.CreateThread(function()
	while true do
		Wait(1)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			checkCar(GetVehiclePedIsIn(playerPed, false))

			x, y, z = table.unpack(GetEntityCoords(playerPed, true))
			for _, blacklistedCar in pairs(carblacklist) do
				checkCar(GetClosestVehicle(x, y, z, 100.0, GetHashKey(blacklistedCar), 70))
			end
		end
	end
end)

function checkCar(car)
	if car then
		carModel = GetEntityModel(car)
		carName = GetDisplayNameFromVehicleModel(carModel)

		if isCarBlacklisted(carModel) then
			_DeleteEntity(car)
			sendForbiddenMessage("This vehicle is blacklisted!")
		end
	end
end

function isCarBlacklisted(model)
	for _, blacklistedCar in pairs(carblacklist) do
		if model == GetHashKey(blacklistedCar) then
			return true
		end
	end

	return false
end