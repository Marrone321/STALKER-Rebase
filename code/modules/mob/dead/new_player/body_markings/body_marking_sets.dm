/datum/body_marking_set
	///The preview name of the body marking set. HAS to be unique
	var/name
	///List of the body markings in this set
	var/body_marking_list
	///Which species is this marking recommended to. Important for randomisations.
	var/recommended_species = list("mammal", "tajaran", "vulpkanin", "aquatic", "akula")
	/// Bodytypes which can access this marking set. (This can be bypassed by mismatched parts anyway)
	var/bodytypes = GENERIC_BODYTYPES

/datum/body_marking_set/none
	name = "None"
	recommended_species = null
	body_marking_list = list()
	bodytypes = ALL_BODYTYPES

/datum/body_marking_set/belly
	name = "Belly"
	body_marking_list = list("Belly")

/datum/body_marking_set/belly_slim
	name = "Belly Slim"
	body_marking_list = list("Belly Slim")

/datum/body_marking_set/hands_feet
	name = "Hands Feet"
	body_marking_list = list("Hands Feet")



