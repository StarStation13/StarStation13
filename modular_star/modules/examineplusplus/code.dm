//EXAMINE ++
//This allows for ANY object to be scrutinized to an extra-dextra degree, and is highly customizable.
//Each object can have special descriptions dependent on job, antag status, faction, mindshield, etc etc.

/obj/
	//String of text anyone will see when examining the object closely.
	var/examinepp_desc = ""

	//JOB CHECK AND RELATED//

	//Jobs required to see the text defined in examinepp_desc_job. Use their defines here (JOB_ASSISTANT)
	var/list/examinepp_req_jobs = null
	//The description printed when examining the object with the job defined in examinepp_req_jobs.
	var/examinepp_desc_job = ""

	//MINDSHIELD CHECK AND RELATED//

	//The description printed when examining the object with a mindshield implant.
	var/examinepp_desc_mindshield

	//ANTAG/ROLE CHECK AND RELATED//

	//Antags required to see the text defined in examinepp_desc_antag. Use their defines here (ROLE_TRAITOR)
	var/list/examinepp_req_antags = null
	//The text printed when examining the object with the role defined in examinepp_req_antags.
	var/examinepp_desc_antag = ""
	//If TRUE, the antag description will be printed if the observer has the detective skillchip.
	var/examinepp_antag_allow_skillchip = TRUE

	//FACTION CHECK AND RELATED//

	//Factions required to see the text defined in examinepp_desc_faction. Preferably use their defines, but strings are accepted into the list too.
	var/list/examinepp_req_factions = null
	//The text printed when examining the object with the faction(s) defined in examinepp_req_factions.
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
				if(dork.special_role == exppantag)
					. += "Your <span class='red'>status as a [dork.special_role]</span> has given you insight here:<br> [examinepp_desc_antag]"
				else if(examinepp_antag_allow_skillchip == TRUE && HAS_TRAIT(user, TRAIT_DETECTIVE)) // WHY THE FUCK DO SKILLCHIPS APPLY THE TRAIT THREE TIMES WHAT THE FUCK
					. += "Your <span class='red'>suite of innate detective skills</span> have given you insight here:<br> [examinepp_desc_antag]"
	if(examinepp_desc_faction)
		for(var/guilds in examinepp_req_factions)
			if(guilds in user.faction)
				. += "Your <span class='green'>affiliation with the [guilds]</span> has given you insight into here:<br> [examinepp_desc_faction]"
