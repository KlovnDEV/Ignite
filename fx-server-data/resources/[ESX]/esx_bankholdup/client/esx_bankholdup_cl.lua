local holdingup = false
local bank = ""
local secondsRemaining = 0
local blipRobbery = nil
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

RegisterNetEvent('esx_bankholdup:currentlyrobbing')
AddEventHandler('esx_bankholdup:currentlyrobbing', function(robb)
	holdingup = true
	bank = robb
	secondsRemaining = 300
end)

RegisterNetEvent('esx_bankholdup:killblip')
AddEventHandler('esx_bankholdup:killblip', function()
    RemoveBlip(blipRobbery)
end)

RegisterNetEvent('esx_bankholdup:setblip')
AddEventHandler('esx_bankholdup:setblip', function(position)
    blipRobbery = AddBlipForCoord(position.x, position.y, position.z)
    SetBlipSprite(blipRobbery , 161)
    SetBlipScale(blipRobbery , 2.0)
    SetBlipColour(blipRobbery, 3)
    PulseBlip(blipRobbery)
end)

RegisterNetEvent('esx_bankholdup:toofarlocal')
AddEventHandler('esx_bankholdup:toofarlocal', function(robb)
	holdingup = false
	ESX.ShowNotification(_U('too_far'))
	robbingName = ""
	secondsRemaining = 0
	incircle = false
end)	


RegisterNetEvent('esx_bankholdup:robberycomplete')
AddEventHandler('esx_bankholdup:robberycomplete', function(robb)
	holdingup = false
	ESX.ShowNotification(_U('robbery_cancelled') .. Banks[bank].reward)
	bank = ""
	secondsRemaining = 0
	incircle = false
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if holdingup then
			Citizen.Wait(1000)
			if(secondsRemaining > 0)then
				secondsRemaining = secondsRemaining - 1
			end
		end
	end
end)

Citizen.CreateThread(function()
	for k,v in pairs(Banks)do
		local ve = v.position

		-- local blip = AddBlipForCoord(ve.x, ve.y, ve.z)
		-- SetBlipSprite(blip, 187) --156
		-- SetBlipScale(blip, 0.8)
		-- SetBlipColour(blip, 75)
		-- SetBlipAsShortRange(blip, true)
		-- BeginTextCommandSetBlipName("STRING")
		-- AddTextComponentString(_U('shop_robbery'))
		-- EndTextCommandSetBlipName(blip)
	end
end)
incircle = false

Citizen.CreateThread(function()
	while true do
		local pos = GetEntityCoords(GetPlayerPed(-1), true)

		for k,v in pairs(Banks)do
			local pos2 = v.position

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0)then
				if not holdingup then
					DrawMarker(1, v.position.x, v.position.y, v.position.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,255, 0, 0, 0,0)

					if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 1.0)then
						if (incircle == false) then
							DisplayHelpText(_U('press_to_rob') .. v.nameofbank)
						end
						incircle = true
						if IsControlJustReleased(1, 51) then
							TriggerServerEvent('esx_bankholdup:rob', k)
						end
					elseif(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 1.0)then
						incircle = false
					end
				end
			end
		end

		if holdingup then

			drawTxt(0.672, 1.32, 1.0,1.0,0.4, '~r~' .. secondsRemaining .. '~s~ seconds remaining', 255, 255, 255, 255)

			local pos2 = Banks[bank].position

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 7.5)then
				TriggerServerEvent('esx_bankholdup:toofar', bank)
			end
		end

		Citizen.Wait(0)
	end
end)
