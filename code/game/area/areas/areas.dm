/area/space
	name = "Space"

/**
 * Update the icon of the area (overridden to always be null for space
 */
/area/space/update_icon_state()
	SHOULD_CALL_PARENT(FALSE)
	icon_state = null

/area/unassigned
	name = "unassigned area"

/area/start
	name = "start area"
	icon_state = "start"
	requires_power = FALSE
	dynamic_lighting = DYNAMIC_LIGHTING_DISABLED
	has_gravity = STANDARD_GRAVITY

/area/testroom
	requires_power = FALSE
	has_gravity = STANDARD_GRAVITY
	name = "Test Room"
	icon_state = "purple"

/area/outdoors
	icon_state = "green"
	flags_1 = NONE
	area_flags = VALID_TERRITORY | UNIQUE_AREA | CAVES_ALLOWED | FLORA_ALLOWED | MOB_SPAWN_ALLOWED | MEGAFAUNA_SPAWN_ALLOWED | NO_ALERTS
	main_ambience = AMBIENCE_JUNGLE
	outdoors = TRUE

/area/outdoors/jungle
	name = "Jungle"
	icon_state = "green"

/area/outdoors/coast
	name = "Coast"
	icon_state = "yellow"

/area/outdoors/caves
	name = "Caves"
	icon_state = "cave"
	underground = TRUE

/area/indoors
	icon_state = "purple"
	flags_1 = NONE
	area_flags = VALID_TERRITORY | UNIQUE_AREA | CAVES_ALLOWED | FLORA_ALLOWED | MOB_SPAWN_ALLOWED | MEGAFAUNA_SPAWN_ALLOWED | NO_ALERTS
	main_ambience = AMBIENCE_AWAY
	outdoors = FALSE

/area/indoors/house
	name = "House"


/area/stalker/buildings/backwater
	name = "Strange Location"
	icon_state = "green"

/area/stalker/buildings/backwater/substation
	name = "Backwater - Substation Workshops"
	icon_state = "cave"

/area/stalker/blowout/buildings/backwater/substation
	name = "Backwater - Substation Workshops"
	icon_state = "cave"

/area/stalker/blowout/outdoor/backwater/substation
	name = "Backwater - Substation Workshops"
	icon_state = "cave"

/area/stalker/buildings/backwater/skadovsk
	name = "Backwater - Skadovsk"
	icon_state = "yellow"

/area/stalker/buildings/backwater/skadovsk_respawn
	name = "Backwater - Skadovsk (2nd floor)"
	icon_state = "skadovsk"
	icon_state = "purple"

// Blowout

/area/stalker/blowout
	main_ambience = AMBIENCE_JUNGLE

/area/stalker/blowout
	name = "Blowout Strange Location"
	icon_state = "yellow"

/area/stalker/blowout/outdoor
	name = "Outdoor"
	icon = 'stalker/icons/areas_outdoor_blowout.dmi'
	icon_state = "outdoor"

/area/stalker/blowout/buildings
	name = "Buildings"
	icon = 'stalker/icons/areas_buildings_blowout.dmi'
	icon_state = "buildings"

/area/stalker/blowout/buildings/backwater
	name = "Backwater - Buildings"
	icon_state = "buildings"

/area/stalker/blowout/outdoor/backwater
	name = "Backwater - Outdoor \[O\]"
	icon_state = "outdoor"
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Basic

/area/stalker
	icon = 'stalker/icons/areas.dmi'
	name = "Strange Location"
	icon_state = "away"

/area/stalker/buildings
	name = "Buildings"
	icon = 'stalker/icons/areas_buildings.dmi'
	icon_state = "buildings"

/area/stalker/sidor
	name = "Sidorovich Basement"
	icon = 'stalker/icons/areas_buildings.dmi'
	icon_state = "sidor"

/area/stalker/adminspace
	name = "Admin Space"
	icon = 'stalker/icons/areas_buildings.dmi'
	icon_state = "admin_space"

///////////////////////?????////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Backwater

/area/stalker/blowout/outdoor/backwater
	name = "Backwater - Outdoor \[O\]"
	icon_state = "outdoor"

/area/stalker/buildings/backwater
	name = "Backwater - Buildings \[NB\]"
	icon_state = "buildings"

/area/stalker/blowout/buildings/backwater
	name = "Backwater - Buildings"
	icon_state = "buildings"

// Substation

/area/stalker/blowout/outdoor/backwater/substation
	name = "Backwater - Substation Workshops \[O\]"
	icon_state = "substation"

/area/stalker/buildings/backwater/substation
	name = "Backwater - Substation Workshops \[NB\]"
	icon_state = "substation"

/area/stalker/blowout/buildings/backwater/substation
	name = "Backwater - Substation Workshops"
	icon_state = "substation"

// Skadovsk

/area/stalker/buildings/backwater/skadovsk
	name = "Backwater - Skadovsk \[NB\]"
	icon_state = "skadovsk"

/area/stalker/buildings/backwater/skadovsk_respawn
	name = "Backwater - Skadovsk (2nd floor) \[NB\]"
	icon_state = "skadovsk"

