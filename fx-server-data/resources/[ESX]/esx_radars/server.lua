ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('fineAmount')
AddEventHandler('fineAmount', function(mphspeed)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local truespeed = mphspeed
	-- Take the fines from the players bank account not cash
	if truespeed >= 55 and truespeed <= 65 then
	xPlayer.removeAccountMoney('bank', Config.Fine)
	end
	if truespeed >= 65 and truespeed <= 75 then
	--xPlayer.removeMoney(Config.Fine2)
	xPlayer.removeAccountMoney('bank', Config.Fine)
	end
	if truespeed >= 75 and truespeed <= 85 then
	xPlayer.removeAccountMoney('bank', Config.Fine)
	--xPlayer.removeMoney(Config.Fine3)
	end
	if truespeed >= 85 and truespeed <= 200 then
	xPlayer.removeAccountMoney('bank', Config.Fine)
	-- xPlayer.removeMoney(Config.Fine4)
	end
	CancelEvent()
end)
