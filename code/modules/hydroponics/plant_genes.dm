/// Plant gene datums - things that build and modify a plant or seed.
/datum/plant_gene
	/// The name of the gene.
	var/name
	/// Flags that determine if a gene can be modified.
	var/mutability_flags

/*
 * Returns the formatted name of the plant gene.
 *
 * Overridden by the various subtypes of plant genes to format their respective names.
 */
/datum/plant_gene/proc/get_name()
	return name

/*
 * Check if the seed can accept this plant gene.
 *
 * our_seed - the seed we're adding the gene to
 *
 * Returns TRUE if the seed can take the gene, and FALSE otherwise.
 */
/datum/plant_gene/proc/can_add(obj/item/seeds/our_seed)
	return !istype(our_seed, /obj/item/seeds/sample) // Samples can't accept new genes.

/// Copies over vars and information about our current gene to a new gene and returns the new instance of gene.
/datum/plant_gene/proc/Copy()
	var/datum/plant_gene/new_gene = new type
	new_gene.mutability_flags = mutability_flags
	return new_gene

/// Core plant genes. Stores the main variables: lifespan, endurance, production, yield, potency, instability, weed rate/chance
/datum/plant_gene/core
	/// The number value of our core gene.
	var/value = 0

/datum/plant_gene/core/get_name()
	return "[name] [value]"

/*
 * Apply our core gene's stats to our seed's stats.
 */
/datum/plant_gene/core/proc/apply_stat(obj/item/seeds/our_seed)
	return

/datum/plant_gene/core/New(initial_value = 0)
	value = initial_value

/datum/plant_gene/core/Copy()
	. = ..()
	var/datum/plant_gene/core/new_core_gene = .
	new_core_gene.value = value
	return

/datum/plant_gene/core/can_add(obj/item/seeds/our_seed)
	. = ..()
	if(!.)
		return FALSE
	return our_seed.get_gene(type) // We can't double-add core plant genes.

/datum/plant_gene/core/lifespan
	name = "Lifespan"
	value = 25

/datum/plant_gene/core/lifespan/apply_stat(obj/item/seeds/our_seed)
	our_seed.lifespan = value

/datum/plant_gene/core/endurance
	name = "Endurance"
	value = 15

/datum/plant_gene/core/endurance/apply_stat(obj/item/seeds/our_seed)
	our_seed.endurance = value

/datum/plant_gene/core/production
	name = "Production Speed"
	value = 6

/datum/plant_gene/core/production/apply_stat(obj/item/seeds/our_seed)
	our_seed.production = value

/datum/plant_gene/core/yield
	name = "Yield"
	value = 3

/datum/plant_gene/core/yield/apply_stat(obj/item/seeds/our_seed)
	our_seed.yield = value

/datum/plant_gene/core/potency
	name = "Potency"
	value = 10

/datum/plant_gene/core/potency/apply_stat(obj/item/seeds/our_seed)
	our_seed.potency = value

/datum/plant_gene/core/instability
	name = "Stability"
	value = 10

/datum/plant_gene/core/instability/apply_stat(obj/item/seeds/our_seed)
	our_seed.instability = value

/datum/plant_gene/core/weed_rate
	name = "Weed Growth Rate"
	value = 1

/datum/plant_gene/core/weed_rate/apply_stat(obj/item/seeds/our_seed)
	our_seed.weed_rate = value

/datum/plant_gene/core/weed_chance
	name = "Weed Vulnerability"
	value = 5

/datum/plant_gene/core/weed_chance/apply_stat(obj/item/seeds/our_seed)
	our_seed.weed_chance = value

/// Reagent genes store a reagent ID and reagent ratio.
/datum/plant_gene/reagent
	name = "Nutriment"
	mutability_flags = PLANT_GENE_REMOVABLE
	/// The actual reagent that this gene is tied to.
	var/reagent_id = /datum/reagent/consumable/nutriment
	/// The amount of reagent generated by the plant. The equation is [1 + ((max_volume*(potency/100)) * rate)]
	var/rate = 0.04

