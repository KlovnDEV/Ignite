------- CHANGE THESE SETTINGS TO FIT YOUR NEEDS -------

-- Recommended total number of lines is ~13
local helpMessage = {
    '/k - Phone',
    '/b - Seatbelt',
    'F6/F7 - Action Menus',
	'F2 - Inventory',
	'Caps lock - Cruise Control',
	'/engine or F6 - Toggles engine',
}
-- Recommended total number of lines is ~13
local rulesMessage = {
    'No RDM (Killing someone without reason)',
    'No VDM (Running someone down with your vehicle for no reason)',
    'No MetaGaming',
	'No PowerGaming',
	'Always listen to admins',
	'/report if you see anyone breaking server rules',
	'Keep it clean and have fun :)',
}

-- Prefixes will be displayed before each line,
local helpPrefix = '^1'
local helpSuffix = '^1.'
local rulesPrefix = '^3'
local rulesSuffix = '^3.'

-- Customize your /help and /rules command, if you wish.
local helpCommand = 'help' -- don't add a "/" here!
local rulesCommand = 'rules' -- don't add a "/" here!
-------------------------------------------------------


















------- CODE, DON'T TOUCH THIS!!! -------
RegisterCommand(helpCommand, function()
    for i in pairs(helpMessage) do
        TriggerEvent('chatMessage', '', {255, 255, 255}, helpPrefix .. helpMessage[i] .. helpSuffix)
    end
end, false)

RegisterCommand(rulesCommand, function()
    for i in pairs(rulesMessage) do
        TriggerEvent('chatMessage', '', {255, 255, 255}, rulesPrefix .. rulesMessage[i] .. rulesSuffix)
    end
end, false)
TriggerEvent('chat:addSuggestion', '/' .. helpCommand, 'Displays a help message.')
TriggerEvent('chat:addSuggestion', '/' .. rulesCommand, 'Displays the server rules.')