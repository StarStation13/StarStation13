/obj/item/radio/headset/interdyne
	name = "interdyne pharmaceutics headset"
	desc = "An interdyne branded bowman headset. Protects ears from flashbangs."
	icon = 'modular_star/modules/relics/icons/syndicate/interdyne/radio.dmi'
	icon_state = "dyne_headset"
	examinepp_req_antags = list(ROLE_TRAITOR,ROLE_NUCLEAR_OPERATIVE,ROLE_SYNDICATE)
	examinepp_desc_antag = "An Interdyne Pharmaceuticals Headset, commonly seen in more domestic operations. \
	It's only overt remarkable feature is ear protection for the wearer against flashbangs and the like."
	inhand_icon_state = "syndie_headset"

/obj/item/radio/headset/interdyne/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))
