--===============================================--===============================================
--= stationary radars based on  https://github.com/DreanorGTA5Mods/StationaryRadar           =
--===============================================--===============================================
ESX              = nil
local PlayerData = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

local radares = {
    {x = 379.68807983398, y = -1048.3527832031, z = 29.250692367554},
    {x = -253.10794067383, y = -630.20385742188, z = 33.002685546875},
	{x = -201.3777923584, y = -522.90338134766, z = 34.153560638428},
	{x = -227.88055419922, y = -64.816833496094, z = 49.125984191895},
	{x = -55.754215240479, y = -107.16513824463, z = 57.338497161865},
	{x = -225.42152404785, y = -47.808887481689, z = 49.063480377197},
	{x = -790.82281494141, y = -65.880279541016, z = 37.180515289307},
	{x = -1033.5516357422, y = -193.52819824219, z = 37.258892059326},
{x = 581.05529785156, y = -366.34283447266, z = 43.020248413086},
{x = -142.87184143066, y = -1739.3713378906, z = 29.540693283081},
{x = 45.637058258057, y = -1678.9293212891, z = 28.717638015747},
{x = 54.355247497559, y = -1664.37890625, z = 28.726228713989},

	
}

Citizen.CreateThread(function()
    while true do
        Wait(0)
        for k,v in pairs(radares) do
            local player = GetPlayerPed(-1)
            local coords = GetEntityCoords(player, true)
            if Vdist2(radares[k].x, radares[k].y, radares[k].z, coords["x"], coords["y"], coords["z"]) < 65 then
                if PlayerData.job ~= nil and not (PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance') then
                    checkSpeed()
                end
            end
        end
    end
end)

function checkSpeed()
    local pP = GetPlayerPed(-1)
    local speed = GetEntitySpeed(pP)
    local vehicle = GetVehiclePedIsIn(pP, false)
    local driver = GetPedInVehicleSeat(vehicle, -1)
    local plate = GetVehicleNumberPlateText(vehicle)
    local maxspeed = 60
    local mphspeed = math.ceil(speed*2.236936)
	local fineamount = nil
	local finelevel = nil
	local truespeed = mphspeed
    if mphspeed > maxspeed and driver == pP then
        Citizen.Wait(250)
        TriggerServerEvent('fineAmount', mphspeed)
	if truespeed >= 60 and truespeed <= 71 then
	fineamount = Config.Fine
	finelevel = '10mph Over Limit'
	end
	if truespeed >= 70 and truespeed <= 81 then
	fineamount = Config.Fine2
	finelevel = '20mph Over Limit'
	end
	if truespeed >= 80 and truespeed <= 91 then
	fineamount = Config.Fine3
	finelevel = '30mph Over Limit'
	end
	if truespeed >= 91 and truespeed <= 5000 then
	fineamount = Config.Fine4
	finelevel = '40mph Over Limit'
	end
        exports.pNotify:SetQueueMax("left", 1)
        exports.pNotify:SendNotification({
            text = "<h2><center>Speed Camera</center></h2>" .. "</br>You've been issued a fine for speeding!</br>Plate Number: " .. plate .. "</br>Fine Amount: $" .. fineamount .. "</br>Violation: " .. finelevel .. "</br>Speed Limit: " .. maxspeed .. "</br>Your Speed: " ..mphspeed,
            type = "error",
            timeout = 9500,
            layout = "centerLeft",
            queue = "left"
        })
    end
end