/datum/plant_gene/reagent/get_name()
	var/formatted_name
	if(!(mutability_flags & PLANT_GENE_REMOVABLE))
		formatted_name += "Fragile "
	formatted_name += "[name] production [rate*100]%"
	return formatted_name

/*
 * Set our reagent's ID and name to the passed reagent.
 *
 * new_reagent_id - typepath of the reagent we're setting this gene to
 */
/datum/plant_gene/reagent/proc/set_reagent(new_reagent_id)
	reagent_id = new_reagent_id
	name = "UNKNOWN"

	var/datum/reagent/found_reagent = GLOB.chemical_reagents_list[new_reagent_id]
	if(found_reagent?.type == reagent_id)
		name = found_reagent.name

/datum/plant_gene/reagent/New(initial_reagent_id, initial_reagent_rate = 0)
	. = ..()
	if(initial_reagent_id && initial_reagent_rate)
		set_reagent(initial_reagent_id)
		rate = initial_reagent_rate

/datum/plant_gene/reagent/Copy()
	. = ..()
	var/datum/plant_gene/reagent/new_reagent_gene = .
	new_reagent_gene.name = name
	new_reagent_gene.reagent_id = reagent_id
	new_reagent_gene.rate = rate
	return

/datum/plant_gene/reagent/can_add(obj/item/seeds/our_seed)
	. = ..()
	if(!.)
		return FALSE
	for(var/datum/plant_gene/reagent/seed_reagent in our_seed.genes)
		if(seed_reagent.reagent_id == reagent_id && seed_reagent.rate <= rate)
			return FALSE // We can upgrade reagent genes if our rate is greater than the one already in the plant.
	return TRUE

/**
 * Intends to compare a reagent gene with a set of seeds, and if the seeds contain the same gene, with more production rate, upgrades the rate to the highest of the two.
 *
 * Called when plants are crossbreeding, this looks for two matching reagent_ids, where the rates are greater, in order to upgrade.
 */
/datum/plant_gene/reagent/proc/try_upgrade_gene(obj/item/seeds/seed)
	for(var/datum/plant_gene/reagent/reagent in seed.genes)
		if(reagent.reagent_id != reagent_id || reagent.rate <= rate)
			continue
		rate = reagent.rate
		return TRUE
	return FALSE

/datum/plant_gene/reagent/polypyr
	name = "Polypyrylium Oligomers"
	reagent_id = /datum/reagent/medicine/polypyr
	rate = 0.15
	mutability_flags = PLANT_GENE_GRAFTABLE

/datum/plant_gene/reagent/carbon
	name = "Carbon"
	reagent_id = /datum/reagent/carbon
	rate = 0.1
	mutability_flags = PLANT_GENE_GRAFTABLE

/// Traits that affect the grown product.
/datum/plant_gene/trait
	/// The rate at which this trait affects something. This can be anything really - why? I dunno.
	var/rate = 0.05
	/// Bonus lines displayed on examine.
	var/examine_line = ""
	/// Flag - Traits that share an ID cannot be placed on the same plant.
	var/trait_ids
	/// Flag - Modifications made to the final product.
	var/trait_flags
	/// A blacklist of seeds that a trait cannot be attached to.
	var/list/obj/item/seeds/seed_blacklist

/datum/plant_gene/trait/Copy()
	. = ..()
	var/datum/plant_gene/trait/new_trait_gene = .
	new_trait_gene.rate = rate
	return

/datum/plant_gene/trait/get_name() // Used for manipulator display and gene disk name.
	var/formatted_name
	if(!(mutability_flags & PLANT_GENE_REMOVABLE))
		if(!(mutability_flags & PLANT_GENE_GRAFTABLE))
			formatted_name += "Immutable "
		else
			formatted_name += "Essential "
	formatted_name += name
	return formatted_name

/*
 * Checks if we can add the trait to the seed in question.
 *
 * source_seed - the seed genes we're adding the trait too
 */
