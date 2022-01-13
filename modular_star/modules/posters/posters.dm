///POSTERCODE///
///I'm not going to lie to you all, poster code is incredibly janky to work with and nowhere near clean. Unfortunately rolling all changes into this module is the best I can do.
///To compensate, I've not bothered with the standard hierarchy of the other modules and this one can be safely deleted with no real adverse effects if you wish.
///Do note some map adjustments may be required if you do.

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

///CUSTOM POSTERS///

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
