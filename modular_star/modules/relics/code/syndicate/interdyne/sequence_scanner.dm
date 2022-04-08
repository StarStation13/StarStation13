/// Interdyne variant of the DNA Scanner, for the Relic module ///

/obj/item/sequence_scanner/interdyne
	name = "\improper IP-04 gene-scanner"
	desc = "An older-generation analyzer of Interdyne Pharmaceutics make. Hold near a DNA console to update the internal database."
	icon = 'modular_star/modules/relics/icons/syndicate/interdyne/device.dmi'
	icon_state = "genedyne"
	examinepp_req_antags = list(ROLE_TRAITOR,ROLE_NUCLEAR_OPERATIVE,ROLE_SYNDICATE)
	examinepp_desc_antag = "Created by Interdyne Pharmaceuticals, this specific genetics scanner isn't special asides from it's historic status. It's still a good device, but it's not as user-transparent as the newer models."
