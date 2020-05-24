ESX 						   = nil
local CopsConnected       	   = 0
local PlayersHarvestingKoda    = {}
local PlayersTransformingKoda  = {}
local PlayersSellingKoda       = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function CountCops()
	local xPlayers = ESX.GetPlayers()
	CopsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			CopsConnected = CopsConnected + 1
		end
	end

	SetTimeout(120 * 1000, CountCops)
end

CountCops()

--kodeina
local function HarvestKoda(source)
	SetTimeout(Config.TimeToFarm, function()
		if PlayersHarvestingKoda[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local koda = xPlayer.getInventoryItem('ethereum')

			if koda.limit ~= 60 and koda.count >= 60 then
				TriggerClientEvent('esx:showNotification', source, _U('mochila_full'))
			else
			
				-- TaskPlayAnim(4,"amb@world_human_golf_player@male@idle_a","idle_a",1.0,-1.0, -1, 1, 1, true, true, true)
				xPlayer.addInventoryItem('ethereum', 1)
				HarvestKoda(source)
			end
		end
	end)
end

RegisterServerEvent('esx_ethereum:startHarvestKoda')
AddEventHandler('esx_ethereum:startHarvestKoda', function()
	local _source = source

	if not PlayersHarvestingKoda[_source] then
		PlayersHarvestingKoda[_source] = true

		TriggerClientEvent('esx:showNotification', _source, _U('pegar_frutos'))
		HarvestKoda(_source)
	else
		print(('esx_ethereum: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_ethereum:stopHarvestKoda')
AddEventHandler('esx_ethereum:stopHarvestKoda', function()
	local _source = source

	PlayersHarvestingKoda[_source] = false
end)

local function TransformKoda(source)

	SetTimeout(Config.TimeToProcess, function()
		if PlayersTransformingKoda[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local kodaQuantity = xPlayer.getInventoryItem('ethereum').count
			local pooch = xPlayer.getInventoryItem('ethereum')

			if pooch.limit ~= -1 and pooch.count >= pooch.limit then
				TriggerClientEvent('esx:showNotification', source, _U('nao_tens_frutos_suficientes'))
			elseif kodaQuantity < 2 then
				TriggerClientEvent('esx:showNotification', source, _U('nao_tens_mais_frutos'))
			else
				xPlayer.removeInventoryItem('etherum', 2)
				xPlayer.addInventoryItem('ethereum', 1)

				TransformKoda(source)
			end
		end
	end)
end

RegisterServerEvent('esx_ethereum:startTransformKoda')
AddEventHandler('esx_ethereum:startTransformKoda', function()
	local _source = source

	if not PlayersTransformingKoda[_source] then
		PlayersTransformingKoda[_source] = true

		TriggerClientEvent('esx:showNotification', _source, _U('colocar_frutos_dentro_dos_sacos'))
		TransformKoda(_source)
	else
		print(('esx_ethereum: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_ethereum:stopTransformKoda')
AddEventHandler('esx_ethereum:stopTransformKoda', function()
	local _source = source

	PlayersTransformingKoda[_source] = false
end)

local function SellKoda(source)

	SetTimeout(Config.TimeToSell, function()
		if PlayersSellingKoda[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local poochQuantity = xPlayer.getInventoryItem('ethereum').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('nao_tens_sacos_com_frutos'))
			else
				xPlayer.removeInventoryItem('ethereum', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', math.ceil(math.random(2500,2800)))
					TriggerClientEvent('esx:showNotification', source, _U('vendeste_sacos'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', math.random(2500,2800) + 150)
					TriggerClientEvent('esx:showNotification', source, _U('vendeste_sacos'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', math.random(2500,2900) + 250)
					TriggerClientEvent('esx:showNotification', source, _U('vendeste_sacos'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', math.random(2500,3000) + 350)
					TriggerClientEvent('esx:showNotification', source, _U('vendeste_sacos'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', math.random(2500,3500) + 450)
					TriggerClientEvent('esx:showNotification', source, _U('vendeste_sacos'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', math.random(3000,9000) + 550)
					TriggerClientEvent('esx:showNotification', source, _U('vendeste_sacos'))
				end

				SellKoda(source)
			end
		end
	end)
end

RegisterServerEvent('esx_ethereum:startSellKoda')
AddEventHandler('esx_ethereum:startSellKoda', function()
	local _source = source

	if not PlayersSellingKoda[_source] then
		PlayersSellingKoda[_source] = true

		TriggerClientEvent('esx:showNotification', _source, _U('venda_do_sacos'))
		SellKoda(_source)
	else
		print(('esx_ethereum: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_ethereum:stopSellKoda')
AddEventHandler('esx_ethereum:stopSellKoda', function()
	local _source = source

	PlayersSellingKoda[_source] = false
end)

RegisterServerEvent('esx_ethereum:GetUserInventory')
AddEventHandler('esx_ethereum:GetUserInventory', function(currentZone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx_ethereum:ReturnInventory',
		_source,
		xPlayer.getInventoryItem('ethereum').count,
		xPlayer.getInventoryItem('ethereum').count,
		xPlayer.job.name,
		currentZone
	)
end)
