//All of this was yoinked from Skyrat, and, thusly, Toolbox Station. Considering the hellish personal history with the former...
//https://en.wikipedia.org/wiki/Censorship_of_images_in_the_Soviet_Union#Censorship_of_historical_photographs
/atom/movable/screen/star_logo
	name = "Star Station 13"
	icon = 'modular_star/modules/lobby_cam/icons/star_logo.dmi'
	icon_state = "star_logo"
	screen_loc = "1:16,1:16"
	plane = STAR_LOGO
	alpha = 0

/atom/movable/screen/movable/black_fade
	name = "black screen"
	icon = 'modular_star/modules/lobby_cam/icons/black_screen.dmi'
	icon_state = "1"
	screen_loc = "SOUTHWEST to NORTHEAST"
	plane = BLACK_FADE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/mob/dead/new_player/Login()
	. = ..()
	var/atom/movable/screen/star_logo/logo_screen = new()
	if (client && SSticker.current_state < GAME_STATE_PLAYING)
		client.screen += logo_screen
		animate(logo_screen, alpha = 255, time = 5 SECONDS)

/obj/new_player_cam
	name = "floor"
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	density = FALSE
	anchored = TRUE
	alpha = 0
	invisibility = INVISIBILITY_ABSTRACT

/datum/preference/toggle/lobby_cam
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	default_value = TRUE
	savefile_key = "lobby_cam_pref"
	savefile_identifier = PREFERENCE_PLAYER
