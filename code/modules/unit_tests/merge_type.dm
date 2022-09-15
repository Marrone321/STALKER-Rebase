/datum/unit_test/merge_type/Run()
	var/list/blacklist = list(/obj/item/stack/sheet,
							  /obj/item/stack/sheet,
							  /obj/item/stack/ore,
							  )

	var/list/paths = subtypesof(/obj/item/stack) - blacklist

	for(var/stackpath in paths)
		if(is_abstract(stackpath))
			continue
		var/obj/item/stack/stack = stackpath
		if(!initial(stack.merge_type))
			Fail("([stack]) lacks set merge_type variable!")