/datum/plant_gene/trait/can_add(obj/item/seeds/source_seed)
	. = ..()
	if(!.)
		return FALSE

	for(var/obj/item/seeds/found_seed as anything in seed_blacklist)
		if(istype(source_seed, found_seed))
			return FALSE

	for(var/datum/plant_gene/trait/trait in source_seed.genes)
		if(trait_ids & trait.trait_ids)
			return FALSE
		if(type == trait.type)
			return FALSE

	return TRUE

/*
 * on_new_plant is called for every plant trait on an /obj/item/grown or /obj/item/food/grown when initialized.
 *
 * our_plant - the source plant being created
 * newloc - the loc of the plant
 */
/datum/plant_gene/trait/proc/on_new_plant(obj/item/our_plant, newloc)
	// Plants should always have seeds, but if a plant gene is somehow being instantiated on a plant with no seed, stop initializing genes
	// (Plants hold their genes on their seeds, so we can't really add them to something that doesn't exist)
	if(isnull(our_plant.get_plant_seed()))
		stack_trace("[our_plant] ([our_plant.type]) has a nulled seed value while trying to initialize [src]!")
		return FALSE

	// Add on any bonus lines on examine
	if(examine_line)
		RegisterSignal(our_plant, COMSIG_PARENT_EXAMINE, .proc/examine)

	return TRUE

/*
 * on_new_seed is called when seed genes are initialized on the /obj/seed.
 *
 * new_seed - the seed being created
 */
/datum/plant_gene/trait/proc/on_new_seed(obj/item/seeds/new_seed)
	return TRUE

/// Add on any unique examine text to the plant's examine text.
/datum/plant_gene/trait/proc/examine(obj/item/our_plant, mob/examiner, list/examine_list)
	SIGNAL_HANDLER

	examine_list += examine_line

/// Allows the plant to be squashed when thrown or slipped on, leaving a colored mess and trash type item behind.
/datum/plant_gene/trait/squash
	name = "Liquid Contents"
	examine_line = SPAN_INFO("It has a lot of liquid contents inside.")
	trait_ids = THROW_IMPACT_ID | REAGENT_TRANSFER_ID | ATTACK_SELF_ID
	mutability_flags = PLANT_GENE_REMOVABLE | PLANT_GENE_MUTATABLE | PLANT_GENE_GRAFTABLE

// Register a signal that our plant can be squashed on add.
/datum/plant_gene/trait/squash/on_new_plant(obj/item/food/grown/our_plant, newloc)
	. = ..()
	if(!.)
		return

	RegisterSignal(our_plant, COMSIG_PLANT_ON_SLIP, .proc/squash_plant)
	RegisterSignal(our_plant, COMSIG_MOVABLE_IMPACT, .proc/squash_plant)
	RegisterSignal(our_plant, COMSIG_ITEM_ATTACK_SELF, .proc/squash_plant)

/*
 * Signal proc to squash the plant this trait belongs to, causing a smudge, exposing the target to reagents, and deleting it,
 *
 * Arguments
 * our_plant - the plant this trait belongs to.
 * target - the atom being hit by this squashed plant.
 */
/datum/plant_gene/trait/squash/proc/squash_plant(obj/item/food/grown/our_plant, atom/target)
	SIGNAL_HANDLER

	var/turf/our_turf = get_turf(target)
	our_plant.forceMove(our_turf)
	if(istype(our_plant))
		if(ispath(our_plant.splat_type, /obj/effect/decal/cleanable/food/plant_smudge))
			var/obj/plant_smudge = new our_plant.splat_type(our_turf)
			plant_smudge.name = "[our_plant.name] smudge"
			if(our_plant.filling_color)
				plant_smudge.color = our_plant.filling_color
		else if(our_plant.splat_type)
			new our_plant.splat_type(our_turf)
	else
		var/obj/effect/decal/cleanable/food/plant_smudge/misc_smudge = new(our_turf)
		misc_smudge.name = "[our_plant.name] smudge"
		misc_smudge.color = "#82b900"

	our_plant.visible_message(SPAN_WARNING("[our_plant] is squashed."),SPAN_HEAR("You hear a smack."))
	SEND_SIGNAL(our_plant, COMSIG_PLANT_ON_SQUASH, target)

	our_plant.reagents?.expose(our_turf)
	for(var/things in our_turf)
		our_plant.reagents?.expose(things)

	qdel(our_plant)

