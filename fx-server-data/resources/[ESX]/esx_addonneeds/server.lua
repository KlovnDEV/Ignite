ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('coke_pooch', function(source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	
	TriggerClientEvent('esx_addonneeds:cokeeffect', source)
	xPlayer.removeInventoryItem('coke_pooch', 1)
	TriggerClientEvent('esx:showNotification', source, 'Sniffed some coke...')
end)
