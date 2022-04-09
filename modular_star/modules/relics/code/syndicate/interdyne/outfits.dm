/datum/outfit/interdyne
	name = "Interdyne Operative"

	uniform = /obj/item/clothing/under/syndicate
	suit = /obj/item/clothing/suit/armor/vest
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	back = /obj/item/storage/backpack/fireproof
	head = /obj/item/clothing/head/hos/beret/syndicate
	ears = /obj/item/radio/headset/interdyne
	glasses = /obj/item/clothing/glasses/hud/security/chameleon
	l_pocket = /obj/item/sequence_scanner/interdyne
	r_pocket = /obj/item/aicard/interdyne
	id = /obj/item/card/id/advanced/black/syndicate_command
	belt = /obj/item/gun/ballistic/automatic/pistol
	backpack_contents = list(/obj/item/storage/box/survival/syndie=1,\
		/obj/item/knife/combat/survival)

	skillchips = list(/obj/item/skillchip/disk_verifier, /obj/item/skillchip/job/detective)

	id_trim = /datum/id_trim/syndicom/crew

/datum/outfit/interdyne/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	var/obj/item/card/id/card = H.wear_id //Because this is admin outfit menu only, we want to update the ID automatically
	card.registered_name = H.real_name
	if(H.age)
		card.registered_age = H.age
	card.update_label()
	card.update_icon()
