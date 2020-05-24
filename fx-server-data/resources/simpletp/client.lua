key_to_teleport = 38

positions = {
    --[[
    {{Teleport1 X, Teleport1 Y, Teleport1 Z, Teleport1 Heading}, {Teleport2 X, Teleport 2Y, Teleport 2Z, Teleport2 Heading}, {Red, Green, Blue}, "Text for Teleport"}
    ]]


    {{1743.79, -1622.97, 115.2, 0}, {996.9, -3200.7, -36.85, 0}, {0,160,255}, ""}, -- Meth Selling Area

    {{589.41,-3269.9,5.2,0}, {1088.8,-3188.31,-40.0,0}, {0,255,0}, ""}, -- Coke Farming
    {{2685.17,3515.49,53.30,0}, {1120.95,-3152.47,-37.06,0}, {0,255,0}, ""}, -- Coke Treatment & Selling	

    {{2813.36,1469.59,24.74,0}, {997.7,-3157.98,-38.91,0}, {0,255,0}, ""}, -- Heroin Treatment & Selling  
   
    {{839.37,2176.16,52.29,0}, {1065.71,-3183.25,-39.16,0}, {0,255,0}, ""}, -- All Weed Locations

    {{136.07, -761.8, 242.1, 0},     {138.4, -762.4, 45.7, 0}, {125,125,125}, ""}, -- Bitcoin teleports
    {{1118.51, -3193.37, -40.39, 0}, {161.12, -1485.71, 27.9, 0}, {252,186,3}, ""}, -- Money wash teleport        

    {{-391.28, 4367.55, 56.8, 0}, {904.09,-3200.28,-98.0,0}, {125,125,125}, ""}, -- Black market	

    {{-794.21, 351.6, 86.5, 0}, {1173.74,-3196.75,-39.01,0}, {160,240,125}, ""},

 }

-----------------------------------------------------------------------------
-------------------------DO NOT EDIT BELOW THIS LINE-------------------------
-----------------------------------------------------------------------------

local player = GetPlayerPed(-1)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)

        for _,location in ipairs(positions) do
            teleport_text = location[4]
            loc1 = {
                x=location[1][1],
                y=location[1][2],
                z=location[1][3],
                heading=location[1][4]
            }
            loc2 = {
                x=location[2][1],
                y=location[2][2],
                z=location[2][3],
                heading=location[2][4]
            }
            Red = location[3][1]
            Green = location[3][2]
            Blue = location[3][3]

            DrawMarker(1, loc1.x, loc1.y, loc1.z, 0, 0, 0, 0, 0, 0, 1.501, 1.3001, 0.7501, Red, Green, Blue, 100, 0, 0, 0, 0)
            DrawMarker(1, loc2.x, loc2.y, loc2.z, 0, 0, 0, 0, 0, 0, 1.501, 1.3001, 0.7501, Red, Green, Blue, 100, 0, 0, 0, 0)

            if CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, loc1.x, loc1.y, loc1.z, 2) then 
                alert(teleport_text)
                
                if IsControlJustReleased(1, key_to_teleport) then
                    if IsPedInAnyVehicle(player, true) then
                        SetEntityCoords(GetVehiclePedIsUsing(player), loc2.x, loc2.y, loc2.z)
                        SetEntityHeading(GetVehiclePedIsUsing(player), loc2.heading)
                    else
                        SetEntityCoords(player, loc2.x, loc2.y, loc2.z)
                        SetEntityHeading(player, loc2.heading)
                    end
                end

            elseif CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, loc2.x, loc2.y, loc2.z, 2) then
                alert(teleport_text)

                if IsControlJustReleased(1, key_to_teleport) then
                    if IsPedInAnyVehicle(player, true) then
                        SetEntityCoords(GetVehiclePedIsUsing(player), loc1.x, loc1.y, loc1.z)
                        SetEntityHeading(GetVehiclePedIsUsing(player), loc1.heading)
                    else
                        SetEntityCoords(player, loc1.x, loc1.y, loc1.z)
                        SetEntityHeading(player, loc1.heading)
                    end
                end
            end            
        end
    end
end)

function CheckPos(x, y, z, cx, cy, cz, radius)
    local t1 = x - cx
    local t12 = t1^2

    local t2 = y-cy
    local t21 = t2^2

    local t3 = z - cz
    local t31 = t3^2

    return (t12 + t21 + t31) <= radius^2
end

function alert(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end
