local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, ["F11"] = 344, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX          = nil
local GUI    = {}
local isDead = false
GUI.Time     = 0

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function OpenVehicleKontrollMenu()

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'VehicleMenu',
	{
		title    = 'Vehicle Doors Menu',
		align    = 'top-left',
		elements = {
		{label = 'Open Hood', value = 'openHood'},
		{label = 'Open Front Left Door', value = 'openLeft'},
		{label = 'Open Front Right Door', value = 'openRight'},
	        {label = 'Open Back Left Door', value = 'openBack'},
	        {label = 'Open Back Right Door', value = 'openBack2'},
	        {label = 'Open Trunk', value = 'openTrunk'},
		},
	},
	
	function(data, menu)

       if data.current.value == 'openLeft' then
     TriggerEvent('openLeft')
      end

        if data.current.value == 'openRight' then
     TriggerEvent('openRight')
      end

        if data.current.value == 'openBack' then
     TriggerEvent('openBack')
      end

       if data.current.value == 'openBack2' then
     TriggerEvent('openBack2')
      end

        if data.current.value == 'openHood' then
     TriggerEvent('openHood')
      end

        if data.current.value == 'openTrunk' then
     TriggerEvent('openTrunk')
      end
    end,

	function(data, menu)
		menu.close()
		end
	)

end

-- Doors

RegisterNetEvent( 'openLeft' )
AddEventHandler( 'openLeft', function()

    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if GetVehicleDoorAngleRatio(veh, 0) > 0 then
            SetVehicleDoorShut(veh, 0, false)
        else
            SetVehicleDoorOpen(veh, 0, false, false)
        end
    end
end, false)

RegisterNetEvent( 'openRight' )
AddEventHandler( 'openRight', function()

    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if GetVehicleDoorAngleRatio(veh, 1) > 0 then
            SetVehicleDoorShut(veh, 1, false)
        else
            SetVehicleDoorOpen(veh, 1, false, false)
        end
    end
end, false)

RegisterNetEvent( 'openBack' )
AddEventHandler( 'openBack', function()

    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if GetVehicleDoorAngleRatio(veh, 2) > 0 then
            SetVehicleDoorShut(veh, 2, false)
        else
            SetVehicleDoorOpen(veh, 2, false, false)
        end
    end
end, false)

RegisterNetEvent( 'openBack2' )
AddEventHandler( 'openBack2', function()

    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if GetVehicleDoorAngleRatio(veh, 3) > 0 then
            SetVehicleDoorShut(veh, 3, false)
        else
            SetVehicleDoorOpen(veh, 3, false, false)
        end
    end
end, false)

RegisterNetEvent( 'openTrunk' )
AddEventHandler( 'openTrunk', function()

    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if GetVehicleDoorAngleRatio(veh, 5) > 0 then
            SetVehicleDoorShut(veh, 5, false)
        else
            SetVehicleDoorOpen(veh, 5, false, false)
        end
    end
end, false)

RegisterNetEvent( 'openHood' )
AddEventHandler( 'openHood', function()

    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if GetVehicleDoorAngleRatio(veh, 4) > 0 then
            SetVehicleDoorShut(veh, 4, false)
        else
            SetVehicleDoorOpen(veh, 4, false, false)
        end
    end
end, false)


-- key Controls
Citizen.CreateThread(function()
  while true do
  Citizen.Wait(0)

	  if IsControlJustReleased(0, Keys['PAGEDOWN']) then --Can be changed to a prefered key selection
	  	OpenVehicleKontrollMenu()
	  end

  end
end)
