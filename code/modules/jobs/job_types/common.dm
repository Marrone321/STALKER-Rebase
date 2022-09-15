/datum/job/army
	title = "Military Soldier"
	total_positions = -1
	spawn_positions = -1
	supervisors = "Military Commander"
	selection_color = "#2E8B57"
	exp_granted_type = EXP_TYPE_CREW
	outfit = /datum/outfit/job/army
	display_order = JOB_DISPLAY_ORDER_ASSISTANT
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS

/datum/outfit/job/army
	name = "Military Soldier"
	head = null
	ears = null
/*	belt = /obj/item/kitchen/knife/tourist
	gloves = /obj/item/clothing/gloves/fingerless
	id = /obj/item/stalker_pda
	back = /obj/item/storage/backpack/stalker/tourist
	suit_store = /obj/item/gun/ballistic/automatic/aksu74
	shoes = /obj/item/clothing/shoes/jackboots/warm
	backpack_contents = list(/obj/item/ammo_box/stalker/b545 = 1,
							/obj/item/ammo_box/magazine/stalker/m545 = 2,
							/obj/item/storage/firstaid/stalker/military = 1)
	l_pocket = /obj/item/storage/wallet/stalker
	r_pocket = /obj/item/radio*/

/datum/job/bandit
	title = "Bandit"
	total_positions = -1
	spawn_positions = -1
	supervisors = "Bandit Boss or Bandit Barman"
	selection_color = "#000000"
	exp_granted_type = EXP_TYPE_CREW
	outfit =  /datum/outfit/job/bandit
	display_order = JOB_DISPLAY_ORDER_ASSISTANT
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS

/datum/outfit/job/bandit
	name = "Bandit"
/*	suit = /obj/item/clothing/suit/hooded/kozhanka/banditka
	ears = null
	mask = pick(
		/obj/item/clothing/mask/cigarette/cigar/cohiba,
		/obj/item/clothing/mask/bandana/skull,
		/obj/item/clothing/mask/cigarette/rollie/cannabis,
		/obj/item/clothing/mask/bandana/black,
		/obj/item/clothing/mask/pig,
		/obj/item/clothing/mask/balaclava)
	id = /obj/item/stalker_pda
	belt = pick(
		/obj/item/kitchen/knife/tourist,
		/obj/item/kitchen/knife/butcher,
		/obj/item/crowbar/large)
	gloves = /obj/item/clothing/gloves/fingerless
	shoes = /obj/item/clothing/shoes/jackboots/warm
	backpack_contents = list(/obj/item/reagent_containers/food/snacks/stalker/konserva/shproti,/obj/item/storage/firstaid/stalker/civillian,/obj/item/flashlight/lantern,/obj/item/clothing/accessory/patch/bandits)
	r_pocket = pick(
		/obj/item/gun/ballistic/automatic/pistol/pm,
		/obj/item/gun/ballistic/automatic/pistol/pb1s)
	l_pocket = /obj/item/storage/wallet/stalker*/

/datum/job/clearsky
	title = "Clear Sky Soldier"
	total_positions = -1
	spawn_positions = -1
	supervisors = "Leader"
	selection_color = "#64B2F7"
	exp_granted_type = EXP_TYPE_CREW
	outfit = /datum/outfit/job/clearsky
	display_order = JOB_DISPLAY_ORDER_ASSISTANT
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS

/datum/outfit/job/clearsky
	name = "Clear Sky Soldier"
	ears = null
/*	belt = /obj/item/kitchen/knife/bayonet
	id = /obj/item/stalker_pda
	suit_store = /obj/item/gun/ballistic/automatic/kiparis
	backpack_contents = list(/obj/item/ammo_box/magazine/stalker/kiparis = 2,/obj/item/reagent_containers/food/snacks/stalker/konserva/fish,/obj/item/storage/firstaid/stalker/civillian,/obj/item/clothing/accessory/patch/clearsky)
	l_pocket = /obj/item/storage/wallet/stalker
	r_pocket = pick(
		/obj/item/flashlight/flare,
		/obj/item/lighter/greyscale,
		/obj/item/clothing/mask/cigarette/marlboro,
		/obj/item/storage/box/matches)*/

