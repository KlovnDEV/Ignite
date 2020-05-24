var config = {
  'title': 'Ignite Roleplay - Development Server',
  'welcomeMessage': 'Latest Updates',

  // Add images for the loading screen background.
  images: [
  'https://fivem.net/17c4e5d0b35262c228dcf66c98365982.jpg',
  ],
  // Turn on/off music
  enableMusic: true,
  // Music list. (Youtube video IDs). Last one should not have a comma at the end.
  music: [
    't-yCg-0-baE', '2l5qA8w9ack', 'pln7NWRA1dE'
  ],
  // Change music volume 0-100.
  musicVolume: 1.5,
  // Change Discord settings and link.
  'discord': {
    'show': true,
    'discordLink': 'https://discord.gg/EFyMWwu',
  },
  // Change which key you have set in guidehud/client/client.lua
  'menuHotkey': 'F3',
  // Turn on/off rule tabs. true/false
  'rules': {
    'generalconduct': true,
    'roleplaying': true,
    'rdmvdm': true,
    'metagaming': true,
    'newlife': true,
    'abuse': true,
  },
}

// Home page annountments.
var announcements = [
  'Character Creation Updated'
]


// Add/Modify rules below.
var guidelines = [
  'Breaking any of these rules may result in administrative action.',
  'Not knowing the rules does not make players exempt from them.',
  'If another player breaks rules it does not give you the right to break a rule yourself.',
  'Trying to skirt an obvious rule may result in a ban.',
  'Staff reserves the right to ban players they feel are being toxic, disruptive or not playing by the spirit of the game mode.',
  'Not all rules can be listed so use common sense when playing.',
  'Minor rules may be superseded by excellent role-play as determined by Staff.',
]

var generalconduct = [
  'Racism, bigotry, anti-antisemitism, and any other form of harassment is not tolerated.',
  'Players can not role-play sexual assault, rape, or anything that can be deemed as intense and inappropriate behavior.',
]

var roleplaying = [
  'Players must role-play every situation.',
  '- Example: "I ran the stoplight because of server lag" or similar situations is not allowed.',
  '- Exception:  Players may only go Out Of Character when a staff member asks you to explain a situation and/or authorizes you to go OOC.',
  'Players must value their lives.',
  '- Example:  If a player has a gun to their head they must act accordingly.',
  'Players can not rule quote.',
  'Players must role-play medical injuries correctly at all times.',
  'Players can not do something intentionally in front of police that wouldn\'t ordinarily be done. This is known as "Cop Baiting".',
  'Players can not steal unattended police/medic vehicles parked at police stations or hospitals.',
  'Players can not enter an apartment to avoid consequences or role-play.',
  'Players can not intentionally respawn, log out, or find another way to avoid or skirt potential role-play.',
]

var rdmvdm = [
  'Players can not kill or attack other players without role-play.',
  'Players must have a reason or a benefit to their character when trying to kill or attack another player.',
  '- Example:  Yelling "hands up or die" without a reason is not valid role-play.',
  'Players may use vehicles as weapons as long as its within role-play and logical.',
  'Players can not intentionally use aerial vehicles to collide into other players or vehicles.',
]

var metagaming = [
  'Players can not use information gathered outside of role-play to influence their actions within the game.',
  'Players may remove another players communication devices in an role-play manner.',
  'Players with removed communication devices are expected to mute their third-party communication software.',
  'Players may only remove another players communication device when it is logical within role-play.',
  'Players can not use information gathered from outside the server (such as forums) while in-game.',
  'Knowledge and experiences should be learned and discovered by a players current character in-game.',
  'Players can not force another player into a situation that they cannot role-play out of. This is known as "Power-Gaming".',
  'Players must use common sense when encountering power-gaming potential situations.'
]

var newlife = [
  'Players that are downed but then stabilized should continue role-play accordingly.',
  'Players that are killed ("respawn" is prompted) must "forget" their previous situation in which they have died.',
  'Players that are killed may still proceed with their current character. (players may DOA their character and start a new character story).',
]

var abuse = [
  'Players can not abuse or exploit bugs.',
  'Players can not hack or script. (using third-party software, injectors, etc).',
  'Players who report an exploit using the proper procedures will be rewarded ingame.',
]

var beginnersGuide = [
	'Firstly.. After creating your character you are going to want to get your driving licence... Head to the Driving School (Located on the map)',
	'Once you have got your licence, head over to the car dealership and get yourself a ride! (Cars can be stored in garages that are located on the map)',
	'For a source of income, get yourself over to the Job Center and get yourself a job so you can earn that sweet paper!',
	'',
	'There are a number of "illegal" jobs on the server that can provide you with "dirty" money. (This will need to be washed at a laundering location, You will have to find that though)',
	'All drugs can be sold to NPCs or sold at their designated selling spot (This is also hidden so get out there and find all 3 spots)',
	'Cryptocurrency mining has shown to be very profitable so if you manage to find the mining and selling spot, damn... Financial stability coming your way!',
	'',
	'Please make sure to check out the rules and keybinds tab!, Any issues then message one of the administrators or do the /calladmin command.',
	'',
	'Thank you for playing!. We wish you the best of luck out there and hope you have a premium roleplay experience',
	'- Liam & Midnight (Lead Developers)'
]

// Modify hotkeys below.
var generalhotkeys = [
  '<kbd>F1</kbd> - Mobile Phone',
  '<kbd>F2</kbd> - Inventory',
  '<kbd>F3</kbd> - Help Menu (This menu)',
  '<kbd>F8</kbd> - FiveM Debug Console',
  '<kbd>F10</kbd> - Server Player List',
  '<kbd>SHIFT</kbd> + <kbd>H</kbd> - Switch Voice Distance.'
]

var rphotkeys = [
  '<kbd>CTRL</kbd> - Crouch',
  '<kbd>Z</kbd> - Prone',
  '<kbd>X</kbd> - Hands Up',
  '<kbd>G</kbd> - Rob Player (Must be aiming at them with their hands up!)',
  '<kbd>B</kbd> - Point finger',
  '<kbd>F6</kbd> - Job Menu (Police, Mechanic, EMS, Gangs)',
  '<kbd>F7</kbd> - Invoices',
  '<kbd>F9</kbd> - Accessories Menu (Bags, Masks)'
]

var vehiclehotkeys = [
  '<kbd>CAPS</kbd> - Speed Limiter',
  '<kbd>U</kbd> - Lock / Unlock Vehocle',
  '<kbd>G</kbd> - Seatbelt',
  '<kbd>F</kbd> - Enter / Exit Vehicle',
  '<kbd>Q</kbd> - Toggle Emergency Lights. (Ambulance & Police)',
  '<kbd>1</kbd>,<kbd>2</kbd>,<kbd>3</kbd> - Sirens (EMS & Police)',
  '<code>/engine</code> - Start / Stop Engine'
]


// these are going to be chat commands
var jobshotkeys = [
  'Out of Character Chat - <code>/ooc [message]</code>',
  'Twitter Chat - <code>/twitter [message]</code>',
  'Server Advertisement - <code>/ad [message]</code> (Costs $50)',
  'Darknet Advertisement - <code>/darkad [message]</code> (Costs $1500 Dirty Money)',
  'Report an Incident - <code>/report [message]</code>',
  'Call an Admin - <code>/calladmin [reason]</code>',
  'Toggle Engine - <code>/engine</code>',
  'Anonymous Chat - <code>/anon [message]</code>',
  'Local Chat - <code>/me [message]</code>',
  'View Quick Emotes - <code>/es</code>',
  'Quick Emote - <code>/e [emote name]</code>'
]
