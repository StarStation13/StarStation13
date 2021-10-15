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
	weather_duration_upper = 30 MINUTES //It's a jungle bruhv

	end_duration = 100
	end_message = "The rain falls still as the clouds give way to a glimmer of the sky above."

	area_type = /area
	protect_indoors = TRUE
	target_trait = ZTRAIT_RAIN

	barometer_predictable = TRUE

//Shamelessly Copied From Ash Storms But Weathercode Bad

	var/list/weak_sounds = list()
	var/list/strong_sounds = list()

/datum/weather/rain/telegraph()
	var/list/eligible_areas = list()
	for (var/z in impacted_z_levels)
		eligible_areas += SSmapping.areas_in_z["[z]"]
	for(var/i in 1 to eligible_areas.len)
		var/area/place = eligible_areas[i]
		if(place.outdoors)
			weak_sounds[place] = /datum/looping_sound/storm/quiet
			strong_sounds[place] = /datum/looping_sound/storm
		else
			weak_sounds[place] = /datum/looping_sound/storm/quieter
			strong_sounds[place] = /datum/looping_sound/storm/quiet
		CHECK_TICK

	//We modify this list instead of setting it to weak/stron sounds in order to preserve things that hold a reference to it
	//It's essentially a playlist for a bunch of components that chose what sound to loop based on the area a player is in
	GLOB.rain_sounds += weak_sounds
	return ..()

/datum/weather/rain/start()
	GLOB.rain_sounds -= weak_sounds
	GLOB.rain_sounds += strong_sounds
	return ..()

/datum/weather/rain/wind_down()
	GLOB.rain_sounds -= strong_sounds
	GLOB.rain_sounds += weak_sounds
	return ..()

/datum/weather/rain/end()
	GLOB.rain_sounds -= weak_sounds
	return ..()