/*
 * Makes plant slippery, unless it has a grown-type trash. Then the trash gets slippery.
 * Applies other trait effects (teleporting, etc) to the target by signal.
 */
/datum/plant_gene/trait/slip
	name = "Slippery Skin"
	rate = 1.6
	examine_line = SPAN_INFO("It has a very slippery skin.")
	mutability_flags = PLANT_GENE_REMOVABLE | PLANT_GENE_MUTATABLE | PLANT_GENE_GRAFTABLE

/datum/plant_gene/trait/slip/on_new_plant(obj/item/our_plant, newloc)
	. = ..()
	if(!.)
		return

	var/obj/item/food/grown/grown_plant = our_plant
	if(istype(grown_plant) && ispath(grown_plant.trash_type, /obj/item/grown))
		return

	var/obj/item/seeds/our_seed = our_plant.get_plant_seed()
	var/stun_len = our_seed.potency * rate

	if(!istype(our_plant, /obj/item/grown/bananapeel) && (!our_plant.reagents || !our_plant.reagents.has_reagent(/datum/reagent/lube)))
		stun_len /= 3

	our_plant.AddComponent(/datum/component/slippery, min(stun_len, 140), NONE, CALLBACK(src, .proc/handle_slip, our_plant))

/// On slip, sends a signal that our plant was slipped on out.
/datum/plant_gene/trait/slip/proc/handle_slip(obj/item/food/grown/our_plant, mob/slipped_target)
	SEND_SIGNAL(our_plant, COMSIG_PLANT_ON_SLIP, slipped_target)

/*
 * Makes the plant glow. Makes the plant in tray glow, too.
 * Adds (1.4 + potency * rate) light range and (potency * (rate + 0.01)) light_power to products.
 */
/datum/plant_gene/trait/glow
	name = "Bioluminescence"
	rate = 0.03
	examine_line = SPAN_INFO("It emits a soft glow.")
	trait_ids = GLOW_ID
	mutability_flags = PLANT_GENE_REMOVABLE | PLANT_GENE_MUTATABLE | PLANT_GENE_GRAFTABLE
	/// The color of our bioluminesence.
	var/glow_color = "#C3E381"

/datum/plant_gene/trait/glow/proc/glow_range(obj/item/seeds/seed)
	return 1.4 + seed.potency * rate

/datum/plant_gene/trait/glow/proc/glow_power(obj/item/seeds/seed)
	return max(seed.potency * (rate + 0.01), 0.1)

/datum/plant_gene/trait/glow/on_new_plant(obj/item/our_plant, newloc)
	. = ..()
	if(!.)
		return

	var/obj/item/seeds/our_seed = our_plant.get_plant_seed()
	our_plant.light_system = MOVABLE_LIGHT
	our_plant.AddComponent(/datum/component/overlay_lighting, glow_range(our_seed), glow_power(our_seed), glow_color)

/*
 * Makes plant emit darkness. (Purple-ish shadows)
 * Adds - (potency * (rate * 0.2)) light power to products.
 */
/datum/plant_gene/trait/glow/shadow
	name = "Shadow Emission"
	rate = 0.04
	glow_color = "#AAD84B"

/datum/plant_gene/trait/glow/shadow/glow_power(obj/item/seeds/seed)
	return -max(seed.potency*(rate*0.2), 0.2)

/// Colored versions of bioluminescence.

/// White
/datum/plant_gene/trait/glow/white
	name = "White Bioluminescence"
	glow_color = "#FFFFFF"

/// Red
/datum/plant_gene/trait/glow/red
	name = "Red Bioluminescence"
	glow_color = "#FF3333"

/// Yellow (not the disgusting glowshroom yellow hopefully)
/datum/plant_gene/trait/glow/yellow
	name = "Yellow Bioluminescence"
	glow_color = "#FFFF66"

/// Green (oh no, now i'm radioactive)
/datum/plant_gene/trait/glow/green
	name = "Green Bioluminescence"
	glow_color = "#99FF99"

