/datum/cultural_info/location
	var/distance

/datum/cultural_info/location/get_extra_desc(more = FALSE)
	. = ..()
	if(!more)
		return
	. += "<BR>Distance: [distance ? "[distance]" : "Unknown"]"
