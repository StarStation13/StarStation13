/obj/item/aicard/interdyne
	name = "\improper IP-OVRWTCH AI transport device"
	desc = "Interdyne Pharmaceutics' very own brand of AI transport."
	icon = 'modular_star/modules/relics/icons/syndicate/interdyne/aicards.dmi'
	icon_state = "ovrwtch"
	examinepp_req_antags = list(ROLE_TRAITOR,ROLE_NUCLEAR_OPERATIVE,ROLE_SYNDICATE)
	examinepp_desc_antag = "An Interdyne Pharmaceuticals AI transport device. While it initially appears to be a standard-ish device of it's kind, \
	this specific model hides a special secret. It's codebreaker module is capable of, very rarely, converting a normal AI into a syndicate-aligned \
	machine. This is a very rare and powerful AI-transport device, and while it'd be a dream for most operations, it has a rather huge flaw. \
	These overwatch cards, should they fail to convert the first AI stored on them, will permanently lock off the function. However, particularly \
	lucky agents may find it possible to chain-convert multiple AIs with a single card, if the odds land in their favor."
	// Did you take the deal and fail?
	var/bigshot = FALSE

/obj/item/aicard/interdyne/pre_attack(atom/target, mob/living/user, params)
	. = ..()
	if(AI)
		make_poor_ai_malf()
		return
	bigshot = TRUE

/obj/item/aicard/interdyne/proc/make_poor_ai_malf()
	if(AI) // WE LOVE SANITY CHECKS
		if(AI.malf_picker || bigshot == TRUE)
			return
		if(prob(1))
			if(AI.mind)
				AI.mind.special_role = ROLE_MALF_MIDROUND
				AI.mind.add_antag_datum(/datum/antagonist/malf_ai)
				if(prob(10))
					priority_announce("Attention crew of [GLOB.station_name]. We have reason to beleive[scramble_message_replace_chars("eEEeEbeleivebeleivebeleive", 70)]", "Priority Artificial Intelligence Status Report", ANNOUNCER_AIMALF) // All luck inevitably runs out, cowboy
