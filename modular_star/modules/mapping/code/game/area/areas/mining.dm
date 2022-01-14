/area/lush_planet
	name = "The Outdoors"
	always_unpowered = TRUE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	requires_power = TRUE
	ambience_index = AMBIENCE_MINING
	area_flags = VALID_TERRITORY | UNIQUE_AREA | FLORA_ALLOWED | NO_ALERTS
	min_ambience_cooldown = 70 SECONDS
	max_ambience_cooldown = 220 SECONDS
	icon_state = "mining"
	has_gravity = STANDARD_GRAVITY
	flags_1 = NONE
	sound_environment = SOUND_AREA_LUSHPLANET
	outdoors = TRUE

/area/lush_planet/unexplored
	icon_state = "unexplored"
	area_flags = VALID_TERRITORY | UNIQUE_AREA | CAVES_ALLOWED | FLORA_ALLOWED | MOB_SPAWN_ALLOWED | NO_ALERTS
	map_generator = /datum/map_generator/jungle_generator

/area/lush_planet/unexplored/danger //Megafauna can spawn out here
	area_flags = VALID_TERRITORY | UNIQUE_AREA | CAVES_ALLOWED | FLORA_ALLOWED | MOB_SPAWN_ALLOWED | MEGAFAUNA_SPAWN_ALLOWED | NO_ALERTS

/area/lush_planet/underground
	name = "The Underground"
	sound_environment = SOUND_AREA_ASTEROID
	outdoors = FALSE
