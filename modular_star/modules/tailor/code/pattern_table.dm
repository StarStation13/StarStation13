/obj/item/pattern_kit
	name = "uninitialized pattern kit"
	desc = "Yell at a coder!"
	icon = 'modular_star/modules/tailor/icons/tailor.dmi'
	icon_state = "pattern_kit"
	var/obj/item/item_to_make

/obj/machinery/pattern_table
	name = "pattern table"
	desc = "A piece of machinery that rapidly breaks down clothing into base designs for replication inside an Auto-Tailor. A tag claims; In cases of electromagnetic interference, contact security!"
	icon = 'modular_star/modules/tailor/icons/tailor.dmi'
	icon_state = "pattern_table"
	use_power = IDLE_POWER_USE
	idle_power_usage = 2
	active_power_usage = 500
	circuit = /obj/item/circuitboard/machine/pattern_table
	density = TRUE
	var/emagged = FALSE

/obj/machinery/pattern_table/attackby(obj/item/weapon, mob/user, params)
	if(default_deconstruction_screwdriver(user, icon_state, icon_state, weapon))
		return
	if(default_deconstruction_crowbar(weapon))
		return
	if(istype(weapon, /obj/item/clothing) || emagged == TRUE)
		var/obj/item/pattern_kit/pattern = new(get_turf(src))
		pattern.name = "[weapon] pattern kit"
		pattern.desc = "A ready-to-go set of instructions for an Auto-Tailor to reconstruct a copy of [weapon]."
		pattern.item_to_make = weapon.type
		if(emagged == TRUE)
			pattern.desc += " This particular kit has been flagged as created in illegitimate circumstances."
		qdel(weapon)
	. = ..()

/obj/machinery/pattern_table/emag_act(mob/user)
	if(emagged == TRUE)
		to_chat(user, span_warning("[src] has no functional matter locks to emag."))
		return
	to_chat(user, span_notice("You short out [src]'s matter locks, frying the monitor in the process!"))
	emagged = TRUE

/obj/machinery/pattern_table/examine(mob/user)
	. = ..()
	if(emagged == TRUE)
		. += span_notice("The pattern table's spitting out errors, but it's still functional...")
