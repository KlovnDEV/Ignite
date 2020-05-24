
	local blips = {
	
	 	{title="The Blue Hole", colour=27, id=93, x=-161.66960144043, y=-1350.2828369141, z=34.691207885742},
		{title="Sheriff's Department", colour=29, id=60, x=1848.5920410156, y=3683.6262207031, z=38.574863433838},
    {title="Sheriff's Department", colour=29, id=60, x=-446.31024169922, y=6013.2573242188, z=31.716394424438},
    {title="Yellow Jack Inn", colour=46, id=93, x=1987.52, y=3050.26, z=47.22},
    {title="The Pink Cage Motels", colour=8, id=475, x=321.46, y=-220.67, z=54.09},
    {title="Tequi-la-la", colour=27, id=93, x=-559.54, y=285.27, z=82.18},
		

		}

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)
