/turf/closed/wall/mineral/brick
	name = "brick wall"
	desc = "A wall made entirely of brick."
	icon = 'icons/turf/walls/iron_wall.dmi'
	icon_state = "iron_wall-0"
	base_icon_state = "iron_wall"
	color = "#ff2b2b"
	sheet_type = /obj/item/stack/sheet/mineral/brick
	explosion_block = 7 //I'm not sure how to tell you this, but bricks are HARD
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_CLOSED_TURFS, SMOOTH_GROUP_WALLS) //For sake of modularity, no new smooth group
	canSmoothWith = list(SMOOTH_GROUP_WALLS)
	custom_materials = list(/datum/material/clay = 4000)
