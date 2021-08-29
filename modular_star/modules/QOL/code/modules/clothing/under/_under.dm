/obj/item/clothing/under/CtrlClick(mob/user)
	. = ..()
	if((!isobserver(usr)) && (has_sensor == HAS_SENSORS)) //Ghosts shouldn't be able to max someone's sensors for them.
		sensor_mode = SENSOR_COORDS
		to_chat(user,span_notice("Your suit will now report your exact vital lifesigns as well as your coordinate position."))