/area/stalker/blowout/buildings/backwater/skadovsk
	name = "Backwater - Skadovsk"
	icon_state = "skadovsk"

/area/stalker/blowout/outdoor/backwater/skadovsk
	name = "Backwater - Skadovsk \[O\]"
	icon_state = "skadovsk"

// Shevchenko


/area/stalker/buildings/backwater/shevchenko
	name = "Backwater - Shevchenko \[NB\]"
	icon_state = "shevchenko"

/area/stalker/blowout/buildings/backwater/shevchenko
	name = "Backwater - Shevchenko"
	icon_state = "shevchenko"

/area/stalker/blowout/outdoor/backwater/shevchenko
	name = "Backwater - Shevchenko \[O\]"
	icon_state = "shevchenko"

// Burnt Farmstead

/area/stalker/buildings/backwater/burntfarm
	name = "Backwater - Burnt Farmstead \[NB\]"
	icon_state = "burntfarm"

/area/stalker/blowout/buildings/backwater/burntfarm
	name = "Backwater - Burnt Farmstead"
	icon_state = "burntfarm"

/area/stalker/blowout/outdoor/backwater/burntfarm
	name = "Backwater - Burnt Farmstead \[O\]"
	icon_state = "burntfarm"

// Iron Forest

/area/stalker/buildings/backwater/ironforest
	name = "Backwater - Iron Forest \[NB\]"
	icon_state = "ironforest"

/area/stalker/blowout/buildings/backwater/ironforest
	name = "Backwater - Iron Forest"
	icon_state = "ironforest"

/area/stalker/blowout/outdoor/backwater/ironforest
	name = "Backwater - Iron Forest \[O\]"
	icon_state = "ironforest"

// Krug

/area/stalker/buildings/backwater/krug
	name = "Backwater - Krug Antenna Complex \[NB\]"
	icon_state = "krug"

/area/stalker/blowout/buildings/backwater/krug
	name = "Backwater - Krug Antenna Complex"
	icon_state = "krug"

/area/stalker/blowout/outdoor/backwater/krug
	name = "Backwater - Krug Antenna Complex \[O\]"
	icon_state = "krug"

// Sawmill

/area/stalker/buildings/backwater/sawmill
	name = "Backwater - Sawmill \[NB\]"
	icon_state = "sawmill"

/area/stalker/blowout/buildings/backwater/sawmill
	name = "Backwater - Sawmill"
	icon_state = "sawmill"

/area/stalker/blowout/outdoor/backwater/sawmill
	name = "Backwater - Sawmill \[O\]"
	icon_state = "sawmill"

// Ranger Station

/area/stalker/buildings/backwater/ranger
	name = "Backwater - Ranger Station \[NB\]"
	icon_state = "ranger"

/area/stalker/blowout/buildings/backwater/ranger
	name = "Backwater - Ranger Station"
	icon_state = "ranger"

/area/stalker/blowout/outdoor/backwater/ranger
	name = "Backwater - Ranger Station \[O\]"
	icon_state = "ranger"

// Waste Processing Station

/area/stalker/buildings/backwater/waste
	name = "Backwater - Waster Processing Station \[NB\]"
	icon_state = "waste"

/area/stalker/blowout/buildings/backwater/waste
	name = "Backwater - Waster Processing Station"
	icon_state = "waste"

/area/stalker/blowout/outdoor/backwater/waste
	name = "Backwater - Waster Processing Station \[O\]"
	icon_state = "waste"
	environment

/area/stalker/buildings/backwater/waste
	name = "Backwater - Waster Processing Station \[NB\]"
	icon_state = "waste"

/area/stalker/blowout/buildings/backwater/waste
	name = "Backwater - Waster Processing Station"
	icon_state = "waste"

/area/stalker/blowout/outdoor/backwater/waste
	name = "Backwater - Waster Processing Station \[O\]"
	icon_state = "waste"

// Claw

/area/stalker/buildings/backwater/claw
	name = "Backwater - Claw \[NB\]"
	icon_state = "claw"

/area/stalker/blowout/buildings/backwater/claw
	name = "Backwater - Claw"
	icon_state = "claw"

/area/stalker/blowout/outdoor/backwater/claw
	name = "Backwater - Claw \[O\]"
	icon_state = "claw"

// Southern Plateau

/area/stalker/buildings/backwater/plateau
	name = "Backwater - Southern Plateau \[NB\]"
	icon_state = "plateau"

/area/stalker/blowout/buildings/backwater/plateau
	name = "Backwater - Southern Plateau"
	icon_state = "plateau"

/area/stalker/blowout/outdoor/backwater/plateau
	name = "Backwater - Southern Plateau \[O\]"
	icon_state = "plateau"

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Kordon

/area/stalker/kordon
	requires_power = 1

/area/stalker/kordon/buildings
	name = "Buildings"
	icon_state = "cellar"

/area/stalker/blowout/kordon/buildings
	name = "Buildings"
	icon_state = "buildings"

