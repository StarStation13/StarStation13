/*
 * Clay
 */

/obj/item/stack/sheet/mineral/clay
	name = "clay brick"
	desc = "A lump of clay. Don't get handsy without a sink!"
	singular_name = "clay brick"
	icon_state = "sheet-meat"
	inhand_icon_state = "sheet-plasteel"
	throw_speed = 3
	throw_range = 5
	mats_per_unit = list(/datum/material/clay=MINERAL_MATERIAL_AMOUNT)
	merge_type = /obj/item/stack/sheet/mineral/clay
	material_type = /datum/material/clay

/obj/item/stack/sheet/mineral/clay/thirty
	amount = 30

/obj/item/stack/sheet/mineral/clay/Initialize()
	. = ..()
	AddComponent(/datum/component/bakeable, /obj/item/stack/sheet/mineral/brick, rand(25 SECONDS, 40 SECONDS), FALSE)

/*
 * Bricks
 */

/obj/item/stack/sheet/mineral/brick
	name = "fired clay bricks"
	desc = "Some fired clay bricks, good structural support."
	singular_name = "fired clay brick"
	icon = 'modular_star/modules/mapping/icons/obj/stack_objects.dmi'
	icon_state = "sheet-brick"
	throw_speed = 3
	throw_range = 5
	mats_per_unit = list(/datum/material/clay=MINERAL_MATERIAL_AMOUNT)
	merge_type = /obj/item/stack/sheet/mineral/brick
	walltype = /turf/closed/wall/mineral/brick
	material_type = /datum/material/clay

/obj/item/stack/sheet/mineral/brick/thirty
	amount = 30