/datum/job/duty
	title = "Duty Soldier"
	total_positions = -1
	spawn_positions = -1
	supervisors = "Lieutenant"
	selection_color = "#601919"
	exp_granted_type = EXP_TYPE_CREW
	outfit = /datum/outfit/job/duty
	display_order = JOB_DISPLAY_ORDER_ASSISTANT
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS

/datum/outfit/job/duty
	name = "Duty"
/*	head = null
	suit = /obj/item/clothing/suit/hooded/kombez/ps5m
	ears = null
	belt = /obj/item/kitchen/knife/tourist
	gloves = /obj/item/clothing/gloves/fingerless
	id = /obj/item/stalker_pda
	back = /obj/item/storage/backpack/stalker/tourist
	suit_store = /obj/item/gun/ballistic/automatic/aksu74
	shoes = /obj/item/clothing/shoes/jackboots/warm
	backpack_contents = list(/obj/item/ammo_box/stalker/b545 = 1,
							/obj/item/ammo_box/magazine/stalker/m545 = 2,)*/

/datum/job/ecologist
	title = "Ecologist"
	total_positions = -1
	spawn_positions = -1
	supervisors = "Chief Ecologist"
	selection_color = "#601919"
	exp_granted_type = EXP_TYPE_CREW
	outfit = /datum/outfit/job/ecologist
	display_order = JOB_DISPLAY_ORDER_ASSISTANT
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS

/datum/outfit/job/ecologist
	name = "Ecologist"
	head = null
/*	uniform = /obj/item/clothing/under/lawyer/blacksuit
	suit = /obj/item/clothing/suit/hooded/sealed/ecolog
	shoes = /obj/item/clothing/shoes/laceup
	gloves = /obj/item/clothing/gloves/color/black
	id = /obj/item/stalker_pda
	belt = /obj/item/storage/belt/stalker/artifact_belt/small
	back = /obj/item/storage/backpack/stalker/tourist
	l_pocket = /obj/item/storage/wallet/stalker
	r_pocket = /obj/item/radio/off
	suit_store = null
	backpack_contents = list(/obj/item/detector/blink = 1,
							/obj/item/geiger_counter = 1,
							/obj/item/storage/firstaid/stalker/scientific = 1,
							/obj/item/weapon/kitchen/knife/hunting = 1,
							/obj/item/gun/ballistic/automatic/pistol/fort12 = 1,
							/obj/item/ammo_box/magazine/stalker/m9x18fort = 2,
							/obj/item/clothing/accessory/patch/ecologists = 1)*/

/datum/job/freedom
	title = "Freedom"
	total_positions = -1
	spawn_positions = -1
	supervisors = "absolutely everyone"
	selection_color = "#408151"
	exp_granted_type = EXP_TYPE_CREW
	outfit = /datum/outfit/job/freedom
	display_order = JOB_DISPLAY_ORDER_ASSISTANT
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS

/datum/outfit/job/freedom
	name = "Freedom"
/*	head = pick(
		/obj/item/grown/sunflower,
		/obj/item/clothing/head/ushanka)
	uniform = UNIFORMPICK
	suit = /obj/item/clothing/suit/hooded/kombez/veter
	mask = pick(
		/obj/item/clothing/mask/cigarette/rollie/cannabis,
		/obj/item/clothing/mask/gas,
		/obj/item/clothing/mask/bandana/green)
	ears = null
	belt = /obj/item/kitchen/knife/bayonet
	gloves = /obj/item/clothing/gloves/fingerless
	id = /obj/item/stalker_pda
	back = /obj/item/storage/backpack/stalker/civilian
	suit_store = /obj/item/gun/ballistic/automatic/aksu74
	shoes = /obj/item/clothing/shoes/jackboots/warm
	backpack_contents = list(/obj/item/ammo_box/magazine/stalker/m545 = 2,/obj/item/reagent_containers/food/snacks/stalker/baton,/obj/item/storage/firstaid/stalker/civillian,/obj/item/clothing/accessory/patch/freedom)
	l_pocket = /obj/item/storage/wallet/stalker
	r_pocket = pick(
		/obj/item/flashlight/flare,
		/obj/item/clothing/mask/cigarette/rollie/cannabis
		/obj/item/lighter/greyscale,
	/obj/item/storage/box/matches,)*/

