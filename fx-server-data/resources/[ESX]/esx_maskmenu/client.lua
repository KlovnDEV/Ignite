ESX                     = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

-- Put on Clothes
RegisterNetEvent('smerfikubrania:koszulka')
AddEventHandler('smerfikubrania:koszulka', function()
	TriggerEvent('skinchanger:getSkin', function(skin)
	
		-- empty skin to restore previous skin without any changes
		local clothesSkin = {}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	end)
end)
RegisterNetEvent('smerfikubrania:spodnie')
AddEventHandler('smerfikubrania:spodnie', function()
	TriggerEvent('skinchanger:getSkin', function(skin)
	

		local clothesSkin = {
		['pants_1'] = 21, ['pants_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	end)
end)

RegisterNetEvent('smerfikubrania:buty')
AddEventHandler('smerfikubrania:buty', function()
	TriggerEvent('skinchanger:getSkin', function(skin)
	

		local clothesSkin = {
		['shoes_1'] = 34, ['shoes_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	end)
end)

-- Bags on
RegisterNetEvent('smerfikubrania:bagOn')
AddEventHandler('smerfikubrania:bagOn', function()
	TriggerEvent('skinchanger:getSkin', function(skin)
		local bagSkin = {
		['bags_1'] = 44, ['bags_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, bagSkin)
	end)
end)

-- Bags off
RegisterNetEvent('smerfikubrania:bagOff')
AddEventHandler('smerfikubrania:bagOff', function()
	TriggerEvent('skinchanger:getSkin', function(skin)
		local bagSkin = {
		['bags_1'] = 0, ['bags_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, bagSkin)
	end)
end)

-- Mask on
RegisterNetEvent('smerfikubrania:maskOn')
AddEventHandler('smerfikubrania:maskOn', function()
	TriggerEvent('skinchanger:getSkin', function(skin)
		local maskSkin = {
		['mask_1'] = 51, ['mask_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, maskSkin)
	end)
end)

-- Mask off
RegisterNetEvent('smerfikubrania:maskOff')
AddEventHandler('smerfikubrania:maskOff', function()
	TriggerEvent('skinchanger:getSkin', function(skin)
		local maskSkin = {
		['mask_1'] = 0, ['mask_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, maskSkin)
	end)
end)

function OpenActionMenuInteraction(target)

	local elements = {}

	-- Default elements
	table.insert(elements, {label = ('Restore Skin'), value = 'ubie'})
	table.insert(elements, {label = ('Remove Shirt'), value = 'tul'})
	table.insert(elements, {label = ('Remove Pants'), value = 'spo'})
	table.insert(elements, {label = ('Remove Shoes'), value = 'but'})
	
	-- Wear and remove bag
	table.insert(elements, {label = ('Wear Bag'), value = 'bagOn'})
	table.insert(elements, {label = ('Remove Bag'), value = 'bagOff'})

	-- Wear and remove mask
	table.insert(elements, {label = ('Wear Mask'), value = 'maskOn'})
	table.insert(elements, {label = ('Remove Mask'), value = 'maskOff'})

	-- Close Button
	table.insert(elements, {label = ('Close Menu'), value = 'closemenu'})

  	ESX.UI.Menu.CloseAll()	


	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'action_menu',
		{
			title    = ('Accessories Menu'),
			align    = 'top-left',
			elements = elements
		},
	function(data, menu)
		-- Return player back to saved skin
		if data.current.value == 'ubie' then			
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:loadSkin', skin)
		end)
		ESX.UI.Menu.CloseAll()

		-- Remove shirt from player
		elseif data.current.value == 'tul' then
		TriggerEvent('smerfikubrania:koszulka')
		ESX.UI.Menu.CloseAll()	
		-- Remove pants from player
		elseif data.current.value == 'spo' then
		TriggerEvent('smerfikubrania:spodnie')
		ESX.UI.Menu.CloseAll()
		-- Remove shoes from Player
		elseif data.current.value == 'but' then
		TriggerEvent('smerfikubrania:buty')
		ESX.UI.Menu.CloseAll()
		-- Wear bag 
		elseif data.current.value == 'bagOn' then
		TriggerEvent('smerfikubrania:bagOn')
		ESX.UI.Menu.CloseAll()
		-- Remove bag
		elseif data.current.value == 'bagOff' then
		TriggerEvent('smerfikubrania:bagOff')
		ESX.UI.Menu.CloseAll()
		-- wear mask
		elseif data.current.value == 'maskOn' then
		TriggerEvent('smerfikubrania:maskOn')
		ESX.UI.Menu.CloseAll()
		-- remove mask
		elseif data.current.value == 'maskOff' then
		TriggerEvent('smerfikubrania:maskOff')
		ESX.UI.Menu.CloseAll()
		-- close menu
		elseif data.current.value == 'closemenu' then
		ESX.UI.Menu.CloseAll()
	  end
	end)


end
			
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if IsControlJustReleased(0, 56) and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'action_menu') then
		OpenActionMenuInteraction()
    end
  end
end)