/// Blue (the best one)
/datum/plant_gene/trait/glow/blue
	name = "Blue Bioluminescence"
	glow_color = "#6699FF"

/// Purple (did you know that notepad++ doesnt think bioluminescence is a word) (was the person who wrote this using notepad++ for dm?)
/datum/plant_gene/trait/glow/purple
	name = "Purple Bioluminescence"
	glow_color = "#D966FF"

// Pink (gay tide station pride)
/datum/plant_gene/trait/glow/pink
	name = "Pink Bioluminescence"
	glow_color = "#FFB3DA"

/*
 * Makes plant teleport people when squashed or slipped on.
 * Teleport radius is roughly potency / 10.
 */
/datum/plant_gene/trait/teleport
	name = "Bluespace Activity"
	rate = 0.1
	mutability_flags = PLANT_GENE_REMOVABLE | PLANT_GENE_MUTATABLE | PLANT_GENE_GRAFTABLE

/datum/plant_gene/trait/teleport/on_new_plant(obj/item/our_plant, newloc)
	. = ..()
	if(!.)
		return

	var/obj/item/seeds/our_seed = our_plant.get_plant_seed()
	if(our_seed.get_gene(/datum/plant_gene/trait/squash))
		// If we have the squash gene, let that handle slipping
		RegisterSignal(our_plant, COMSIG_PLANT_ON_SQUASH, .proc/squash_teleport)
	else
		RegisterSignal(our_plant, COMSIG_PLANT_ON_SLIP, .proc/slip_teleport)

/*
 * When squashed, makes the target teleport.
 *
 * our_plant - our plant, being squashed, and teleporting the target
 * target - the atom targeted by the squash
 */
/datum/plant_gene/trait/teleport/proc/squash_teleport(obj/item/our_plant, atom/target)
	SIGNAL_HANDLER

	if(!isliving(target))
		return

	our_plant.investigate_log("squash-teleported [key_name(target)] at [AREACOORD(target)]. Last touched by: [our_plant.fingerprintslast].", INVESTIGATE_BOTANY)
	var/obj/item/seeds/our_seed = our_plant.get_plant_seed()
	var/teleport_radius = max(round(our_seed.potency / 10), 1)
	var/turf/T = get_turf(target)
	new /obj/effect/decal/cleanable/molten_object(T) //Leave a pile of goo behind for dramatic effect...
	do_teleport(target, T, teleport_radius, channel = TELEPORT_CHANNEL_BLUESPACE)

/*
 * When slipped on, makes the target teleport and either teleport the source again or delete it.
 *
 * our_plant - our plant being slipped on
 * target - the carbon targeted that was slipped and was teleported
 */
/datum/plant_gene/trait/teleport/proc/slip_teleport(obj/item/our_plant, mob/living/carbon/target)
	SIGNAL_HANDLER

	our_plant.investigate_log("slip-teleported [key_name(target)] at [AREACOORD(target)]. Last touched by: [our_plant.fingerprintslast].", INVESTIGATE_BOTANY)
	var/obj/item/seeds/our_seed = our_plant.get_plant_seed()
	var/teleport_radius = max(round(our_seed.potency / 10), 1)
	var/turf/T = get_turf(target)
	to_chat(target, SPAN_WARNING("You slip through spacetime!"))
	do_teleport(target, T, teleport_radius, channel = TELEPORT_CHANNEL_BLUESPACE)
	if(prob(50))
		do_teleport(our_plant, T, teleport_radius, channel = TELEPORT_CHANNEL_BLUESPACE)
	else
		new /obj/effect/decal/cleanable/molten_object(T) //Leave a pile of goo behind for dramatic effect...
		qdel(our_plant)

/**
 * A plant trait that causes the plant's capacity to double.
 *
 * When harvested, the plant's individual capacity is set to double it's default.
 * However, the plant's maximum yield is also halved, only up to 5.
 */
/datum/plant_gene/trait/maxchem
	name = "Densified Chemicals"
	rate = 2
	trait_flags = TRAIT_HALVES_YIELD
	mutability_flags = PLANT_GENE_REMOVABLE | PLANT_GENE_MUTATABLE | PLANT_GENE_GRAFTABLE