/datum/job/mercenary
	title = "Mercenary"
	total_positions = -1
	spawn_positions = -1
	supervisors = "Mercenary Commander"
	selection_color = "#2e708b"
	exp_granted_type = EXP_TYPE_CREW
	outfit = /datum/outfit/job/mercenary
	display_order = JOB_DISPLAY_ORDER_ASSISTANT
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS

/datum/outfit/job/mercenary
	name = "Mercenary"
/*	uniform = UNIFORMPICK
	suit = /obj/item/clothing/suit/hooded/kombez/mercenary
	mask = /obj/item/clothing/mask/gas/stalker/mercenary
	suit_store = /obj/item/gun/ballistic/automatic/mp5
	belt = pick(
		/obj/item/kitchen/knife/bayonet,
		/obj/item/melee/classic_baton)
	backpack_contents = list(
		/obj/item/ammo_box/magazine/stalker/m9x19mp5 = 2,
		/obj/item/storage/firstaid/stalker/military = 1,
		/obj/item/flashlight/seclite = 1,
		/obj/item/restraints/handcuffs/cable/zipties,
		/obj/item/clothing/accessory/patch/mercenaries)
	id = /obj/item/stalker_pda
	shoes = /obj/item/clothing/shoes/jackboots/warm
	l_pocket = /obj/item/storage/wallet/stalker
	r_pocket = pick(
	/obj/item/restraints/handcuffs,
	/obj/item/camera,
	/obj/item/reagent_containers/food/drinks/flask/russian,
	/obj/item/dice/d6,
	/obj/item/clipboard,
	/obj/item/storage/fancy/cigarettes/cigpack_java,
	/obj/item/lighter/greyscale,
	/obj/item/toy/cards/deck)*/

/datum/job/monolith
	title = "Monolith"
	total_positions = 5
	spawn_positions = 5
	supervisors = "Monolith Preacher"
	selection_color = "#601919"
	exp_granted_type = EXP_TYPE_CREW
	outfit = /datum/outfit/job/monolith
	display_order = JOB_DISPLAY_ORDER_ASSISTANT
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS

/datum/outfit/job/monolith
	name = "Monolith"
	uniform = /obj/item/clothing/under/commoner
	head = /obj/item/clothing/head/bandana
	shoes = /obj/item/clothing/shoes/leather
	l_pocket = /obj/item/storage/pouch/random_commoner
	belt = /obj/item/cutlass
	back = /obj/item/storage/bag

/datum/job/renegade
	title = "Renegade"
	total_positions = 5
	spawn_positions = 5
	selection_color = "#003D06"
	exp_granted_type = EXP_TYPE_CREW
	outfit = /datum/outfit/job/renegade
	display_order = JOB_DISPLAY_ORDER_ASSISTANT
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS

/datum/outfit/job/renegade
	name = "Renegade"
	uniform = /obj/item/clothing/under/commoner
	head = /obj/item/clothing/head/bandana
	shoes = /obj/item/clothing/shoes/leather
	l_pocket = /obj/item/storage/pouch/random_commoner
	belt = /obj/item/cutlass
	back = /obj/item/storage/bag

/datum/job/stalker
	title = "Stalker"
	total_positions = -1
	spawn_positions = -1
	supervisors = "old stalkers at your discretion"
	selection_color = "#dddddd"
	exp_granted_type = EXP_TYPE_CREW
	outfit = /datum/outfit/job/stalker
	display_order = JOB_DISPLAY_ORDER_ASSISTANT
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS

/datum/outfit/job/stalker
	name = "Stalker"
	uniform = /obj/item/clothing/under/commoner
	head = /obj/item/clothing/head/bandana
	shoes = /obj/item/clothing/shoes/leather
	l_pocket = /obj/item/storage/pouch/random_commoner
	belt = /obj/item/cutlass
	back = /obj/item/storage/bag
