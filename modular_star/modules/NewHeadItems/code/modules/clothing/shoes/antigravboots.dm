/obj/item/clothing/shoes/antigrav_boots
	icon = 'modular_star/modules/NewHeadItems/icons/obj/clothing/shoes.dmi'
	worn_icon = 'modular_star/modules/NewHeadItems/icons/mob/clothing/feet.dmi'
	desc = "The Quartermasters's 'special' boots. Control Click to toggle anti-gravity functions."
	name = "anti-gravity boots"
	icon_state = "antigrav"

	var/enabled_antigravity = FALSE

	examinepp_req_jobs = list(JOB_QUARTERMASTER)
	examinepp_desc_job = "These are unwieldy, but will allow someone to effective ignore leg injury and pull freight at high speeds when paired with a jetpack."

/obj/item/clothing/shoes/antigrav_boots/equipped(mob/user, slot)
	. = ..()
	if(!slot == ITEM_SLOT_FEET)
		return
	if(enabled_antigravity)
		user.AddElement(/datum/element/forced_gravity, 0)

/obj/item/clothing/shoes/antigrav_boots/dropped(mob/user)
	. = ..()
	user.RemoveElement(/datum/element/forced_gravity, 0)

/obj/item/clothing/shoes/antigrav_boots/CtrlClick(mob/living/user)
	if(!isliving(user))
		return
	if(user.get_active_held_item() != src)
		to_chat(user, "<span class='warning'>You must hold the [src] in your hand to do this!</span>")
		return
	if (enabled_antigravity)
		to_chat(user, "<span class='notice'>You switch off the antigravity!</span>")
		enabled_antigravity = FALSE
	else
		to_chat(user, "<span class='notice'>You switch on the antigravity!</span>")
		enabled_antigravity = TRUE
