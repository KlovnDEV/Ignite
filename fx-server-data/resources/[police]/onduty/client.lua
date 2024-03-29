local policeloadout = {
	{['i'] = 1, ['weapon'] = "WEAPON_TEARGAS"},
	{['i'] = 2, ['weapon'] = "WEAPON_COMBATPISTOL"},
	{['i'] = 3, ['weapon'] = "WEAPON_STUNGUN"},
	{['i'] = 4, ['weapon'] = "WEAPON_PUMPSHOTGUN"},
	{['i'] = 5, ['weapon'] = "WEAPON_CARBINERIFLE"},
	{['i'] = 6, ['weapon'] = "WEAPON_NIGHTSTICK"},
	{['i'] = 6, ['weapon'] = "WEAPON_FLASHLIGHT"},
}

RegisterNetEvent("yt:policeLoadout")
AddEventHandler("yt:policeLoadout", function()
 RemoveAllPedWeapons(GetPlayerPed(-1))
 local model = GetHashKey("s_m_y_cop_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
    SetPlayerModel(PlayerId(), model)
    SetModelAsNoLongerNeeded(model)
    chatPrint( "Loadout Given." )

local playerPed = GetPlayerPed(-1)
	for k,v in ipairs(policeloadout) do
		Citizen.Trace("Weapon: "..v.i.." "..v.weapon.." Given to ".. playerPed)
	    GiveWeaponToPed(playerPed, GetHashKey(v.weapon), 9999, true, true)
     	
	end
end)


function chatPrint( msg )
	TriggerEvent( 'chatMessage', "SYSTEM", { 0, 0, 0 }, msg )
end 