/datum/plant_gene/trait/maxchem/on_new_plant(obj/item/our_plant, newloc)
	. = ..()
	if(!.)
		return

	var/obj/item/food/grown/grown_plant = our_plant
	if(istype(grown_plant, /obj/item/food/grown))
		//Grown foods use the edible component so we need to change their max_volume var
		grown_plant.max_volume *= rate
	else
		//Grown inedibles however just use a reagents holder, so.
		our_plant.reagents?.maximum_volume *= rate

/// Allows a plant to be harvested multiple times.
/datum/plant_gene/trait/repeated_harvest
	name = "Perennial Growth"
	mutability_flags = PLANT_GENE_REMOVABLE | PLANT_GENE_MUTATABLE | PLANT_GENE_GRAFTABLE

/*
 * Injects a number of chemicals from the plant when you throw it at someone or they slip on it.
 * At 0 potency it can inject 1 unit of its chemicals, while at 100 potency it can inject 20 units.
 */
/datum/plant_gene/trait/stinging
	name = "Hypodermic Prickles"
	examine_line = SPAN_INFO("It's quite prickley.")
	trait_ids = REAGENT_TRANSFER_ID
	mutability_flags = PLANT_GENE_REMOVABLE | PLANT_GENE_MUTATABLE | PLANT_GENE_GRAFTABLE

/datum/plant_gene/trait/stinging/on_new_plant(obj/item/our_plant, newloc)
	. = ..()
	if(!.)
		return

	RegisterSignal(our_plant, COMSIG_PLANT_ON_SLIP, .proc/prickles_inject)
	RegisterSignal(our_plant, COMSIG_MOVABLE_IMPACT, .proc/prickles_inject)

/*
 * Injects a target with a number of reagents from our plant.
 *
 * our_plant - our plant that's injecting someone
 * target - the atom being hit on thrown or slipping on our plant
 */
/datum/plant_gene/trait/stinging/proc/prickles_inject(obj/item/our_plant, atom/target)
	SIGNAL_HANDLER

	if(!isliving(target) || !our_plant.reagents?.total_volume)
		return

	var/mob/living/living_target = target
	var/obj/item/seeds/our_seed = our_plant.get_plant_seed()
	if(living_target.reagents && living_target.can_inject())
		var/injecting_amount = max(1, our_seed.potency * 0.2) // Minimum of 1, max of 20
		our_plant.reagents.trans_to(living_target, injecting_amount, methods = INJECT)
		to_chat(target, SPAN_DANGER("You are pricked by [our_plant]!"))
		log_combat(our_plant, living_target, "pricked and attempted to inject reagents from [our_plant] to [living_target]. Last touched by: [our_plant.fingerprintslast].")
		our_plant.investigate_log("pricked and injected [key_name(living_target)] and injected [injecting_amount] reagents at [AREACOORD(living_target)]. Last touched by: [our_plant.fingerprintslast].", INVESTIGATE_BOTANY)

/// Explodes into reagent-filled smoke when squashed.
/datum/plant_gene/trait/smoke
	name = "Gaseous Decomposition"
	mutability_flags = PLANT_GENE_REMOVABLE | PLANT_GENE_MUTATABLE | PLANT_GENE_GRAFTABLE

/datum/plant_gene/trait/smoke/on_new_plant(obj/item/our_plant, newloc)
	. = ..()
	if(!.)
		return

	RegisterSignal(our_plant, COMSIG_PLANT_ON_SQUASH, .proc/make_smoke)

/*
 * Makes a cloud of reagent smoke.
 *
 * our_plant - our plant being squashed and smoked
 * target - the atom the plant was squashed on
 */