/area/stalker/kordon/cellar
	name = "Cellar"
	icon_state = "cellar"

/area/stalker/kordon/tunnel
	name = "Tunnel"
	icon_state = "tunnel_s"

/area/stalker/blowout/kordon/tunnel
	name = "Tunnel"
	icon_state = "tunnel"

/area/stalker/cave
	name = "Cave"
	icon_state = "tunnel"

// Svalka

/area/stalker/svalka
	requires_power = 1

/area/stalker/svalka/buildings
	name = "Buildings"
	icon_state = "buildings"

/area/stalker/blowout/svalka/buildings
	name = "Buildings"
	icon_state = "buildings"

/area/stalker/blowout/svalka/buildings/bar
	name = "Bar"
	icon_state = "buildings"

/area/stalker/svalka/cellar
	name = "Cellar"
	icon_state = "cellar"

/area/stalker/svalka/tunnel
	name = "Tunnel"
	icon_state = "tunnel_s"

/area/stalker/blowout/svalka/tunnel
	name = "Tunnel"
	icon_state = "tunnel"

// Agroprom

/area/stalker/agroprom
	requires_power = 1

/area/stalker/agroprom/buildings
	name = "Buildings_blowout"
	icon_state = "buildings"

/area/stalker/blowout/agroprom/buildings
	name = "Buildings"
	icon_state = "buildings_blowout"

/area/stalker/agroprom/cellar
	name = "Cellar"
	icon_state = "cellar"

/area/stalker/agroprom/tunnel
	name = "Tunnel"
	icon_state = "tunnel_s"

/area/stalker/blowout/agroprom/tunnel
	name = "Tunnel"
	icon_state = "tunnel"

/area/stalker/agroprom/caves
	name = "Caves"
	icon_state = "caves"
	requires_power = 1

// Byadt

/area/stalker/byadt
	requires_power = 1

/area/stalker/byadt/bar
	name = "Bar"
	icon_state = "realbar"

/area/stalker/byadt/buildings
	name = "Buildings"
	icon_state = "buildings_s"

/area/stalker/blowout/byadt/buildings
	name = "Buildings Blowout"
	icon_state = "buildings"

/area/stalker/byadt/buildings/mercenary
	name = "Mercenary"
	icon_state = "mercenary"

// Bar

/area/stalker/blowout/buildings/bar
	name = "Bar"
	icon_state = "buildings_s"

/area/stalker/blowout/outdoor/bar
	icon = 'stalker/icons/areas_outdoor_blowout.dmi'
	icon_state = "outdoor"

/area/stalker/buildings/bar/city
	name = "Buildings"
	icon_state = "buildings"

/area/stalker/buildings/bar/rentgen
	name = "Bar 100RENTGEN"
	icon = 'stalker/icons/areas.dmi'
	icon_state = "realbar"

/area/stalker/buildings/monolith
	name = "Monolith Safezone"
	icon = 'stalker/icons/areas.dmi'
	icon_state = "monolith"

/area/stalker/buildings/duty
	name = "Duty Safezone"
	icon = 'stalker/icons/areas.dmi'
	icon_state = "duty"

/area/stalker/buildings/freedom
	name = "Freedom Safezone"
	icon = 'stalker/icons/areas.dmi'
	icon_state = "freedom"

/area/stalker/buildings/clearsky
	name = "Clear Sky Safezone"
	icon = 'stalker/icons/areas.dmi'
	icon_state = "clearsky"

/area/stalker/buildings/bandit
	name = "Bandit Safezone"
	icon = 'stalker/icons/areas.dmi'
	icon_state = "bandit"

/area/stalker/buildings/military
	name = "Military Safezone"
	icon = 'stalker/icons/areas.dmi'
	icon_state = "military"

/area/stalker/buildings/renegade
	name = "Renegade Safezone"
	icon = 'stalker/icons/areas.dmi'
	icon_state = "renegades"

/area/stalker/buildings/mercenary
	name = "Mercenary Safezone"
	icon = 'stalker/icons/areas.dmi'
	icon_state = "mercenary"

/area/stalker/buildings/ecologist
	name = "ecologist safezone"
	icon = 'stalker/icons/areas.dmi'
	icon_state = "ecologist"

/area/stalker/buildings/ecologist_entrance
	name = "ecologist"
	icon = 'stalker/icons/areas.dmi'
	icon_state = "ecologist entrance"

// Misc

/area/stalker/blowout/buildings/kordon
	name = "Bar"
	icon_state = "buildings_s"

/area/stalker/blowout/outdoor/kordon
	icon = 'stalker/icons/areas_outdoor_blowout.dmi'
	icon_state = "outdoor"

/area/stalker/buildings/kordon/domik
	name = "Buildings"
	icon_state = "buildings"

/area/stalker/buildings/kordon/banditbar
	name = "Bandit Bar"
	icon = 'stalker/icons/areas.dmi'
	icon_state = "bandit_bar"

// Radar
/area/stalker/buildings/radar
	name = "Buildings"
	icon_state = "buildings"
