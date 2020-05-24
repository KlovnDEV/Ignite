ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_burg:Add')
AddEventHandler('esx_burg:Add', function(item, qtty)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	xPlayer.addInventoryItem(item, qtty)
end)

RegisterServerEvent('esx_burg:Remove')
AddEventHandler('esx_burg:Remove', function(item, qtty)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	xPlayer.removeInventoryItem(item, qtty)
end)

ESX.RegisterUsableItem('lockpick', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx_burg:Lockpick', _source)
	TriggerClientEvent('esx_burg:onUse', _source)
end)

RegisterNetEvent('esx_burg:removeKit')
AddEventHandler('esx_burg:removeKit', function()
	local _source = source 
	local xPlayer = ESX.GetPlayerFromId(_source)
		xPlayer.removeInventoryItem('lockpick', 1)
end)


            ---------- Pawn Shop --------------
RegisterServerEvent('esx_burg:sellring')
AddEventHandler('esx_burg:sellring', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local ring = 0
			
	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
			
		if item.name == "ring" then
			ring = item.count
		end
	end
				
		if ring > 0 then
			xPlayer.removeInventoryItem('ring', 1)
			xPlayer.addMoney(350)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "$350 added")
		else 
			TriggerClientEvent('esx:showNotification', xPlayer.source, "You don't have a ring to sell!")
		end
end)
			
RegisterServerEvent('esx_burg:sellrolex')
AddEventHandler('esx_burg:sellrolex', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local rolex = 0
			
	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
			
		if item.name == "rolex" then
			rolex = item.count
		end
	end
				
		if rolex > 0 then
			xPlayer.removeInventoryItem('rolex', 1)
			xPlayer.addMoney(1150)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "$1150 added")
		else 
			TriggerClientEvent('esx:showNotification', xPlayer.source, "You don't have a rolex to sell!")
		end
end)
			
RegisterServerEvent('esx_burg:sellcamera')
AddEventHandler('esx_burg:sellcamera', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local camera = 0
			
	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
			
		if item.name == "camera" then
			camera = item.count
		end
	end
				
	    if camera > 0 then
		  xPlayer.removeInventoryItem('camera', 1)
			xPlayer.addMoney(135)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "$135 added")
		else 
			TriggerClientEvent('esx:showNotification', xPlayer.source, "You don't have a camera to sell!")
	    end
end)
			
RegisterServerEvent('esx_burg:sellgoldNecklace')
AddEventHandler('esx_burg:sellgoldNecklace', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local goldNecklace = 0
			
	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
			
		if item.name == "goldNecklace" then
			goldNecklace = item.count
		end
	end
				
		if goldNecklace > 0 then
			xPlayer.removeInventoryItem('goldNecklace', 1)
			xPlayer.addMoney(345)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "$345 added")
		else 
			TriggerClientEvent('esx:showNotification', xPlayer.source, "You don't have a goldNecklace to sell!")
		end
end)
			
RegisterServerEvent('esx_burg:selllaptop')
AddEventHandler('esx_burg:selllaptop', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local laptop = 0
			
	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
			
		if item.name == "laptop" then
			laptop = item.count
		end
	end
				
		if laptop > 0 then
			xPlayer.removeInventoryItem('laptop', 1)
			xPlayer.addMoney(1750)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "$1750 added")
		else 
			TriggerClientEvent('esx:showNotification', xPlayer.source, "You don't have a laptop to sell!")
		end
end)
			
			
RegisterServerEvent('esx_burg:sellsamsungS10')
AddEventHandler('esx_burg:sellsamsungS10', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local samsungS10 = 0
			
	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
			
		if item.name == "samsungS10" then
			samsungS10 = item.count
		end
	end
				
		if samsungS10 > 0 then
			xPlayer.removeInventoryItem('samsungS10', 1)
			xPlayer.addMoney(925)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "$925 added")
		else 
			TriggerClientEvent('esx:showNotification', xPlayer.source, "You don't have a samsungS10 to sell!")
		end
end)
			
			
function notification(text)
	TriggerClientEvent('esx:showNotification', source, text)
end
