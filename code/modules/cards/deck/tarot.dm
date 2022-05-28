#define TAROT_GHOST_TIMER (666 SECONDS) // this translates into 11 mins and 6 seconds

//These cards certainly won't tell the future, but you can play some nice games with them.
/obj/item/toy/cards/deck/tarot
	name = "tarot game deck"
	desc = "A full 78 card game deck of tarot cards. Complete with 4 suites of 14 cards, and a full suite of trump cards."
	cardgame_desc = "tarot card reading"
	icon_state = "deck_tarot_full"
	deckstyle = "tarot"
	is_standard_deck = FALSE

/obj/item/toy/cards/deck/tarot/Initialize(mapload)
	. = ..()
	for(var/suit in list("Hearts", "Pikes", "Clovers", "Tiles"))
		for(var/i in 1 to 10)
			cards += new /obj/item/toy/singlecard(src, "[i] of [suit]", src)
		for(var/person in list("Valet", "Chevalier", "Dame", "Roi"))
			cards += new /obj/item/toy/singlecard(src, "[person] of [suit]", src)
	for(var/trump in list("The Magician", "The High Priestess", "The Empress", "The Emperor", "The Hierophant", "The Lover", "The Chariot", "Justice", "The Hermit", "The Wheel of Fortune", "Strength", "The Hanged Man", "Death", "Temperance", "The Devil", "The Tower", "The Star", "The Moon", "The Sun", "Judgement", "The World", "The Fool"))
		cards += new /obj/item/toy/singlecard(src, trump, src)

/obj/item/toy/cards/deck/tarot/draw(mob/user)
	. = ..()
	if(prob(50))
		var/obj/item/toy/singlecard/card = .
		var/matrix/M = matrix()
		M.Turn(180)
		card.transform = M

/obj/item/toy/cards/deck/tarot/haunted
	name = "haunted tarot game deck"
	desc = "A spooky looking tarot deck. You can sense a supernatural presence linked to the cards..."
	/// ghost notification cooldown
	COOLDOWN_DECLARE(ghost_alert_cooldown)

/obj/item/toy/cards/deck/tarot/haunted/on_wield(obj/item/source, mob/living/carbon/user)
	. = ..()
	ADD_TRAIT(user, TRAIT_SIXTHSENSE, MAGIC_TRAIT)
	to_chat(user, span_notice("The veil to the underworld is opened. You can sense the dead souls calling out..."))

	if(!COOLDOWN_FINISHED(src, ghost_alert_cooldown))
		return

	COOLDOWN_START(src, ghost_alert_cooldown, TAROT_GHOST_TIMER)
	notify_ghosts(
		"Someone has begun playing with a [src.name] in [get_area(src)]!",
		source = src,
		header = "Haunted Tarot Deck",
		ghost_sound = 'sound/effects/ghost2.ogg',
		notify_volume = 75,
		action = NOTIFY_ORBIT,
	)

/obj/item/toy/cards/deck/tarot/haunted/on_unwield(obj/item/source, mob/living/carbon/user)
	. = ..()
	REMOVE_TRAIT(user, TRAIT_SIXTHSENSE, MAGIC_TRAIT)
	to_chat(user, span_notice("The veil to the underworld closes shut. You feel your senses returning to normal."))

#undef TAROT_GHOST_TIMER
