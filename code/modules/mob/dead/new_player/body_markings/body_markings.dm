//This datum is quite close to the sprite accessory one, containing a bit of copy pasta code
//Those DO NOT have a customizable cases for rendering, or any special stuff, and are meant to be simpler than accessories
//One definition can stand for a whole set of accessories, make sure to set affected bodyparts
/datum/body_marking
	///The icon file the body markign is located in
	var/icon
	///The icon_state of the body marking
	var/icon_state
	///The preview name of the body marking. NEEDS A UNIQUE NAME
	var/name
	///The color the marking defaults to, important for randomisations. either a hex color ie."FFF" or a define like DEFAULT_PRIMARY
	var/default_color
	///Which bodyparts does the marking affect in BITFLAGS!! (HEAD, CHEST, ARM_LEFT, ARM_RIGHT, HAND_LEFT, HAND_RIGHT, LEG_RIGHT, LEG_LEFT)
	var/affected_bodyparts
	///Which species is this marking recommended to. Important for randomisations.
	var/recommended_species = list("mammal")
	///If this is on the color customization will show up despite the pref settings, it will also cause the marking to not reset colors to match the defaults
	var/always_color_customizable
	///Whether the body marking sprite is the same for both sexes or not. Only relevant for chest right now.
	var/gendered = TRUE
	/// Bodytypes which can access this marking. (This can be bypassed by mismatched parts anyway)
	var/bodytypes = GENERIC_BODYTYPES

/datum/body_marking/New()
	if(!default_color)
		default_color = "FFF"

/datum/body_marking/proc/get_default_color(list/features, datum/species/pref_species) //Needs features for the color information
	var/list/colors
	switch(default_color)
		if(DEFAULT_PRIMARY)
			colors = features["mcolor"]
		if(DEFAULT_SECONDARY)
			colors = features["mcolor2"]
		if(DEFAULT_TERTIARY)
			colors = features["mcolor3"]
		if(DEFAULT_SKIN_OR_PRIMARY)
			if(pref_species && pref_species.use_skintones)
				colors = features["skin_color"]
			else
				colors = features["mcolor"]
		else
			colors = default_color

	return colors

//Use this one for things with pre-set default colors, I guess
/datum/body_marking/other
	icon = 'icons/mob/body_markings/other_markings.dmi'
	recommended_species = null

/datum/body_marking/other/tonage
	name = "Body Tonage"
	icon_state = "tonage"
	default_color = "555"
	affected_bodyparts = CHEST
	gendered = FALSE

/datum/body_marking/other/bands
	name = "Color Bands"
	icon_state = "bands"
	affected_bodyparts = CHEST | ARM_LEFT | ARM_RIGHT | HAND_LEFT | HAND_RIGHT | LEG_RIGHT | LEG_LEFT

/datum/body_marking/other/bands_foot
	name = "Color Bands (Foot)"
	icon_state = "bands_foot"
	affected_bodyparts = LEG_RIGHT | LEG_LEFT

/datum/body_marking/secondary
	icon = 'icons/mob/body_markings/secondary_markings.dmi'
	default_color = DEFAULT_SECONDARY

/datum/body_marking/secondary/belly
	name = "Belly"
	icon_state = "belly"
	affected_bodyparts = CHEST

/datum/body_marking/secondary/bellyslim
	name = "Belly Slim"
	icon_state = "bellyslim"
	affected_bodyparts = HEAD | CHEST | LEG_RIGHT | LEG_LEFT

/datum/body_marking/secondary/bellyslimalt
	name = "Belly Slim Alternative"
	icon_state = "bellyslim_alt"
	affected_bodyparts = CHEST

/datum/body_marking/secondary/handsfeet
	name = "Hands Feet"
	icon_state = "handsfeet"
	affected_bodyparts = HAND_LEFT | HAND_RIGHT | LEG_RIGHT | LEG_LEFT

/datum/body_marking/secondary/gradient
	name = "Gradient"
	icon_state = "gradient"
	affected_bodyparts = ARM_LEFT | ARM_RIGHT | HAND_LEFT | HAND_RIGHT | LEG_RIGHT | LEG_LEFT

/datum/body_marking/tertiary
	icon = 'icons/mob/body_markings/tertiary_markings.dmi'
	default_color = DEFAULT_TERTIARY

//TODO: Make these markings associated with their assigned bodyparts rather than mob dna.
/datum/body_marking/tattoo
	icon = 'icons/mob/body_markings/tattoo_markings.dmi'
	recommended_species = null
	default_color = "122" //slightly faded ink.
	always_color_customizable = TRUE
	gendered = FALSE

/datum/body_marking/tattoo/heart
	name = "Tattoo - Heart"
	icon_state = "tat_heart"
	affected_bodyparts = CHEST | ARM_LEFT | ARM_RIGHT

/datum/body_marking/tattoo/hive
	name = "Tattoo - Hive"
	icon_state = "tat_hive"
	affected_bodyparts = CHEST
	gendered = TRUE

/datum/body_marking/tattoo/nightling
	name = "Tattoo - Nightling"
	icon_state = "tat_nightling"
	affected_bodyparts = CHEST

/datum/body_marking/tattoo/circuit
	name = "Tattoo - Circuit"
	icon_state = "tat_campbell"
	affected_bodyparts = ARM_LEFT | ARM_RIGHT | LEG_RIGHT | LEG_LEFT

/datum/body_marking/tattoo/silverburgh //dunno what this is.
	name = "Tattoo - Silverburgh"
	icon_state = "tat_silverburgh"
	affected_bodyparts = LEG_RIGHT | LEG_LEFT

/datum/body_marking/tattoo/tiger
	name = "Tattoo - Tiger"
	icon_state = "tat_tiger"
	affected_bodyparts = CHEST | ARM_LEFT | ARM_RIGHT | HAND_LEFT | HAND_RIGHT | LEG_RIGHT | LEG_LEFT
	gendered = TRUE

/datum/body_marking/tattoo/tiger_groin
	name = "Tattoo - Tiger (Groin)"
	icon_state = "tat_tiger_groin"
	affected_bodyparts = CHEST

/datum/body_marking/tattoo/tiger_foot
	name = "Tattoo - Tiger (Foot)"
	icon_state = "tat_tiger_foot"
	affected_bodyparts = LEG_RIGHT | LEG_LEFT
