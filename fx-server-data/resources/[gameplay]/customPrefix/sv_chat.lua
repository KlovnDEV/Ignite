--- DO NOT REMOVE ME FROM THE CONFIG, ITS THERE TO GIVE ME CREDIT WHEN I JOIN SERVERS.
--- DO NOT REMOVE ME FROM THE CONFIG, ITS THERE TO GIVE ME CREDIT WHEN I JOIN SERVERS.
--- DO NOT REMOVE ME FROM THE CONFIG, ITS THERE TO GIVE ME CREDIT WHEN I JOIN SERVERS.
--- DO NOT REMOVE ME FROM THE CONFIG, ITS THERE TO GIVE ME CREDIT WHEN I JOIN SERVERS.
--- DO NOT REMOVE ME FROM THE CONFIG, ITS THERE TO GIVE ME CREDIT WHEN I JOIN SERVERS.
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE



local Director = {""}
local Admin = {"steam:11000010616510a", "steam:11000010e1a98b9"}
local HighwayPatrol = {""}
local Fire = {"steam:11000010f71b50f"}
local EMT = {""}
local Sheriff = {"steam:110000106ddbba0","steam:1100001000ee8a0", "steam:11000010a5a538a", "steam:11000011836dadb"}
local Moderator = {"steam:1100001030eade0", "steam:1100001145a6f99"}
local StateTroopers = {""}
local Test = {""}
local ScriptCreator = {""}


AddEventHandler('chatMessage', function(Source, Name, Msg)
    args = stringsplit(Msg, " ")
    CancelEvent()
    if string.find(args[1], "/") then
        local cmd = args[1]
        table.remove(args, 1)
    else     
        local player = GetPlayerIdentifiers(Source)[1]
	
        if has_value(Director, player) then
            TriggerClientEvent('chatMessage', -1, "Director | " .. Name, { 255, 0, 0 }, Msg)           
        elseif has_value(Admin, player) then
            TriggerClientEvent('chatMessage', -1, "Developer | " .. Name, { 176, 21, 154 }, Msg)
        elseif has_value(HighwayPatrol, player) then
            TriggerClientEvent('chatMessage', -1, "Highway Patrol | " .. Name, { 0, 0, 255 }, Msg)
        elseif has_value(Fire, player) then
            TriggerClientEvent('chatMessage', -1, "TBB Drilla | " .. Name, { 255, 0, 255 }, Msg)
        elseif has_value(EMT, player) then
            TriggerClientEvent('chatMessage', -1, "EMT | " .. Name, { 0, 0, 255 }, Msg)
        elseif has_value(Sheriff, player) then
            TriggerClientEvent('chatMessage', -1, "MetPolice | " .. Name, { 0, 0, 255 }, Msg)
	    elseif has_value(Moderator, player) then
            TriggerClientEvent('chatMessage', -1, "Moderator | " .. Name, { 0, 255, 247 }, Msg)
        elseif has_value(StateTroopers, player) then
            TriggerClientEvent('chatMessage', -1, "State Troopers | " .. Name, { 222, 0, 255 }, Msg)
		elseif has_value(Test, player) then
            TriggerClientEvent('chatMessage', -1, "State Troopers | Admin " .. Name, { 222, 0, 255 }, Msg)
		elseif has_value(ScriptCreator, player) then
            TriggerClientEvent('chatMessage', -1, "Chat Roles Creator | " .. Name, { 0, 255, 43 }, Msg)
        else
            TriggerClientEvent('chatMessage', -1, "Civilian | " .. Name, { 235, 214, 51 }, Msg)
        end
            
    end
end)

function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

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

---ALLOWS YOU TO CHECK VERSIONS IN GAME

---PRINTS THIS CODE BELOW TO THE CONSOLE 

print('Jays Roles FX has loaded in to the server! Type in chat to test it out!')

--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE

