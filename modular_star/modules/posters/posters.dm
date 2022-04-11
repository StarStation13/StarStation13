///BASE ICON OVERRIDES///
///Overrides the normal /tg/ icons because, again, postercode bad
/obj/item/poster
	icon = 'modular_star/modules/posters/contraband.dmi'

/obj/structure/sign/poster
	icon = 'modular_star/modules/posters/contraband.dmi'

///RETRO CLASS POSTERS///
///These are a new poster type meant to be.. well, retro. ICly. Relatively.
///Functions identically to the other poster types besides being their own class.
///For the posters themselves refer to the custom posters section.

/obj/item/poster/random_retro
	name = "random retro poster"
	poster_type = /obj/structure/sign/poster/retro/random
	icon_state = "rolled_legit"

/obj/structure/sign/poster/retro
	poster_item_name = "retro poster"
	poster_item_desc = "A remarkably well preserved, adhesive-backed poster from bygone years. Manual adjustment required."
	poster_item_icon_state = "rolled_legit"

/obj/structure/sign/poster/retro/random
	name = "random retro poster"
	icon_state = "random_retro"
	never_random = TRUE //Haha /tg/ you are ruining my posters
	random_basetype = /obj/structure/sign/poster/retro

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/sign/poster/retro/random, 32)

///CUSTOM POSTERS///

//Retro
/obj/structure/sign/poster/retro/nanotrasen
	name = "corporate pride"
	desc = "A vintage NT poster - this specific one featuring an older variant of the logo, and four bars to it's top and bottom. No wonder that didn't catch on."
	icon_state = "retro_nt"

/obj/structure/sign/poster/retro/syndicate
	name = "syndicate"
	desc = "A retro Syndicate Poster, featuring the first revision of the collective banner. Why anyone preserved this is a mystery, but it's probably worth a lot now." //It isn't
	icon_state = "retro_synd"

/obj/structure/sign/poster/retro/scan
	name = "scan"
	desc = "A vintage poster advertising cloning scans as a readily available and reccomended option on Nanotrasen Stations. How times have changed."
	icon_state = "clone_scans"

/obj/structure/sign/poster/retro/telecrystal
	name = "telecrystal"
	desc = "A vintage poster, purporting Nanotrasen's research into refining bluespace crystals into \"Telecrystals\". No way this ended badly."
	icon_state = "telecrystal"

//Contraband
/obj/structure/sign/poster/contraband/shipstation
	name = "Flight Services - Enlist"
	desc = "This poster depicts the long deprecated 'Ship' class 'station' in it's hayday. Surprisingly, the poster seems to be Nanotrasen official; though with how hush they've been on the topic..."
	icon_state = "shipstation" //This map may as well be carved into my skin at this point

/obj/structure/sign/poster/contraband/operative_duffy
	name = "CASH REWARD"
	desc = "This poster depicts a gas mask, with details on how to 'forward information' on the whereabouts of whoever it means... though it doesn't specify to who."
	icon_state = "op_duffy"

/obj/structure/sign/poster/contraband/martyr
	name = "Martyr"
	desc = "This poster depicts a shaded silhouette of what seems to be a modified engineering cyborg of some sort. It has only one word - 'Martyr'."
	icon_state = "martyr"

/obj/structure/sign/poster/contraband/savetheoceans
	name = "Save The Ocean(s)"
	desc = "This poster would look like a nice underwater shot, from a distance - closer inspection reveals it's rather a colored word collage made to look like a photo, filled with sentences like \
	'On Friday, August 27th, march to your local Donk 'N Go and demand better!', 'Mother Nature will FIGHT BACK', 'Save the Sharks', and, humorously, a whole bunch about this poster being 'brought \
	to you by the Animal Rights Consortium and the SYNDICATE'... That's got to be embarassing for the latter, especially since their logo's front and center."
	icon_state = "arc_ocean" // 2562 for reference, current year + 540. Yes I had to look it up, shut up
