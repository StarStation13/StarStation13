/// THE HANDS THEMSELVES ///
/obj/item/borg/apparatus/hands
	name = "item and utility functionality apparatus"
	desc = "An expensive piece of equipment, this is quite literally a full-on arm, hand included."
	storable = list(/obj/item) //And god wept, for the silicon main learned how to code

/obj/item/borg/apparatus/hands/examine()
	. = ..()
	. += "The hand currently holds:"
	if(stored)
		. += stored.name

/obj/item/borg/apparatus/hands/update_overlays()
	. = ..()
	if(stored)
		COMPILE_OVERLAYS(stored)
		stored.pixel_x = 0
		stored.pixel_y = 0
		var/mutable_appearance/stored_copy = new /mutable_appearance(stored)
		stored_copy.layer = FLOAT_LAYER
		stored_copy.plane = FLOAT_PLANE
		. += stored_copy

/obj/item/borg/apparatus/hands/Destroy()
	if(stored)
		stored.forceMove(get_turf(usr)) //Prevents deleting important items like disky
	. = ..()

/obj/item/borg/apparatus/hands/pre_attack(atom/A, mob/living/user, params)
	. = ..()
	if(istype(A, /obj/item/ai_module) && !stored)
		to_chat(user, span_warning("You're designed to enforce your own laws, not remove them."))

/// OUR BORGO ///

/obj/item/robot_model/hands
	name = "Military Grade Cyborg-Spec Drone"
	basic_modules = list(
		/obj/item/borg/apparatus/hands,
		/obj/item/borg/apparatus/hands,
		/obj/item/borg/apparatus/hands)
	emag_modules = list(
		/obj/item/melee/energy/sword/cyborg)
	model_select_icon = "standard"

/mob/living/silicon/robot/model/hands
	set_model = /obj/item/robot_model/hands

/mob/living/silicon/robot/model/hands/shell
	shell = TRUE

/// SPAWNING THE POOR BASTARD IN ///

/datum/job/ai/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	if(length(GLOB.alive_player_list) < 20)
		var/mob/living/silicon/robot/model/hands/shell/new_shell = new(spawned.loc)
		new_shell.set_connected_ai(spawned)
		new_shell.notify_ai(AI_NOTIFICATION_AI_SHELL)
