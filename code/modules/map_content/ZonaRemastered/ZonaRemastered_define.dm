/datum/map_config/ZonaRemastered
	map_name = "ZonaRemastered"
	map_path = "map_files/ZonaRemastered"
	map_file = "backwater.dmm"

	traits = list(
		list(
			"Up" = 1,
			),
		list(
			"Down" = -1,
			"Up" = 1,
			),
		list(
			"Down" = -1,
			"Up" = 1,
			),
		list(
			"Down" = -1,
			"Up" = 1,
			),
		list(
			"Down" = -1,
			)
		)

	day_night_controller_type = /datum/day_night_controller
	weather_controller_type = /datum/weather_controller/zona

	allow_custom_shuttles = TRUE

	job_changes = list()
	job_listings = list(
		/datum/job_listing/army,
		/datum/job_listing/bandit,
		/datum/job_listing/clearsky,
		/datum/job_listing/duty,
		/datum/job_listing/ecologist,
		/datum/job_listing/freedom,
		/datum/job_listing/mercenary,
		/datum/job_listing/monolith,
		/datum/job_listing/renegade,
		/datum/job_listing/stalker
		)
