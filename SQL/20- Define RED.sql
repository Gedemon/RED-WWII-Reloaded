--------------------------------------------------------------------------------------------
--
-- Specific Rules for R.E.D. WWII edition
--
--------------------------------------------------------------------------------------------

/*
****************************************************************************************************************************
All values used below can be overriden by scenario specific values.
They are defined here to be used as default values for any "blank" scenario.
****************************************************************************************************************************
*/


----------------------------------------------------------------------------------------------------------------------------
-- Default Game Rules
----------------------------------------------------------------------------------------------------------------------------

-- Global
INSERT INTO Defines (Name, Value) VALUES ('EXPERIENCE_INTERCEPTING_UNIT_AIR'		, 1);
INSERT INTO Defines (Name, Value) VALUES ('FORCE_UNIT_SPAWNING_ON_OCCUPIED_PLOT'	, 1);	-- will try to place an unit (Order of Battle initialization, Reinforcement spawning) even if spawning plot is occupied
INSERT INTO Defines (Name, Value) VALUES ('NO_AUTO_NAMING'							, 0);	-- if set to true, units won't be automatically named

INSERT INTO Defines (Name, Value) VALUES ('RETREAT_RATIO'							, 7);	-- health/damage ratio to force retreat (was 5, higher means more retreats)

-- diplomacy
INSERT INTO Defines (Name, Value) VALUES ('LIBERATE_PLOT_CS_BONUS'			, 10);		-- bonus for liberating minor civ territory
INSERT INTO Defines (Name, Value) VALUES ('LIBERATE_MINOR_CITY_BONUS'		, 30);		-- bonus for liberating minor civ city
INSERT INTO Defines (Name, Value) VALUES ('NO_DIPLO_STATEMENT'				, 1);		-- no diplo contact

-- Resources
INSERT INTO Defines (Name, Value) VALUES ('INITIAL_MATERIEL_VALUE'				, 0);		-- Materiel reserve at start
INSERT INTO Defines (Name, Value) VALUES ('INITIAL_PERSONNEL_VALUE'				, 0);		-- Personnel reserve at start
INSERT INTO Defines (Name, Value) VALUES ('INITIAL_OIL_VALUE'					, 5000);	-- Oil reserve at start
INSERT INTO Defines (Name, Value) VALUES ('REINFORCEMENT_RATIO'					, 5);		-- 1 = 100 personnel+materiel needed for 1 HP, 5 = 20 personnel+materiel, 10 = 10 personnel+materiel... MUST be > 0 (see next value)
INSERT INTO Defines (Name, Value) VALUES ('REINFORCEMENT_BASE'					, 20);
INSERT INTO Defines (Name, Value) VALUES ('MAX_HP_HEALED'						, 5);		-- Max number of HP healed each turn
INSERT INTO Defines (Name, Value) VALUES ('RESISTANCE_REINFORCEMENT_PERCENT'	, 0);		-- ratio of reinforcement recieved from cities in resistance
INSERT INTO Defines (Name, Value) VALUES ('OCCUPIED_REINFORCEMENT_PERCENT'		, 15);		-- ratio of reinforcement recieved from occupied cities
INSERT INTO Defines (Name, Value) VALUES ('CAPTURED_REINFORCEMENT_PERCENT'		, 50);		-- ratio of reinforcement recieved from captured cities with Administrative building (non-occupied)
INSERT INTO Defines (Name, Value) VALUES ('FRIEND_REINFORCEMENT_PERCENT'		, 30);		-- ratio of reinforcement recieved from friendly CS
INSERT INTO Defines (Name, Value) VALUES ('ALLY_REINFORCEMENT_PERCENT'			, 60);		-- ratio of reinforcement recieved from allied CS
INSERT INTO Defines (Name, Value) VALUES ('WOUNDED_PERCENT'						, 35);		-- percentage of soldiers out of combat that could be healed
INSERT INTO Defines (Name, Value) VALUES ('HOSPITAL_HEALING_PERCENT'			, 5);		-- percentage of a nation total wounded soldiers an hospital can heal each turn
INSERT INTO Defines (Name, Value) VALUES ('HOSPITAL_MAX_HEALING_PER_TURN'		, 150);		-- max number of soldiers an hospital can heal each turn
INSERT INTO Defines (Name, Value) VALUES ('RADIO_RECRUITING_FACTOR'				, 3);		-- Personnel recruited from radio, relative to city size
INSERT INTO Defines (Name, Value) VALUES ('RADIO_PROPAGANDA_BONUS'				, 50);		-- percentage of additional recruit from radio propaganda in a city
INSERT INTO Defines (Name, Value) VALUES ('WAR_BONDS_PRODUCTION_PERCENT'		, 75);		-- percentage of production + gold converted to materiel when producing war bonds