/datum/plant_gene/trait/smoke/proc/make_smoke(obj/item/our_plant, atom/target)
	SIGNAL_HANDLER

	our_plant.investigate_log("made smoke at [AREACOORD(target)]. Last touched by: [our_plant.fingerprintslast].", INVESTIGATE_BOTANY)
	var/datum/effect_system/smoke_spread/chem/smoke = new ()
	var/obj/item/seeds/our_seed = our_plant.get_plant_seed()
	var/splat_location = get_turf(target)
	var/smoke_amount = round(sqrt(our_seed.potency * 0.1), 1)
	smoke.attach(splat_location)
	smoke.set_up(our_plant.reagents, smoke_amount, splat_location, 0)
	smoke.start()
	our_plant.reagents.clear_reagents()

/// Makes the plant and its seeds fireproof. From lavaland plants.
/datum/plant_gene/trait/fire_resistance
	name = "Fire Resistance"
	mutability_flags = PLANT_GENE_REMOVABLE | PLANT_GENE_MUTATABLE | PLANT_GENE_GRAFTABLE

/datum/plant_gene/trait/fire_resistance/on_new_seed(obj/item/seeds/new_seed)
	if(!(new_seed.resistance_flags & FIRE_PROOF))
		new_seed.resistance_flags |= FIRE_PROOF

/datum/plant_gene/trait/fire_resistance/on_new_plant(obj/item/our_plant, newloc)
	. = ..()
	if(!.)
		return

	if(!(our_plant.resistance_flags & FIRE_PROOF))
		our_plant.resistance_flags |= FIRE_PROOF

/// Invasive spreading lets the plant jump to other trays, and the spreading plant won't replace plants of the same type.
/datum/plant_gene/trait/invasive
	name = "Invasive Spreading"
	mutability_flags = PLANT_GENE_REMOVABLE | PLANT_GENE_MUTATABLE | PLANT_GENE_GRAFTABLE

/datum/plant_gene/trait/invasive/on_new_seed(obj/item/seeds/new_seed)
	. = ..()
	if(!.)
		return FALSE

	return TRUE
/*
 * Attempt to find an adjacent tray we can spread to.
 *
 * our_seed - our plant's seed, what spreads to other trays
 * our_tray - the hydroponics tray we're currently in
 */

/**
 * A plant trait that causes the plant's food reagents to ferment instead.
 *
 * In practice, it replaces the plant's nutriment and vitamins with half as much of it's fermented reagent.
 * This exception is executed in seeds.dm under 'prepare_result'.
 *
 * Incompatible with auto-juicing composition.
 */
/datum/plant_gene/trait/brewing
	name = "Auto-Distilling Composition"
	trait_ids = CONTENTS_CHANGE_ID
	mutability_flags = PLANT_GENE_REMOVABLE | PLANT_GENE_MUTATABLE | PLANT_GENE_GRAFTABLE

/**
 * Similar to auto-distilling, but instead of brewing the plant's contents it juices it.
 *
 * Incompatible with auto-distilling composition.
 */
/datum/plant_gene/trait/juicing
	name = "Auto-Juicing Composition"
	trait_ids = CONTENTS_CHANGE_ID
	mutability_flags = PLANT_GENE_REMOVABLE | PLANT_GENE_MUTATABLE | PLANT_GENE_GRAFTABLE

/**
 * Plays a laughter sound when someone slips on it.
 * Like the sitcom component but for plants.
 * Just like slippery skin, if we have a trash type this only functions on that. (Banana peels)
 */
/datum/plant_gene/trait/plant_laughter
	name = "Hallucinatory Feedback"
	mutability_flags = PLANT_GENE_REMOVABLE | PLANT_GENE_MUTATABLE | PLANT_GENE_GRAFTABLE
	/// Sounds that play when this trait triggers
	var/list/sounds = list('sound/items/SitcomLaugh1.ogg', 'sound/items/SitcomLaugh2.ogg', 'sound/items/SitcomLaugh3.ogg')

/datum/plant_gene/trait/plant_laughter/on_new_plant(obj/item/our_plant, newloc)
	. = ..()
	if(!.)
		return

	var/obj/item/food/grown/grown_plant = our_plant
	if(istype(grown_plant) && ispath(grown_plant.trash_type, /obj/item/grown))
		return

	RegisterSignal(our_plant, COMSIG_PLANT_ON_SLIP, .proc/laughter)

