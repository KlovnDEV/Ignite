local twt 		= true
local ooc 		= true
local me 		= true
local news 	= false

AddEventHandler('chatMessage', function(source, name, msg)
	local command 	= stringsplit(msg, " ")[1];

	if command == "/ooc" then
		if not ooc then
			CancelEvent()
			TriggerClientEvent('chatMessage', source, '[SERVER]', {132, 13, 37}, 'This command is closed by the server.')
		else
			CancelEvent()
			if Config.EnableESXIdentity then name = GetCharacterName(source) end
			TriggerClientEvent('chatMessage', -1, ('OOC | '.. name ..''), { 0, 255, 107 }, string.sub(msg, 5))
		end
	elseif command == "/anon" then
		if not twt then
			CancelEvent()
			TriggerClientEvent('chatMessage', source, '[SERVER]', {132, 13, 37}, 'This command is closed by the server.')
		else
			CancelEvent()
			if Config.EnableESXIdentity then name = GetCharacterName(source) end
			-- ESX.GetPlayerFromId(source).removeAccountMoney('bank', 500)
			TriggerClientEvent('chatMessage', -1, ('[Anonymous] '), { 30, 144, 255 }, string.sub(msg, 6))
		end
	elseif command == "/twitter" then
		if not twt then
			CancelEvent()
			TriggerClientEvent('chatMessage', source, '[SERVER]', {132, 13, 37}, 'This command is closed by the server.')
		else
			CancelEvent()
			if Config.EnableESXIdentity then name = GetCharacterName(source) end
			TriggerClientEvent('chatMessage', -1, ('[Twitter] (@'.. name ..')'), { 30, 144, 255 }, string.sub(msg, 9))
		end
	elseif command == "/me" then
		if not ooc then
			CancelEvent()
			TriggerClientEvent('chatMessage', source, '[SERVER]', {132, 13, 37}, 'This command is closed by the server.')
		else
			CancelEvent()
			if Config.EnableESXIdentity then name = GetCharacterName(source) end
			TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, (name .. string.sub(msg, 5)), { 255, 165, 0 })
		end
	elseif command == "/news" then
		if not news then
			CancelEvent()
			TriggerClientEvent('chatMessage', source, '[SERVER]', {132, 13, 37}, 'This command is closed by the server.')
		else
			CancelEvent()
			if Config.EnableESXIdentity then name = GetCharacterName(source) end
			TriggerClientEvent('chatMessage', -1, ('News - '.. name .. string.sub(msg, 9)), { 249, 166, 0 })
		end
    end
end)

TriggerEvent('es:addGroupCommand', 'rpchat', 'mod', function(source, args)
	if args[1] == 'twt' then
		if not twt then
			twt = true
			TriggerClientEvent('chatMessage', -1, '[SERVER]', {132, 13, 37}, 'The command /twt was now opened again.')
			CancelEvent()
		else
			twt = false
			TriggerClientEvent('chatMessage', -1, '[SERVER]', {132, 13, 37}, 'The command /twt was shut down by the server.')
			CancelEvent()
		end
	elseif args[1] == 'ooc' then
		if not ooc then
			ooc = true
			TriggerClientEvent('chatMessage', -1, '[SERVER]', {132, 13, 37}, 'The command /ooc was now opened again.')
			CancelEvent()
		else
			ooc = false
			TriggerClientEvent('chatMessage', -1, '[SERVER]', {132, 13, 37}, 'The command /ooc was shut down by the server.')
			CancelEvent()
		end
	elseif args[1] == 'meg' then
		if not me then
			me = true
			TriggerClientEvent('chatMessage', -1, '[SERVER]', {132, 13, 37}, 'The command /me was now opened again.')
			CancelEvent()
		else
			me = false
			TriggerClientEvent('chatMessage', -1, '[SERVER]', {132, 13, 37}, 'The command /me was shut down by the server.')
			CancelEvent()
		end
	elseif args[1] == 'news' then
		if not news then
			news = true
			TriggerClientEvent('chatMessage', -1, '[SERVER]', {132, 13, 37}, 'The command /news was now opened again.')
			CancelEvent()
		else
			news = false
			TriggerClientEvent('chatMessage', -1, '[SERVER]', {132, 13, 37}, 'The command /news was shut down by the server.')
			CancelEvent()
		end
	else
		TriggerClientEvent('chatMessage', source, '[SERVER]', {132, 13, 37}, 'Unknown command.')
		CancelEvent()
	end
end)

function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end

function GetCharacterName(source)
	-- fetch identity in sync
	local result = MySQL.Sync.fetchAll('SELECT * FROM users WHERE identifier = @identifier',
	{
		['@identifier'] = GetPlayerIdentifiers(source)[1]
	})

	if result[1] ~= nil and result[1].firstname ~= nil and result[1].lastname ~= nil then
		if Config.OnlyFirstname then
			return result[1].firstname
		else
			return result[1].firstname .. ' ' .. result[1].lastname
		end
	else
		return GetPlayerName(source)
	end
end