INSERT INTO Defines (Name, Value) VALUES ('RESOURCE_PRODUCTION_FACTOR'			, 1);		-- each deposit produce (plot:GetNumResource() * RESOURCE_PRODUCTION_FACTOR) number of resource each turn
INSERT INTO Defines (Name, Value) VALUES ('RESOURCE_OIL_LIGHT_RATIONING'		, 2500);	-- when oil reserves are below this value, light rationning is applied
INSERT INTO Defines (Name, Value) VALUES ('RESOURCE_OIL_RATIONING'				, 1000);	-- when oil reserves are below this value, rationning is applied
INSERT INTO Defines (Name, Value) VALUES ('RESOURCE_OIL_HEAVY_RATIONING'		, 500);		-- when oil reserves are below this value, heavy rationning is applied

INSERT INTO Defines (Name, Value) VALUES ('RESOURCE_CONSUMPTION'				, 0);		-- If true, use resources consumption (fuel, ...)
--INSERT INTO Defines (Name, Value) VALUES ('RESOURCE_CONNECTION'					, RESOURCE_ROAD_TO_ANY_CITY);	-- Default connection type (can be overriden by scenario defines)
INSERT INTO Defines (Name, Value) VALUES ('RESOURCE_FROM_FRIENDS'				, 1);		-- If true you get resources from friendly territory (friendly CS or major with open border), else only from your territory

INSERT INTO Defines (Name, Value) VALUES ('UNIT_BLEEDING'						, 1);	-- when true, unit will lose HP each turn when their supply line is cut
INSERT INTO Defines (Name, Value) VALUES ('BLEEDING_PER_TURN'					, 2);

-- Convoy
--INSERT INTO Defines (Name, Value) VALUES ('TRANSPORT_DEFAULT'					, TRANSPORT_MATERIEL);	-- default type (1 = materiel...)
INSERT INTO Defines (Name, Value) VALUES ('TRANSPORT_DEFAULT_REFERENCE'			, 250);					-- default value

-- Senario
INSERT INTO Defines (Name, Value) VALUES ('WAR_MINIMUM_STARTING_TURN'		, 0);	-- can't manually start war before this turn (but forced DOW via SetMajorRelations or SetMinorDOW are possible)
INSERT INTO Defines (Name, Value) VALUES ('PERMANENT_WAR_DECLARATION'		, 1);	-- can't make peace once a war is declared (but forced peace via scenario event is still possible)

INSERT INTO Defines (Name, Value) VALUES ('CAN_BUILD_UNIT_IN_OCCUPIED_CITY' , 0); -- need special building to build unit in occupied cities
INSERT INTO Defines (Name, Value) VALUES ('REVEAL_ALL_CITIES'				, 0); -- cities tiles are always visible for every civs
INSERT INTO Defines (Name, Value) VALUES ('REVEAL_ALL_MAP'					, 0); -- reveal all map for every civs
INSERT INTO Defines (Name, Value) VALUES ('EMBARK_FROM_HARBOR'				, 0); -- allow embarking only from a city with a harbor (and adjacent hexes)

INSERT INTO Defines (Name, Value) VALUES ('ALLOW_SCRIPTED_EVENTS'	, 1); -- allow scripted events like "Fall of France", "Fall of Poland", etc...
INSERT INTO Defines (Name, Value) VALUES ('ALLOW_ALTERNATE_HISTORY' , 1); -- allow declarations of war outside the historic calendar

INSERT INTO Defines (Name, Value) VALUES ('SCENARIO_MATERIEL_PER_TURN'	, 500); -- / ((HANDICAP + 2 ) /2) = materiel for reinforcement bonus each turn
INSERT INTO Defines (Name, Value) VALUES ('SCENARIO_PERSONNEL_PER_TURN' , 350); -- / ((HANDICAP + 2 ) /2) = personnel for reinforcement bonus each turn
INSERT INTO Defines (Name, Value) VALUES ('SCENARIO_OIL_PER_TURN'		, 100); -- / ((HANDICAP + 2 ) /2) = oil for resource bonus each turn

INSERT INTO Defines (Name, Value) VALUES ('SCENARIO_MAX_MATERIEL_BONUS'		, 0);
INSERT INTO Defines (Name, Value) VALUES ('SCENARIO_MAX_OIL_BONUS'			, 5000);
INSERT INTO Defines (Name, Value) VALUES ('SCENARIO_MAX_PERSONNEL_BONUS'	, 0);

