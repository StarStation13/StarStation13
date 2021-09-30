/obj/structure/falsewall/brick
	name = "brick wall"
	desc = "A wall made entirely of brick."
	icon = 'icons/turf/walls/iron_wall.dmi'
	icon_state = "iron_wall-0"
	base_icon_state = "iron_wall"
	color = "#ff0000"
	mineral = /obj/item/stack/sheet/mineral/brick
	walltype = /turf/closed/wall/mineral/brick
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_CLOSED_TURFS, SMOOTH_GROUP_WALLS) //For sake of modularity, no new smooth group
	canSmoothWith = list(SMOOTH_GROUP_WALLS)
