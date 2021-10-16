/datum/weather/rain
	name = "rain"
	desc = "Harsh, yet ultimately harmless rainstorms bare down upon this planet occasionally."
	probability = 25

	telegraph_message = "The skies darken as a light drizzle sets in..."
	telegraph_duration = 13 SECONDS
	telegraph_overlay = "light_rain"

	weather_message = "The rainfall begins in earnest, sending drops from the sky."
	weather_overlay = "rain"
	weather_duration_lower = 600
	weather_duration_upper = 30 MINUTES

	end_duration = 100
	end_message = "The rain falls still as the clouds give way to a glimmer of the sky above."

	area_type = /area
	protect_indoors = TRUE
	target_trait = ZTRAIT_RAIN

	barometer_predictable = TRUE

	telegraph_sound = 'sound/ambience/acidrain_start.ogg'

	weather_sound = 'sound/ambience/acidrain_mid.ogg'

	end_sound = 'sound/ambience/acidrain_end.ogg'