INSERT INTO Defines (Name, Value) VALUES ('CLOSE_MINOR_NEUTRAL_CIV_BORDERS' , 1); -- if true will close neutral territories unless for civs which have reached the allied treshold

INSERT INTO Defines (Name, Value) VALUES ('CHECK_FOR_ORPHAN_TILE'		, 1);	-- if true will flip back captured tiles that are not linked to a close city or unit 
INSERT INTO Defines (Name, Value) VALUES ('UNIT_MAX_PLOT_CONTROL_RANGE'	, 6);	-- distance at which an unit can control an enemy orphan plot
INSERT INTO Defines (Name, Value) VALUES ('CITY_MAX_PLOT_CONTROL_RANGE'	, 9);	-- distance at which a city can control an enemy orphan plot

INSERT INTO Defines (Name, Value) VALUES ('NUM_BUILDINGS_IMPORTANT_CITY'	, 1); -- city with at least NUM_BUILDINGS_IMPORTANT_CITY number of buildings are flagged important and won't be on auto-wealth at start

INSERT INTO Defines (Name, Value) VALUES ('USE_TACTICAL_RANGE'	, 0);	-- +3 range to artillery, +6 range to aircraft (to do : make it +6 for light planes, +12 for other)
INSERT INTO Defines (Name, Value) VALUES ('USE_FAST_OCEAN_MOVE' , 1);	-- x2 moves on ocean (all units)
INSERT INTO Defines (Name, Value) VALUES ('USE_FAST_NAVAL_MOVE' , 0);	-- +2 moves on sea (doesn't work with embarked units)

INSERT INTO Defines (Name, Value) VALUES ('MIN_HP_LEFT_BEFORE_ESCAPING_CITY'	, 4);	-- under that value of predicted HP left to a city after a combat that is starting, units will try to escape a city
INSERT INTO Defines (Name, Value) VALUES ('MAX_PERCENT_HP_LOSS_ESCAPE'			, 50);	-- Maximum percentage of remaining HP loss when retreating from a plot.
INSERT INTO Defines (Name, Value) VALUES ('MIN_PERCENT_HP_LOSS_ESCAPE'			, 25);	-- Minimum percentage of remaining HP loss when retreating from a plot.

INSERT INTO Defines (Name, Value) VALUES ('MAX_CITY_BOMBARD_DAMAGE_PERCENT'		, 66);	-- Maximum damage made to cities in percent. 100 means no change from vanilla
INSERT INTO Defines (Name, Value) VALUES ('ALLOW_CITY_IMPROVEMENT_DAMAGE'		, 1);	-- damage done above MAX_CITY_BOMBARD_DAMAGE are converted to damage to nearest improvement

INSERT INTO Defines (Name, Value) VALUES ('IMPROVEMENT_REPAIR_PER_TURN'			, 2);	-- HP restored to improvements each turn
INSERT INTO Defines (Name, Value) VALUES ('IMPROVEMENT_DAMAGED_THRESHOLD'		, 10);
INSERT INTO Defines (Name, Value) VALUES ('IMPROVEMENT_MAX_DAMAGE'				, 20);

-- Resources
INSERT INTO Defines (Name, Value) VALUES ('NO_SUPPLY_LINE_INITIAL_MOVEMENT_LEFT'	, 50); -- percentage of mechanized unit's movement points left when supply lines have just been cut
INSERT INTO Defines (Name, Value) VALUES ('NO_SUPPLY_LINE_MOVEMENT_LEFT'			, 25); -- percentage of mechanized unit's movement points left when supply lines have been cut for more than 1 turn
INSERT INTO Defines (Name, Value) VALUES ('LIGHT_RATIONING_MOVEMENT_LEFT'			, 80); -- percentage of mechanized unit's movement points left when fuel is lightly rationed
INSERT INTO Defines (Name, Value) VALUES ('MEDIUM_RATIONING_MOVEMENT_LEFT'			, 60); -- percentage of mechanized unit's movement points left when fuel is rationed
INSERT INTO Defines (Name, Value) VALUES ('HEAVY_RATIONING_MOVEMENT_LEFT'			, 30); -- percentage of mechanized unit's movement points left when fuel is heavily rationed
INSERT INTO Defines (Name, Value) VALUES ('LIGHT_RATIONING_FUEL_CONSUMPTION'		, 85); -- percentage of total planned consumption used when fuel is lightly rationed
INSERT INTO Defines (Name, Value) VALUES ('MEDIUM_RATIONING_FUEL_CONSUMPTION'		, 65); -- percentage of total planned consumption used when fuel is rationed
INSERT INTO Defines (Name, Value) VALUES ('HEAVY_RATIONING_FUEL_CONSUMPTION'		, 50); -- percentage of total planned consumption used when fuel is heavily rationed

-- not implemented yet
INSERT INTO Defines (Name, Value) VALUES ('ALLOW_CITY_UNIT_DAMAGE'			, 1);	-- damage done above MAX_CITY_BOMBARD_DAMAGE are converted to damage to garisoned unit if any
INSERT INTO Defines (Name, Value) VALUES ('MAX_UNIT_IN_CITY_BOMBARD_DAMAGE' , 50);	-- Maximum damage made to unit garisoned in cities if ALLOW_CITY_UNIT_DAMAGE is true, in percent
INSERT INTO Defines (Name, Value) VALUES ('BEACHHEAD_DAMAGE'				, 0);	-- Amphibious assault on an empty tile owned by enemy civ will cause damage to the landing unit
INSERT INTO Defines (Name, Value) VALUES ('AIRCRAFT_CAP'					, 2);	-- relative to city number, player can build (number_of_cities * AIRCRAFT_CAP) aircrafts
INSERT INTO Defines (Name, Value) VALUES ('LAND_CAP_RATIO'					, 10);	-- relative to territory owned, player can build (number_tiles_owned / LAND_CAP_RATIO) land units
-- / not implemented


----------------------------------------------------------------------------------------------------------------------------
-- AI Rules
----------------------------------------------------------------------------------------------------------------------------

INSERT INTO Defines (Name, Value) VALUES ('RED_AI_HANDICAP'		, 3);		-- handicap value for computer player (specific to R.E.D. function, not linked to vanilla handicap tables)
INSERT INTO Defines (Name, Value) VALUES ('AI_FREE_UNIT_SUPPLY' , 10);		-- maintenance free units for AI players

INSERT INTO Defines (Name, Value) VALUES ('ALLOW_AI_CONTROL'	, 1); -- Allow the use of functions to (try to) control the AI units and build list

INSERT INTO Defines (Name, Value) VALUES ('USE_UNIT_RATIO_FOR_AI'		, 1);	-- Allow limitation of AI military unit using ratio by classes (g_Max_Armor_SubClass_Percent and g_Max_Air_SubClass_Percent must be defined in scenario files)
INSERT INTO Defines (Name, Value) VALUES ('ALLOW_AI_UNITS_LIMIT'		, 0);	-- Allow limitation of max number of AI military unit
INSERT INTO Defines (Name, Value) VALUES ('MAX_AI_UNITS'				, 75);	-- Max number of units for the AI when ALLOW_AI_UNITS_LIMIT = true

INSERT INTO Defines (Name, Value) VALUES ('UNIT_SUPPORT_LIMIT_FOR_AI'	, 0);	-- Allow limitation of max number of AI units based on number of supported units
INSERT INTO Defines (Name, Value) VALUES ('AI_UNIT_SUPPLY_THRESHOLD'	, 10);	-- if UNIT_SUPPORT_LIMIT_FOR_AI is true, AI start disbanding wounded units when close to this threshold

INSERT INTO Defines (Name, Value) VALUES ('AI_MINIMAL_RESERVE'			, 30);	-- | 
INSERT INTO Defines (Name, Value) VALUES ('AI_LAND_MINIMAL_RESERVE'		, 0);	-- | Do not disband units if we have less than this 
INSERT INTO Defines (Name, Value) VALUES ('AI_AIR_MINIMAL_RESERVE'		, 0);	-- | (nil means "not checked")
INSERT INTO Defines (Name, Value) VALUES ('AI_SEA_MINIMAL_RESERVE'		, 0);	-- |

INSERT INTO Defines (Name, Value) VALUES ('AI_USE_RESOURCE_LIMIT'		, 1);	-- the AI won't build units using resources in case of shortage...
INSERT INTO Defines (Name, Value) VALUES ('AI_TURNS_BEFORE_SHORTAGE'	, 15);	-- consider low on a resource if there is a shortage in this number of turn at the current rate
INSERT INTO Defines (Name, Value) VALUES ('AI_UNIT_RESOURCE_LOW'		, 10);	-- Don't build unit consuming more than this number of resource per HP healed if we're low on stock
INSERT INTO Defines (Name, Value) VALUES ('AI_UNIT_RESOURCE_SHORTAGE'	, 2);	-- Don't build unit consuming more than this number of resource per HP healed if we're out of stock

INSERT INTO Defines (Name, Value) VALUES ('TRACK_COMBATS_MAX_TURNS'						, 5); -- Number of previous turns entries keeped in the TrackCombat table
INSERT INTO Defines (Name, Value) VALUES ('DESTROYER_SUB_HUNTING_MAX_TURNS_ATTACK'		, 2); -- Number of previous turns attacks entries destroyers look at for subhunting
INSERT INTO Defines (Name, Value) VALUES ('DESTROYER_SUB_HUNTING_MAX_TURNS_TO_TARGET'	, 3); -- Max turns needed for destroyer to reach last attack plot for subhunting
INSERT INTO Defines (Name, Value) VALUES ('CRUISER_SUB_HUNTING_MAX_TURNS_ATTACK'		, 1); -- Number of previous turns attacks entries cruisers look at for subhunting
INSERT INTO Defines (Name, Value) VALUES ('CRUISER_SUB_HUNTING_MAX_TURNS_TO_TARGET'		, 1); -- Max turns needed for cruiser to reach last attack plot for subhunting
INSERT INTO Defines (Name, Value) VALUES ('INTERCEPTOR_MAX_TURNS_ATTACK'				, 2); -- Number of previous turns attacks entries interceptors look at for rebasing and force interception mission
INSERT INTO Defines (Name, Value) VALUES ('AIRSWEEP_MAX_TURNS_ATTACK'					, 2); -- Number of previous turns attacks entries interceptors look at for airsweep and force interception mission
INSERT INTO Defines (Name, Value) VALUES ('INTERCEPTOR_RATIO_NEEDED'					, 4); --If NumAirAttacks / NumInterceptor > Ratio then we need another interceptor
INSERT INTO Defines (Name, Value) VALUES ('AIRSWEEP_RATIO_NEEDED'						, 2); --If NumInterceptionAttacks / NumAirsweep > Ratio then we need another sweep

INSERT INTO Defines (Name, Value) VALUES ('MIN_HP_LEFT_REBASE_CITY' , 20); -- under that value of HP, air units won't rebase to a city

-- Suicide Attacks Prevention
INSERT INTO Defines (Name, Value) VALUES ('NO_SUICIDE_ATTACK'				, 0);		-- If set to true, try to prevent suicide attacks
INSERT INTO Defines (Name, Value) VALUES ('SUICIDE_DAMAGE_THRESHOLD'		, 8);		-- Above this level of damage let's call it a tentative of suicide, but check the below value too
INSERT INTO Defines (Name, Value) VALUES ('SUICIDE_DIFF_DAMAGE_THRESHOLD'	, 5);		-- Above this difference between damage dealed and damage received, consider that the attack is a large defeat
INSERT INTO Defines (Name, Value) VALUES ('SUICIDE_HP_RATIO'				, 5);		-- Under this ratio between HP left and damage received, call it suicidal 
--
INSERT INTO Defines (Name, Value) VALUES ('NO_AI_EMBARKATION'				, 0);	-- remove AI ability to embark 
INSERT INTO Defines (Name, Value) VALUES ('NO_LAND_UNIT_BUILD_ON_ISLAND'	, 1);	-- prevent the AI to build land units on cities on island when NO_AI_EMBARKATION = true
INSERT INTO Defines (Name, Value) VALUES ('NO_LAND_UNIT_ISLAND_MAX_AREA'	, 10);	-- prevent land units to be build in area under that size when NO_LAND_UNIT_BUILD_ON_ISLAND = true

-- Healing values
INSERT INTO Defines (Name, Value) VALUES ('MIN_HEALTH_PERCENT'			, 35); -- under this health percent, force unit to heal
INSERT INTO Defines (Name, Value) VALUES ('OPTIMAL_HEALTH_PERCENT'		, 40); -- try to heal until reaching this value
INSERT INTO Defines (Name, Value) VALUES ('MIN_AIR_HEALTH_PERCENT'		, 65);
INSERT INTO Defines (Name, Value) VALUES ('OPTIMAL_AIR_HEALTH_PERCENT'	, 75);
INSERT INTO Defines (Name, Value) VALUES ('MIN_SEA_HEALTH_PERCENT'		, 50);
INSERT INTO Defines (Name, Value) VALUES ('OPTIMAL_SEA_HEALTH_PERCENT'	, 65);

-- AI Distances decisions
INSERT INTO Defines (Name, Value) VALUES ('CLOSE_LAND_DISTANCE'			, 8);		-- to do : convert to max turn to reach / unit...
INSERT INTO Defines (Name, Value) VALUES ('CLOSE_SEA_DISTANCE'			, 24);
INSERT INTO Defines (Name, Value) VALUES ('MAX_LANDING_PLOT_DISTANCE'	, 5);		-- consider landing plot reached when disembarking at this distance of the destination