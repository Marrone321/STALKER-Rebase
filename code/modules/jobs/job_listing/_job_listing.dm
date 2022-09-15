/datum/job_listing
	var/name
	var/desc
	var/datum/job/overflow_role_job
	var/overflow_role
	/// List of all departments with joinable jobs.
	var/list/datum/job_department/joinable_departments = list()
	/// List of all joinable departments indexed by their typepath, sorted by their own display order.
	var/list/datum/job_department/joinable_departments_by_type = list()
	/// List of jobs that can be joined through the starting menu.
	var/list/datum/job/joinable_occupations = list()
	/// List of jobs that can be joined through the starting menu, associative by type.
	var/list/datum/job/joinable_occupations_by_type = list()
	/// List of all the job types that should be initialzied for this listing
	var/list/jobs = list()
	/// Landmarks for latejoining
	var/list/latejoin_landmarks = list()
	/// Landmarks for starting points
	var/list/start_landmarks = list()
	var/list/job_start_landmarks = list()
	var/list/job_latejoin_landmarks = list()
	/// Whether the job listing will be started and its occupations divided on the start of the round
	var/setup_on_roundstart = TRUE

/datum/job_listing/New()
	. = ..()
	SetupOccupations()
	SetOverflowRole(overflow_role_job)

/datum/job_listing/proc/GetJobType(passed_type)
	return joinable_occupations_by_type[passed_type]

/datum/job_listing/proc/SetupOccupations()
	var/list/new_joinable_occupations = list()
	var/list/new_joinable_departments = list()
	var/list/new_joinable_departments_by_type = list()
	for(var/iterated_type in jobs)
		var/datum/job/job = new iterated_type(src)
		new_joinable_occupations += job
		joinable_occupations_by_type[iterated_type] = job
		if(!LAZYLEN(job.departments_list))
			var/datum/job_department/department = new_joinable_departments_by_type[/datum/job_department/undefined]
			if(!department)
				department = new /datum/job_department/undefined()
				new_joinable_departments_by_type[/datum/job_department/undefined] = department
			department.add_job(job)
			continue
		for(var/department_type in job.departments_list)
			var/datum/job_department/department = new_joinable_departments_by_type[department_type]
			if(!department)
				department = new department_type()
				new_joinable_departments_by_type[department_type] = department
			department.add_job(job)
	sortTim(new_joinable_departments_by_type, /proc/cmp_department_display_asc, associative = TRUE)
	for(var/department_type in new_joinable_departments_by_type)
		var/datum/job_department/department = new_joinable_departments_by_type[department_type]
		sortTim(department.department_jobs, /proc/cmp_job_display_asc)
		new_joinable_departments += department
	joinable_occupations = sortTim(new_joinable_occupations, /proc/cmp_job_display_asc)
	joinable_departments = new_joinable_departments
	joinable_departments_by_type = new_joinable_departments_by_type

/datum/job_listing/proc/SetOverflowRole(new_overflow_role_type)
	if(new_overflow_role_type == null)
		overflow_role = null
		return
	var/datum/job/new_overflow_role = GetJobType(new_overflow_role_type)
	if(!new_overflow_role)
		return
	var/cap = CONFIG_GET(number/overflow_cap)

	new_overflow_role.allow_bureaucratic_error = FALSE
	new_overflow_role.spawn_positions = cap
	new_overflow_role.total_positions = cap

	if(new_overflow_role == overflow_role_job)
		return
	var/datum/job/old_overflow = GetJobType(overflow_role)
	old_overflow.allow_bureaucratic_error = initial(old_overflow.allow_bureaucratic_error)
	old_overflow.spawn_positions = initial(old_overflow.spawn_positions)
	old_overflow.total_positions = initial(old_overflow.total_positions)
	overflow_role_job = new_overflow_role
	overflow_role = new_overflow_role_type

/datum/job_listing/proc/get_department_type(department_type)
	return joinable_departments_by_type[department_type]

/datum/job_listing/army
	name = "State Security Service"
	desc = "The State Security Services, often referred to as the Military or the Army, are Ukrainian soldiers that have been sent into the Zone by the Ukrainian government to maintain security along the borders of the Zone, in order to prevent unauthorized incursions by Stalkers, and by extension, distribution of artifacts to the outside world without government supervision."
	jobs = list(
		/datum/job/army,
		)

/datum/job_listing/bandit
	name = "Bandits"
	desc = "Bandits are a group of mostly ex-criminals who came in the Zone either to escape from the law, trade weapons or make money. They are a force of chaos within the Zone, and are essentially bad people who do bad things to good people."
	jobs = list(
		/datum/job/bandit,
		)

/datum/job_listing/clearsky
	name = "Clear Sky"
	desc = "The Clear Sky faction is an independent scientific/military organization focusing on understanding the Zone."
	jobs = list(
		/datum/job/clearsky,
		)

/datum/job_listing/duty
	name = "Duty"
	desc = "Duty is a paramilitary clan of stalkers operating in the Zone with members living according to a code. Their ranks are composed of ex-military and stalkers who wish to bring order to the Zone and keep it from spreading further. They are contrasted by other factions, such as Freedom or the Ecologists, who see the Zone as a miracle. Its members consider protecting the outside world from the Zone's dangers their primary objective."
	jobs = list(
		/datum/job/duty,
		)

/datum/job_listing/ecologist
	name = "Ecologists"
	desc = "Ecologists are a group focusing on researching the Zone, in order to properly harness its potential for the good of mankind. They are largely pacifist when it comes to human conflict, and rely on other factions to offer protection when it comes to embarking on missions into the zone. Your job is to research the wonders of these strange lands and to report your discoveries, and coordinate with those around you to make it all happen."
	jobs = list(
		/datum/job/ecologist,
		)

/datum/job_listing/freedom
	name = "Freedom"
	desc = "Freedom are anarchists and daredevils who declare themselves fighters for a free access to the Zone and consequently find themselves in constant conflict with the army, military stalkers and the Duty faction. These so-called freedom warriors believe in sharing all information about the Zone with the rest of the world and challenge the state's monopoly over the Zone's secrets and wonders."
	jobs = list(
		/datum/job/freedom,
		)

/datum/job_listing/mercenary
	name = "Mercenaries"
	desc = "Mercenaries are experienced fighters from all walks of life who offer their services as hired soldiers. They are perhaps ex-military soldiers, ex-special forces operators, or possibly underground fighters such as elite resistance/guerrilla troops, a private military company or notorious terrorists of various nations who offer their services to the highest bidder. Because mercenaries have no established code of ethics to abide to, each mercenary group's sense of morality could be quite different from another."
	jobs = list(
		/datum/job/mercenary,
		)

/datum/job_listing/monolith
	name = "Monolith"
	desc = ""
	jobs = list(
		/datum/job/monolith,
		)

/datum/job_listing/renegade
	name = "Renegades"
	desc = "Renegades are bandits that decided to leave the bandit faction. Most stalkers consider renegades a joke due to their lack of equipment and poor leadership."
	jobs = list(
		/datum/job/renegade,
		)

/datum/job_listing/stalker
	name = "Loners"
	desc = "The Loners are those who aren't part of any faction and inhabit the Zone as nomadic, independent stalkers. Even though they are not a proper faction of their own as per se, they often look out for eachother and are friendly with eachother in order to cohabitate the Zone."
	jobs = list(
		/datum/job/stalker,
		)
