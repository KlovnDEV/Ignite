local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local kodaQTE       			= 0
ESX 			    			= nil
local koda_poochQTE 			= 0
local myJob 					= nil
local HasAlreadyEnteredMarker   = false
local LastZone                  = nil
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function OpenWashedMenu(zone)
	local elements = {
		{label = _U('wash_money'), 	value = 'wash_money'},
		{label = _U('no'),			value = 'no'}
		}
		
		ESX.UI.Menu.CloseAll()
		
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'wash', {
			title		= 'forex trader',
			align		= 'top-left',
			elements	= elements
		}, function(data, menu)
			if data.current.value == 'wash_money' then
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'wash_money_amount_', {
					title = _U('wash_money_amount')
				}, function(data, menu)
				
					local amount = tonumber(data.value)
					
					if amount == nil then
						ESX.ShowNotification(_U('invalid_amount'))
					else
						menu.close()
						TriggerServerEvent('esx_newbitcoin:startTrading', amount)
					end
				end, function(data, menu)
					menu.close()
				end)
			end
			if data.current.value == 'no' then
				menu.close()
			end
			end, function(data, menu)
				
				menu.close()
					
				CurrentAction	 = 'wash_menu'
				CurrentActionMsg = _U('press_menu')
				CurrentActionData = {zone = zone}
					
			
		end)

end



AddEventHandler('esx_newbitcoin:hasEnteredMarker', function(zone)
	if myJob == 'police' or myJob == 'ambulance' then
		return
	end

	local playerPed = PlayerPedId()
	ESX.UI.Menu.CloseAll()
	
	if zone == 'BitCoin' then
		CurrentAction     = ''
		CurrentActionMsg  = _U('carrega_para_apanhares_frutos')
		CurrentActionData = {}
	elseif zone == 'ProcessamentoDeVinho' then
		if kodaQTE >= 5 then
			CurrentAction     = zone
			CurrentActionMsg  = _U('carrega_para_colocares_frutos_dentro_dos_sacos')
			CurrentActionData = {}
		end
	elseif zone == 'SellingBitcoin' then
		if 1 == 1 then
			CurrentAction     = 'wash_menu'
			CurrentActionMsg  = _U('carrega_para_venderes_os_sacos')
			CurrentActionData = {zone = zone}
		end
	end
end)

AddEventHandler('esx_newbitcoin:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()


--	if zone == 'BitCoin' then
--		TriggerServerEvent('esx_newbitcoin:stopHarvestKoda')
--	elseif zone == 'ProcessamentoDeVinho' then
--	TriggerServerEvent('esx_newbitcoin:stopTransformKoda')
--	elseif zone == 'VendaDeBitcon' then
--	TriggerServerEvent('esx_newbitcoin:startTrading')
--	end
--end)

-- marker
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		local coords = GetEntityCoords(GetPlayerPed(-1))
		
		for k,v in pairs(Config.Zones) do
			if GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.DrawDistance then
				DrawMarker(Config.MarkerType, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
			end
		end

	end
end)

if Config.ShowBlips then
	-- oznaczenie
	Citizen.CreateThread(function()
		for k,v in pairs(Config.Zones) do
			local blip = AddBlipForCoord(v.x, v.y, v.z)

			SetBlipSprite (blip, v.sprite)
			SetBlipDisplay(blip, 4)
			SetBlipScale  (blip, 0.9)
			SetBlipColour (blip, v.color)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(v.name)
			EndTextCommandSetBlipName(blip)
		end
	end)
end


-- itemsy
RegisterNetEvent('esx_newbitcoin:ReturnInventory')
AddEventHandler('esx_newbitcoin:ReturnInventory', function(kodaNbr, kodapNbr, jobName, currentZone)
	kodaQTE			= kodaNbr
	koda_poochQTE	= kodapNbr
	myJob			= jobName
	TriggerEvent('esx_newbitcoin:hasEnteredMarker', currentZone)
end)

-- menu w markerze
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false
		local currentZone = nil

		for k,v in pairs(Config.Zones) do
			if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 2.5) then
				isInMarker  = true
				currentZone = k
			end
		end

		if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			lastZone				= currentZone
			TriggerServerEvent('esx_newbitcoin:GetUserInventory', currentZone)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('esx_newbitcoin:hasExitedMarker', lastZone)
		end
	end
end)

-- klawisze
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if 1 == 1 then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, Keys['E']) and IsPedOnFoot(PlayerPedId()) then
				if CurrentAction == 'BitCoin' then
					TriggerServerEvent('esx_newbitcoin:startHarvestKoda')
				elseif CurrentAction == 'ProcessamentoDeVinho' then
					TriggerServerEvent('esx_newbitcoin:startTransformKoda')
				elseif CurrentAction == 'VendaDeBitcon' then
					OpenWashedMenu(CurrentActionData.zone)
					-- TriggerServerEvent('esx_newbitcoin:startSellKoda')
				end
				
				CurrentAction = nil
			end
		end
	end
 end)

end
)