/*
 * Play a sound effect from our plant.
 *
 * our_plant - the source plant that was slipped on
 * target - the atom that slipped on the plant
 */
/datum/plant_gene/trait/plant_laughter/proc/laughter(obj/item/our_plant, atom/target)
	SIGNAL_HANDLER

	our_plant.audible_message(SPAN_NOTICE("[our_plant] lets out burst of laughter."))
	playsound(our_plant, pick(sounds), 100, FALSE, SHORT_RANGE_SOUND_EXTRARANGE)

/**
 * A plant trait that causes the plant to gain aesthetic googly eyes.
 *
 * Has no functional purpose outside of causing japes, adds eyes over the plant's sprite, which are adjusted for size by potency.
 */
/datum/plant_gene/trait/eyes
	name = "Oculary Mimicry"
	mutability_flags = PLANT_GENE_REMOVABLE | PLANT_GENE_MUTATABLE | PLANT_GENE_GRAFTABLE
	/// Our googly eyes appearance.
	var/mutable_appearance/googly

/datum/plant_gene/trait/eyes/on_new_plant(obj/item/our_plant, newloc)
	. = ..()
	if(!.)
		return

	googly = mutable_appearance('icons/obj/hydroponics/harvest.dmi', "eyes")
	googly.appearance_flags = RESET_COLOR
	our_plant.add_overlay(googly)

/// Makes the plant embed on thrown impact.
/datum/plant_gene/trait/sticky
	name = "Prickly Adhesion"
	examine_line = SPAN_INFO("It's quite sticky.")
	trait_ids = THROW_IMPACT_ID
	mutability_flags = PLANT_GENE_REMOVABLE | PLANT_GENE_MUTATABLE | PLANT_GENE_GRAFTABLE

/datum/plant_gene/trait/sticky/on_new_plant(obj/item/our_plant, newloc)
	. = ..()
	if(!.)
		return

	var/obj/item/seeds/our_seed = our_plant.get_plant_seed()
	if(our_seed.get_gene(/datum/plant_gene/trait/stinging))
		our_plant.embedding = EMBED_POINTY
	else
		our_plant.embedding = EMBED_HARMLESS
	our_plant.updateEmbedding()
	our_plant.throwforce = (our_seed.potency/20)

/**
 * This trait automatically heats up the plant's chemical contents when harvested.
 * This requires nutriment to fuel. 1u nutriment = 25 K.
 */
/datum/plant_gene/trait/chem_heating
	name = "Exothermic Activity"
	trait_ids = TEMP_CHANGE_ID
	trait_flags = TRAIT_HALVES_YIELD
	mutability_flags = PLANT_GENE_REMOVABLE | PLANT_GENE_MUTATABLE | PLANT_GENE_GRAFTABLE

/**
 * This trait is the opposite of above - it cools down the plant's chemical contents on harvest.
 * This requires nutriment to fuel. 1u nutriment = -5 K.
 */
/datum/plant_gene/trait/chem_cooling
	name = "Endothermic Activity"
	trait_ids = TEMP_CHANGE_ID
	trait_flags = TRAIT_HALVES_YIELD
	mutability_flags = PLANT_GENE_REMOVABLE | PLANT_GENE_MUTATABLE | PLANT_GENE_GRAFTABLE

/// Plant type traits. Incompatible with one another.
/datum/plant_gene/trait/plant_type
	name = "you shouldn't see this"
	trait_ids = PLANT_TYPE_ID
	mutability_flags = PLANT_GENE_GRAFTABLE

/// Weeds don't get annoyed by weeds in their tray.
/datum/plant_gene/trait/plant_type/weed_hardy
	name = "Weed Adaptation"

/// Mushrooms need less light and have a minimum yield.
/datum/plant_gene/trait/plant_type/fungal_metabolism
	name = "Fungal Vitality"

/// Currently unused and does nothing. Appears in strange seeds.
/datum/plant_gene/trait/plant_type/alien_properties
	name ="?????"

/// Plant doesn't get annoyed by pests in their tray.
/datum/plant_gene/trait/plant_type/carnivory
	name = "Obligate Carnivory"
