ESX 						   = nil
local CopsConnected       	   = 0
local PlayersHarvestingCoke    = {}
local PlayersTransformingCoke  = {}
local PlayersSellingCoke       = {}
local PlayersHarvestingMeth    = {}
local PlayersTransformingMeth  = {}
local PlayersSellingMeth       = {}
local PlayersHarvestingWeed    = {}
local PlayersTransformingWeed  = {}
local PlayersSellingWeed       = {}
local PlayersHarvestingOpium   = {}
local PlayersTransformingOpium = {}
local PlayersSellingOpium      = {}

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

	SetTimeout(5000, CountCops)

end

CountCops()

-- Ketamine
local function HarvestCoke(source)

	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsCoke)
		return
	end

	SetTimeout(5000, function()

		if PlayersHarvestingCoke[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local coke = xPlayer.getInventoryItem('ket')
			if coke.limit ~= 50 and coke.count >= 50 then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_coke'))
			else
				xPlayer.addInventoryItem('ket', 1)
				HarvestCoke(source)
			end

		end
	end)
end

RegisterServerEvent('esx_extradrugs:startHarvestCoke')
AddEventHandler('esx_extradrugs:startHarvestCoke', function()

	local _source = source

	PlayersHarvestingCoke[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestCoke(_source)

end)

RegisterServerEvent('esx_extradrugs:stopHarvestCoke')
AddEventHandler('esx_extradrugs:stopHarvestCoke', function()

	local _source = source

	PlayersHarvestingCoke[_source] = false

end)

local function TransformCoke(source)

	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsCoke)
		return
	end

	SetTimeout(10000, function()

		if PlayersTransformingCoke[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local cokeQuantity = xPlayer.getInventoryItem('ket').count
			local poochQuantity = xPlayer.getInventoryItem('ket_pooch').count

			if poochQuantity > 35 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif cokeQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_coke'))
			else
				xPlayer.removeInventoryItem('ket', 5)
				xPlayer.addInventoryItem('ket_pooch', 1)
			
				TransformCoke(source)
			end

		end
	end)
end

RegisterServerEvent('esx_extradrugs:startTransformCoke')
AddEventHandler('esx_extradrugs:startTransformCoke', function()

	local _source = source

	PlayersTransformingCoke[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformCoke(_source)

end)

RegisterServerEvent('esx_extradrugs:stopTransformCoke')
AddEventHandler('esx_extradrugs:stopTransformCoke', function()

	local _source = source

	PlayersTransformingCoke[_source] = false

end)

local function SellCoke(source)

	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsCoke)
		return
	end

	SetTimeout(7500, function()

		if PlayersSellingCoke[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local poochQuantity = xPlayer.getInventoryItem('ket_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('ket_pooch', 1)
				if CopsConnected == 0 then
                    xPlayer.addAccountMoney('black_money', 700)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
                elseif CopsConnected == 1 then
                    xPlayer.addAccountMoney('black_money', 800)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
                elseif CopsConnected == 2 then
                    xPlayer.addAccountMoney('black_money', 900)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
                elseif CopsConnected == 3 then
                    xPlayer.addAccountMoney('black_money', 1000)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
                elseif CopsConnected == 4 then
                    xPlayer.addAccountMoney('black_money', 1100)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
                elseif CopsConnected >= 5 then
                    xPlayer.addAccountMoney('black_money', 1200)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
                end
				
				SellCoke(source)
			end

		end
	end)
end

RegisterServerEvent('esx_extradrugs:startSellCoke')
AddEventHandler('esx_extradrugs:startSellCoke', function()

	local _source = source

	PlayersSellingCoke[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellCoke(_source)

end)

RegisterServerEvent('esx_extradrugs:stopSellCoke')
AddEventHandler('esx_extradrugs:stopSellCoke', function()

	local _source = source

	PlayersSellingCoke[_source] = false

end)

-- Xanax
local function HarvestMeth(source)

	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsMeth)
		return
	end
	
	SetTimeout(5000, function()

		if PlayersHarvestingMeth[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local meth = xPlayer.getInventoryItem('xanax')
			-- if coke.limit ~= 50 and coke.count >= 50 then
			if meth.limit ~= 50 and meth.count >= 50 then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_meth'))
			else
				xPlayer.addInventoryItem('xanax', 1)
				HarvestMeth(source)
			end

		end
	end)
end

RegisterServerEvent('esx_extradrugs:startHarvestMeth')
AddEventHandler('esx_extradrugs:startHarvestMeth', function()

	local _source = source

	PlayersHarvestingMeth[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestMeth(_source)

end)

RegisterServerEvent('esx_extradrugs:stopHarvestMeth')
AddEventHandler('esx_extradrugs:stopHarvestMeth', function()

	local _source = source

	PlayersHarvestingMeth[_source] = false

end)

local function TransformMeth(source)

	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsMeth)
		return
	end

	SetTimeout(12000, function()

		if PlayersTransformingMeth[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local methQuantity = xPlayer.getInventoryItem('xanax').count
			local poochQuantity = xPlayer.getInventoryItem('xanax_pooch').count

			if poochQuantity > 35 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif methQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_meth'))
			else
				xPlayer.removeInventoryItem('xanax', 5)
				xPlayer.addInventoryItem('xanax_pooch', 1)
				
				TransformMeth(source)
			end

		end
	end)
end

RegisterServerEvent('esx_extradrugs:startTransformMeth')
AddEventHandler('esx_extradrugs:startTransformMeth', function()

	local _source = source

	PlayersTransformingMeth[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformMeth(_source)

end)

RegisterServerEvent('esx_extradrugs:stopTransformMeth')
AddEventHandler('esx_extradrugs:stopTransformMeth', function()

	local _source = source

	PlayersTransformingMeth[_source] = false

end)

local function SellMeth(source)

	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsMeth)
		return
	end

	SetTimeout(7500, function()

		if PlayersSellingMeth[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local poochQuantity = xPlayer.getInventoryItem('xanax_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('xanax_pooch', 1)
				if CopsConnected == 0 then
                    xPlayer.addAccountMoney('black_money', 800)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
                elseif CopsConnected == 1 then
                    xPlayer.addAccountMoney('black_money', 900)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
                elseif CopsConnected == 2 then
                    xPlayer.addAccountMoney('black_money', 1000)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
                elseif CopsConnected == 3 then
                    xPlayer.addAccountMoney('black_money', 1100)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
                elseif CopsConnected == 4 then
                    xPlayer.addAccountMoney('black_money', 1200)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
                elseif CopsConnected == 5 then
                    xPlayer.addAccountMoney('black_money', 1300)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
                elseif CopsConnected >= 6 then
                    xPlayer.addAccountMoney('black_money', 1400)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
                end
				
				SellMeth(source)
			end

		end
	end)
end

RegisterServerEvent('esx_extradrugs:startSellMeth')
AddEventHandler('esx_extradrugs:startSellMeth', function()

	local _source = source

	PlayersSellingMeth[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellMeth(_source)

end)

RegisterServerEvent('esx_extradrugs:stopSellMeth')
AddEventHandler('esx_extradrugs:stopSellMeth', function()

	local _source = source

	PlayersSellingMeth[_source] = false

end)

-- Valium
local function HarvestWeed(source)

	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsWeed)
		return
	end

	SetTimeout(5000, function()

		if PlayersHarvestingWeed[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local weed = xPlayer.getInventoryItem('valium')

			if weed.limit ~= 50 and weed.count >= 50 then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_weed'))
			else
				xPlayer.addInventoryItem('valium', 1)
				HarvestWeed(source)
			end

		end
	end)
end

RegisterServerEvent('esx_extradrugs:startHarvestWeed')
AddEventHandler('esx_extradrugs:startHarvestWeed', function()

	local _source = source

	PlayersHarvestingWeed[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestWeed(_source)

end)

RegisterServerEvent('esx_extradrugs:stopHarvestWeed')
AddEventHandler('esx_extradrugs:stopHarvestWeed', function()

	local _source = source

	PlayersHarvestingWeed[_source] = false

end)

local function TransformWeed(source)

	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsWeed)
		return
	end

	SetTimeout(7500, function()

		if PlayersTransformingWeed[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local weedQuantity = xPlayer.getInventoryItem('valium').count
			local poochQuantity = xPlayer.getInventoryItem('valium_pooch').count

			if poochQuantity > 35 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif weedQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_weed'))
			else
				xPlayer.removeInventoryItem('valium', 5)
				xPlayer.addInventoryItem('valium_pooch', 1)
				
				TransformWeed(source)
			end

		end
	end)
end

RegisterServerEvent('esx_extradrugs:startTransformWeed')
AddEventHandler('esx_extradrugs:startTransformWeed', function()

	local _source = source

	PlayersTransformingWeed[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformWeed(_source)

end)

RegisterServerEvent('esx_extradrugs:stopTransformWeed')
AddEventHandler('esx_extradrugs:stopTransformWeed', function()

	local _source = source

	PlayersTransformingWeed[_source] = false

end)

local function SellWeed(source)

	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('esx_weedjob:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsWeed)
		return
	end

	SetTimeout(7500, function()

		if PlayersSellingWeed[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local poochQuantity = xPlayer.getInventoryItem('valium_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('valium_pooch', 1)
                if CopsConnected == 0 then
                    xPlayer.addAccountMoney('black_money', 500)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
                elseif CopsConnected == 1 then
                    xPlayer.addAccountMoney('black_money', 600)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
                elseif CopsConnected == 2 then
                    xPlayer.addAccountMoney('black_money', 700)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
                elseif CopsConnected == 3 then
                    xPlayer.addAccountMoney('black_money', 800)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
                elseif CopsConnected >= 4 then
                    xPlayer.addAccountMoney('black_money', 900)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
                end
				
				SellWeed(source)
			end

		end
	end)
end

RegisterServerEvent('esx_extradrugs:startSellWeed')
AddEventHandler('esx_extradrugs:startSellWeed', function()

	local _source = source

	PlayersSellingWeed[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellWeed(_source)

end)

RegisterServerEvent('esx_extradrugs:stopSellWeed')
AddEventHandler('esx_extradrugs:stopSellWeed', function()

	local _source = source

	PlayersSellingWeed[_source] = false

end)


--opium

local function HarvestOpium(source)

	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsOpium)
		return
	end

	SetTimeout(5000, function()

		if PlayersHarvestingOpium[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local opium = xPlayer.getInventoryItem('opium')
			-- if coke.limit ~= 50 and coke.count >= 50 then
			if opium.limit ~= 50 and opium.count >= 50 then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_opium'))
			else
				xPlayer.addInventoryItem('opium', 1)
				HarvestOpium(source)
			end

		end
	end)
end

RegisterServerEvent('esx_extradrugs:startHarvestOpium')
AddEventHandler('esx_extradrugs:startHarvestOpium', function()

	local _source = source

	PlayersHarvestingOpium[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestOpium(_source)

end)

RegisterServerEvent('esx_extradrugs:stopHarvestOpium')
AddEventHandler('esx_extradrugs:stopHarvestOpium', function()

	local _source = source

	PlayersHarvestingOpium[_source] = false

end)

local function TransformOpium(source)

	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsOpium)
		return
	end

	SetTimeout(10000, function()

		if PlayersTransformingOpium[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local opiumQuantity = xPlayer.getInventoryItem('opium').count
			local poochQuantity = xPlayer.getInventoryItem('opium_pooch').count

			if poochQuantity > 35 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif opiumQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_opium'))
			else
				xPlayer.removeInventoryItem('opium', 5)
				xPlayer.addInventoryItem('opium_pooch', 1)
			
				TransformOpium(source)
			end

		end
	end)
end

RegisterServerEvent('esx_extradrugs:startTransformOpium')
AddEventHandler('esx_extradrugs:startTransformOpium', function()

	local _source = source

	PlayersTransformingOpium[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformOpium(_source)

end)

RegisterServerEvent('esx_extradrugs:stopTransformOpium')
AddEventHandler('esx_extradrugs:stopTransformOpium', function()

	local _source = source

	PlayersTransformingOpium[_source] = false

end)

local function SellOpium(source)

	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsOpium)
		return
	end

	SetTimeout(7500, function()

		if PlayersSellingOpium[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local poochQuantity = xPlayer.getInventoryItem('opium_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('opium_pooch', 1)
				if CopsConnected == 0 then
                    xPlayer.addAccountMoney('black_money', 1000)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
                elseif CopsConnected == 1 then
                    xPlayer.addAccountMoney('black_money', 1100)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
                elseif CopsConnected == 2 then
                    xPlayer.addAccountMoney('black_money', 1200)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
                elseif CopsConnected == 3 then
                    xPlayer.addAccountMoney('black_money', 1300)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
                elseif CopsConnected == 4 then
                    xPlayer.addAccountMoney('black_money', 1400)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
                elseif CopsConnected >= 5 then
                    xPlayer.addAccountMoney('black_money', 1500)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
                end
				
				SellOpium(source)
			end

		end
	end)
end

RegisterServerEvent('esx_extradrugs:startSellOpium')
AddEventHandler('esx_extradrugs:startSellOpium', function()

	local _source = source

	PlayersSellingOpium[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellOpium(_source)

end)

RegisterServerEvent('esx_extradrugs:stopSellOpium')
AddEventHandler('esx_extradrugs:stopSellOpium', function()

	local _source = source

	PlayersSellingOpium[_source] = false

end)


-- RETURN INVENTORY TO CLIENT
RegisterServerEvent('esx_extradrugs:GetUserInventory')
AddEventHandler('esx_extradrugs:GetUserInventory', function(currentZone)
	local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_extradrugs:ReturnInventory', 
    	_source, 
    	xPlayer.getInventoryItem('ket').count, 
		xPlayer.getInventoryItem('ket_pooch').count,
		xPlayer.getInventoryItem('xanax').count, 
		xPlayer.getInventoryItem('xanax_pooch').count, 
		xPlayer.getInventoryItem('valium').count, 
		xPlayer.getInventoryItem('valium_pooch').count, 
		xPlayer.getInventoryItem('opium').count, 
		xPlayer.getInventoryItem('opium_pooch').count,
		xPlayer.job.name, 
		currentZone
    )
end)

-- Register Usable Item
ESX.RegisterUsableItem('weed', function(source)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('weed', 1)

	TriggerClientEvent('esx_extradrugs:onPot', _source)
    TriggerClientEvent('esx:showNotification', _source, _U('used_one_weed'))

end)

