//#define LOWMEMORYMODE //uncomment this to load centcom and runtime station and thats it.

#include "map_files\generic\empty.dmm"
#include "map_files/ZonaRemastered/backwater.dmm"
#include "map_files/ZonaRemastered/under.dmm"
#include "map_files/ZonaRemastered/kordon.dmm"
#include "map_files/ZonaRemastered/bar.dmm"
#include "map_files/ZonaRemastered/agroprom.dmm"
#include "map_files/ZonaRemastered/svalka.dmm"
#include "map_files/ZonaRemastered/radar.dmm"
#include "map_files/ZonaRemastered/yantar.dmm"
#include "map_files/ZonaRemastered/ArmyWarehouses.dmm"


#ifndef LOWMEMORYMODE
	#ifdef ALL_MAPS

		#ifdef CIBUILDING
			#include "templates.dm"
		#endif
	#endif
#endif
