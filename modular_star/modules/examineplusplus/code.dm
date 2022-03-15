//EXAMINE ++
//This allows for ANY object to be scrutinized to an extra-dextra degree, and is highly customizable.
//Each object can have special descriptions dependent on job, antag status, faction, mindshield, etc etc.

/obj/
	var/examinepp_desc = ""
	//JOB CHECK AND DESCRIPTION
	var/list/examinepp_req_jobs = "" //USE THEIR DEFINES HERE (EG, JOB_ASSISTANT, JOB_SECURITY_OFFICER)
	var/examinepp_desc_job = ""
	//MINDSHIELD DESCRIPTION
	var/examinepp_desc_mindshield
	//ANTAG CHECK AND DESCRIPTION
	var/list/examinepp_req_antags = ""
	var/examinepp_desc_antag = ""
	var/examinepp_antag_allow_skillchip = TRUE //if TRUE, anyone with a detective skillchip can bypass the antag check to scrutizine the item
	//FACTION CHECK AND DESCRIPTION
	var/list/examinepp_req_factions = ""
	var/examinepp_desc_faction = ""

/obj/examine_more(mob/user) //We handle each check individually, so we can have different descriptions for each.
	. = ..()
	if(examinepp_desc)
		. += "Upon further scrutiny, this is what you figure out:<br> [examinepp_desc]"
	if(examinepp_desc_job)
		if(ishuman(user))
			var/mob/living/carbon/human/jones = user
			for(var/monolith in examinepp_req_jobs)
				if(jones.job == monolith) //He truly is in the fast lane
					. += "Your training as a <span class='yellow'>[jones.job]</span> has given you insight here:<br> [examinepp_desc_job]"
	if(examinepp_desc_mindshield)
		if(HAS_TRAIT(user, TRAIT_MINDSHIELD))
			. += "Your <span class='blue'>innate loyalty to Nanotrasen</span> has given you insight here:<br> [examinepp_desc_mindshield]"
	if(examinepp_desc_antag)
		if(user.mind) //Sanity check
			var/datum/mind/dork = user.mind
			for(var/exppantag in examinepp_req_antags)
				if(dork.special_role == exppantag || examinepp_antag_allow_skillchip == TRUE && HAS_TRAIT(user, TRAIT_DETECTIVE))
					. += "Your <span class='red'>status as a [dork.special_role ? dork.special_role : "Detective"]</span> has given you insight here:<br> [examinepp_desc_antag]"
	if(examinepp_desc_faction)
		for(var/guilds in examinepp_req_factions)
			if(guilds in user.faction)
				. += "Your <span class='green'>affiliation with the [guilds]</span> has given you insight into here:<br> [examinepp_desc_faction]"
