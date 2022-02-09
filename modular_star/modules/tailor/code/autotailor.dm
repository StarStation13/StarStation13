/obj/machinery/autotailor
	name = "auto-tailor"
	desc = "Reads back pattern kits and reproduces their contained designs from cloth-based biomatter - for a price. Not compatible with durathread."
	icon = 'modular_star/modules/tailor/icons/tailor.dmi'
	icon_state = "autotailor"
	use_power = IDLE_POWER_USE
	idle_power_usage = 2
	active_power_usage = 500
	circuit = /obj/item/circuitboard/machine/autotailor
	density = TRUE
	var/obj/item/stack/sheet/cloth/cloth_to_use
	var/obj/item/pattern_kit/pattern_kit_to_use
	var/operating = FALSE
	var/sewing_speed = 8 SECONDS
	var/use_amount=25

/obj/machinery/autotailor/RefreshParts()
	for(var/obj/item/stock_parts/manipulator/new_manipulator in component_parts)
		use_amount -= new_manipulator.rating*4

/obj/machinery/autotailor/attackby(obj/item/weapon, mob/user, params)
	if(default_deconstruction_screwdriver(user, icon_state, icon_state, weapon))
		return
	if(default_deconstruction_crowbar(weapon))
		return
	if(istype(weapon, /obj/item/stack/sheet/cloth) && !cloth_to_use)
		user.balloon_alert(user, "inserted [weapon]")
		cloth_to_use = weapon
		weapon.forceMove(src)
	if(istype(weapon, /obj/item/pattern_kit) && !pattern_kit_to_use)
		user.balloon_alert(user, "inserted [weapon]")
		pattern_kit_to_use = weapon
		weapon.forceMove(src)
	. = ..()

/obj/machinery/autotailor/attack_hand(mob/living/user, list/modifiers)
	. = ..()
	if(!cloth_to_use || !pattern_kit_to_use)
		to_chat(user, "There's no cloth or no pattern kit inserted!")
		return
	if(operating)
		return
	operating = TRUE
	playsound(src, 'modular_star/modules/tailor/sound/sewing_machine.ogg', 100)
	user.balloon_alert(user, "begun sewing")
	if(do_after(user, sewing_speed, src))
		new pattern_kit_to_use.item_to_make(get_turf(src))
		cloth_to_use.use(use_amount)
		if(QDELETED(cloth_to_use))
			user.balloon_alert(user, "out of cloth")
			cloth_to_use = null
		else
			user.balloon_alert(user, "[cloth_to_use.amount] cloth left")
		pattern_kit_to_use.forceMove(get_turf(src))
		pattern_kit_to_use = null
	operating = FALSE
