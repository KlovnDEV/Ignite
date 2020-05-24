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
			local koda = xPlayer.getInventoryItem('bitcoin')

			if koda.limit ~= 25 and koda.count >= 25 then
				TriggerClientEvent('esx:showNotification', source, _U('mochila_full'))
			else
			
				-- TaskPlayAnim(4,"amb@world_human_golf_player@male@idle_a","idle_a",1.0,-1.0, -1, 1, 1, true, true, true)
				xPlayer.addInventoryItem('bitcoin', 1)
				HarvestKoda(source)
			end
		end
	end)
end

RegisterServerEvent('esx_newbitcoin:startHarvestKoda')
AddEventHandler('esx_newbitcoin:startHarvestKoda', function()
	local _source = source

	if not PlayersHarvestingKoda[_source] then
		PlayersHarvestingKoda[_source] = true

		TriggerClientEvent('esx:showNotification', _source, _U('pegar_frutos'))
		HarvestKoda(_source)
	else
		print(('esx_newbitcoin: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_newbitcoin:stopHarvestKoda')
AddEventHandler('esx_newbitcoin:stopHarvestKoda', function()
	local _source = source

	PlayersHarvestingKoda[_source] = false
end)

local function TransformKoda(source)

	SetTimeout(Config.TimeToProcess, function()
		if PlayersTransformingKoda[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local kodaQuantity = xPlayer.getInventoryItem('bitcoin').count
			local pooch = xPlayer.getInventoryItem('bitcoin')

			if pooch.limit ~= -1 and pooch.count >= pooch.limit then
				TriggerClientEvent('esx:showNotification', source, _U('nao_tens_frutos_suficientes'))
			elseif kodaQuantity < 2 then
				TriggerClientEvent('esx:showNotification', source, _U('nao_tens_mais_frutos'))
			else
				xPlayer.removeInventoryItem('bitcoin', 2)
				xPlayer.addInventoryItem('bitcoin', 1)

				TransformKoda(source)
			end
		end
	end)
end

RegisterServerEvent('esx_newbitcoin:startTransformKoda')
AddEventHandler('esx_newbitcoin:startTransformKoda', function()
	local _source = source

	if not PlayersTransformingKoda[_source] then
		PlayersTransformingKoda[_source] = true

		TriggerClientEvent('esx:showNotification', _source, _U('colocar_frutos_dentro_dos_sacos'))
		TransformKoda(_source)
	else
		print(('esx_newbitcoin: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_newbitcoin:startTrading')
AddEventHandler('esx_newbitcoin:startTrading', function(amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	amount = ESX.Math.Round(tonumber(amount))
	washedCash = amount  * math.random(1000,3500)
	washedTotal = ESX.Math.Round(tonumber(washedCash))

	-- logic
	if amount > 0 then
		xPlayer.removeInventoryItem('bitcoin', amount)
		TriggerClientEvent('esx:showNotifcation', xPlayer.source, '~g~Trading Started~w~')
		Citizen.Wait(1019730) -- 16 mins...

		--
		TriggerClientEvent('esx:showNotifcation', xPlayer.source, '~y~Portfolio Updated~w~')
		xPlayer.addAccountMoney('black_money', washedTotal)
	else
		print('fucking error.....')
	end
end)

	
RegisterServerEvent('esx_newbitcoin:startSellKoda')
AddEventHandler('esx_newbitcoin:startSellKoda', function()
	local _source = source

	if not PlayersSellingKoda[_source] then
		PlayersSellingKoda[_source] = true

		TriggerClientEvent('esx:showNotification', _source, _U('venda_do_sacos'))
		SellKoda(_source)
	else
		print(('esx_newbitcoin: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_newbitcoin:stopSellKoda')
AddEventHandler('esx_newbitcoin:stopSellKoda', function()
	local _source = source

	PlayersSellingKoda[_source] = false
end)

RegisterServerEvent('esx_newbitcoin:GetUserInventory')
AddEventHandler('esx_newbitcoin:GetUserInventory', function(currentZone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx_newbitcoin:ReturnInventory',
		_source,
		xPlayer.getInventoryItem('bitcoin').count,
		xPlayer.getInventoryItem('bitcoin').count,
		xPlayer.job.name,
		currentZone
	)
end)

--[[
ESX.RegisterUsableItem('bitcoin', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('bitcoin', 1)

	TriggerClientEvent('esx_newbitcoin:onPot', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('used_one_koda'))
end)
]]--

