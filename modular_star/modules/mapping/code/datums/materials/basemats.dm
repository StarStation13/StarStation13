/datum/material/clay
	name = "clay"
	desc = "Basic clay - easily recyclable into more bricks. Or pottery."
	color = "#948a8a"
	greyscale_colors = "#948a8a"
	categories = list(MAT_CATEGORY_RIGID = TRUE, MAT_CATEGORY_ITEM_MATERIAL=TRUE)
	sheet_type = /obj/item/stack/sheet/mineral/sandstone
	value_per_unit = 0.0025
	armor_modifiers = list(MELEE = 0.5, BULLET = 0.5, LASER = 0.5, ENERGY = 0.1, BOMB = 0.5, BIO = 0.25, RAD = 0.1, FIRE = 0.1, ACID = 0.1)
	beauty_modifier = 0.1
	turf_sound_override = FOOTSTEP_SAND
	texture_layer_icon_state = "brick"
