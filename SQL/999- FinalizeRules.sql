--------------------------------------------------------------------------------------------
-- Finalize Rules for R.E.D. WWII edition
-- Loaded AFTER all other modifications.
--------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------
-- Edit tables for values checked in DLL code...
--------------------------------------------------------------------------------------------

/* Unit Max Hit Points */
ALTER TABLE Units ADD COLUMN MaxHP integer DEFAULT '150';

/* Unit Stack value, each unit has a weight, total weight on a plot can't exceed PLOT_UNIT_LIMIT */
ALTER TABLE Units ADD COLUMN StackValue integer DEFAULT '60';

/* Unit Capture Territory */
ALTER TABLE Units ADD COLUMN CanCaptureTerritory integer DEFAULT '1';

/* First strike / counter-fire capabilities (the unit must also have ranged attack capability) */
ALTER TABLE Units ADD COLUMN OffensiveSupportFire integer DEFAULT '0';
ALTER TABLE Units ADD COLUMN DefensiveSupportFire integer DEFAULT '0';
ALTER TABLE Units ADD COLUMN CounterFire integer DEFAULT '0';
ALTER TABLE Units ADD COLUMN CounterFireSameCombatType integer DEFAULT '0';
ALTER TABLE Units ADD COLUMN OnlySupportFire integer DEFAULT '0';
ALTER TABLE Units ADD COLUMN FirePoints integer DEFAULT '0';
ALTER TABLE Units ADD COLUMN ImmuneToCounterFire integer DEFAULT '0';


--------------------------------------------------------------------------------------------
-- Improvements
--------------------------------------------------------------------------------------------

UPDATE Improvements SET DefenseModifier = 20	WHERE Type = 'IMPROVEMENT_MANUFACTORY';
UPDATE Improvements SET DefenseModifier = 25	WHERE Type = 'IMPROVEMENT_CITY_RUINS';
UPDATE Improvements SET DefenseModifier = 30	WHERE Type = 'IMPROVEMENT_TRADING_POST';
UPDATE Improvements SET DefenseModifier = 40	WHERE Type = 'IMPROVEMENT_BUNKER';
UPDATE Improvements SET DefenseModifier = 75	WHERE Type = 'IMPROVEMENT_FORT';
UPDATE Improvements SET DefenseModifier = 100	WHERE Type = 'IMPROVEMENT_CITADEL';

-- test
/*
UPDATE Improvements SET DefenseModifier = 7	WHERE Type = 'IMPROVEMENT_MANUFACTORY';
UPDATE Improvements SET DefenseModifier = 8	WHERE Type = 'IMPROVEMENT_CITY_RUINS';
UPDATE Improvements SET DefenseModifier = 10	WHERE Type = 'IMPROVEMENT_TRADING_POST';
UPDATE Improvements SET DefenseModifier = 13	WHERE Type = 'IMPROVEMENT_BUNKER';
UPDATE Improvements SET DefenseModifier = 25	WHERE Type = 'IMPROVEMENT_FORT';
UPDATE Improvements SET DefenseModifier = 33	WHERE Type = 'IMPROVEMENT_CITADEL';

UPDATE Defines SET Value = 3 WHERE Name = 'HILLS_EXTRA_DEFENSE';
UPDATE Features SET Defense = 8 WHERE Type = 'FEATURE_FOREST';
UPDATE Features SET Defense = 8 WHERE Type = 'FEATURE_JUNGLE';
-- / test */

UPDATE Improvements SET NearbyEnemyDamage = 0	WHERE Type = 'IMPROVEMENT_CITADEL';


UPDATE ArtDefine_Landmarks SET Scale = 0.65*Scale 
	WHERE ResourceType = 'ART_DEF_RESOURCE_ALUMINUM'
		OR ResourceType = 'ART_DEF_RESOURCE_COAL'
		OR ResourceType = 'ART_DEF_RESOURCE_COAL_HEAVY'
		OR ResourceType = 'ART_DEF_RESOURCE_ALUMINUM_HEAVY'
		OR ResourceType = 'ART_DEF_RESOURCE_COAL_HEAVY_MARSH'
		OR ResourceType = 'ART_DEF_RESOURCE_COAL_MARSH'
		OR ResourceType = 'ART_DEF_RESOURCE_IRON'
		OR ResourceType = 'ART_DEF_RESOURCE_IRON_HEAVY'
		OR ResourceType = 'ART_DEF_RESOURCE_IRON_HEAVY_MARSH'
		OR ResourceType = 'ART_DEF_RESOURCE_IRON_MARSH'
		OR ResourceType = 'ART_DEF_RESOURCE_OIL'
		OR ResourceType = 'ART_DEF_RESOURCE_OIL_HEAVY'
		OR ResourceType = 'ART_DEF_RESOURCE_URANIUM_MARSH'
		OR ResourceType = 'ART_DEF_RESOURCE_URANIUM_HEAVY_MARSH'
		OR ResourceType = 'ART_DEF_RESOURCE_URANIUM_HEAVY'
		OR ResourceType = 'ART_DEF_RESOURCE_URANIUM';

UPDATE ArtDefine_Landmarks SET Scale = 0.65*Scale
	WHERE ImprovementType = 'ART_DEF_IMPROVEMENT_MANUFACTORY'
		OR ImprovementType = 'ART_DEF_IMPROVEMENT_QUARRY';

UPDATE ArtDefine_Landmarks SET Scale = 0.85*Scale WHERE ImprovementType = 'ART_DEF_IMPROVEMENT_FORT'; 
UPDATE ArtDefine_Landmarks SET Scale = 0.95*Scale WHERE ImprovementType = 'ART_DEF_IMPROVEMENT_CITADEL';
UPDATE ArtDefine_Landmarks SET Scale = 0.65*Scale WHERE ImprovementType = 'ART_DEF_IMPROVEMENT_BUNKER';

--------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------

-- That's the list of buildings you can construct.
UPDATE Buildings SET Cost = -1
	WHERE Type <> 'BUILDING_WALLS'
	AND Type <> 'BUILDING_FACTORY'
	AND Type <> 'BUILDING_ARSENAL'
	AND Type <> 'BUILDING_HARBOR'
	AND Type <> 'BUILDING_BROADCAST_TOWER'
	AND Type <> 'BUILDING_BARRACKS'
	AND Type <> 'BUILDING_MILITARY_ACADEMY'
	AND Type <> 'BUILDING_MILITARY_BASE'
	AND Type <> 'BUILDING_HOSPITAL'
	AND Type <> 'BUILDING_BANK'
	AND Type <> 'BUILDING_COURTHOUSE'
	AND Type <> 'BUILDING_LAND_FACTORY'
	AND Type <> 'BUILDING_SMALL_AIR_FACTORY'
	AND Type <> 'BUILDING_MEDIUM_AIR_FACTORY'
	AND Type <> 'BUILDING_LARGE_AIR_FACTORY'
	AND Type <> 'BUILDING_SHIPYARD'
	AND Type <> 'BUILDING_SYNTHETIC_FUEL_PLANT'
	AND Type <> 'BUILDING_OIL_REFINERY';


UPDATE Building_Flavors SET Flavor = Flavor * 0.75;	-- Build less buildings...

--------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------
--UPDATE Units SET ProjectPrereq = NULL;			-- We don't need to set projects for units, this is handled by the mod custom function/tables
UPDATE Unit_Flavors SET Flavor = Flavor * 2;	-- Build more units...

--------------------------------------------------------------------------------------------
-- Projects
--------------------------------------------------------------------------------------------
UPDATE Project_Flavors SET Flavor = Flavor * 1.75 WHERE ProjectType LIKE 'PROJECT_%';	-- Project's flavor relative to units...

-- We don't need/want to research thoses...
DELETE FROM Projects
	WHERE TYPE = 'PROJECT_SUBMARINE'
	OR TYPE = 'PROJECT_DESTROYER'
	OR TYPE = 'PROJECT_ATOMIC_BOMB'
	OR TYPE = 'PROJECT_ANTI_AIRCRAFT_GUN'
	OR TYPE = 'PROJECT_FIELD_GUN'
	OR TYPE = 'PROJECT_ARTILLERY'
	OR TYPE = 'PROJECT_INFANTRY'
	OR TYPE = 'PROJECT_PARATROOPER';

--------------------------------------------------------------------------------------------
--	Remap Units and UnitClasses ID (the game will expect them to start at ID = 0, and at this point of the code, the first entry is ID = 1)
--	Code Thanks to lemmy101, Thalassicus, Pazyryk	 
--------------------------------------------------------------------------------------------
-- Units
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Units ORDER by ID;
UPDATE Units SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Units.Type = IDRemapper.Type);
DROP TABLE IDRemapper;

-- UnitClasses
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM UnitClasses ORDER by ID;
UPDATE UnitClasses SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE UnitClasses.Type = IDRemapper.Type);
DROP TABLE IDRemapper;

-- Projects
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Projects ORDER by ID;
UPDATE Projects SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Projects.Type = IDRemapper.Type);
DROP TABLE IDRemapper;

-- Reset ID autoincrement seq to correct value for modmod loaded after this one...
UPDATE sqlite_sequence SET seq = (SELECT COUNT(ID) FROM Units)-1 WHERE name = 'Units';
UPDATE sqlite_sequence SET seq = (SELECT COUNT(ID) FROM UnitClasses)-1 WHERE name = 'UnitClasses';
UPDATE sqlite_sequence SET seq = (SELECT COUNT(ID) FROM Projects)-1 WHERE name = 'Projects';


--------------------------------------------------------------------------------------------
-- Game hidden options checked in DLL code...
--------------------------------------------------------------------------------------------
INSERT INTO GameOptions (Type, "Default", Visible) VALUES ( 'GAMEOPTION_DOUBLE_EMBARKED_DEFENSE_AGAINST_AIR', 1, 0 );	-- double defense strenght of embarked units against air.
INSERT INTO GameOptions (Type, "Default", Visible) VALUES ( 'GAMEOPTION_FREE_PLOTS', 1, 0 );							-- remove city ownership on plots (don't change owner on city capture).
INSERT INTO GameOptions (Type, "Default", Visible) VALUES ( 'GAMEOPTION_NO_MINOR_DIPLO_SPAM', 1, 0 );					-- prevent minor civs to send "please gift units message". (and fix a crash that can occur when the minor try to send the message)
INSERT INTO GameOptions (Type, "Default", Visible) VALUES ( 'GAMEOPTION_CAN_STACK_IN_CITY', 0, 0 );						-- allow unlimited unit stacking in cities.
INSERT INTO GameOptions (Type, "Default", Visible) VALUES ( 'GAMEOPTION_CAN_ENTER_FOREIGN_CITY', 1, 0 );				-- allow units to enter in foreign cities.
INSERT INTO GameOptions (Type, "Default", Visible) VALUES ( 'GAMEOPTION_CIVILIAN_MOVE_THROUGH', 1, 0 );					-- allow civilian to move through other units.
INSERT INTO GameOptions (Type, "Default", Visible) VALUES ( 'GAMEOPTION_NAVAL_MOVE_THROUGH', 1, 0 );					-- allow naval units to move through enemy units
INSERT INTO GameOptions (Type, "Default", Visible) VALUES ( 'GAMEOPTION_REBASE_IN_FRIENDLY_CITY', 1, 0 );				-- allow Aircraft to rebase in friendly cities
INSERT INTO GameOptions (Type, "Default", Visible) VALUES ( 'GAMEOPTION_OFFENSIVE_SUPPORT_FIRE', 1, 0 );				-- ranged units can provide offensive support fire
INSERT INTO GameOptions (Type, "Default", Visible) VALUES ( 'GAMEOPTION_DEFENSIVE_SUPPORT_FIRE', 1, 0 );				-- ranged units can provide defensive support fire
INSERT INTO GameOptions (Type, "Default", Visible) VALUES ( 'GAMEOPTION_COUNTER_FIRE', 1, 0 );							-- ranged units can counter fire
INSERT INTO GameOptions (Type, "Default", Visible) VALUES ( 'GAMEOPTION_GROUPED_DIPLO_AI', 1, 0 );						-- groups all diplo request at the end of the turn
INSERT INTO GameOptions (Type, "Default", Visible) VALUES ( 'GAMEOPTION_MINOR_CAN_ENTER_ALLY_TERRITORY', 1, 0 );		-- CS can send troops on allied territory

--------------------------------------------------------------------------------------------
-- Defines checked in DLL code...
--------------------------------------------------------------------------------------------

/* Each unit has a weight (StackValue), total weight on a plot can't exceed PLOT_UNIT_LIMIT */
UPDATE Defines SET Value = 100		WHERE Name = 'PLOT_UNIT_LIMIT';

/* City Stacking Base Limit (for unit of same type in a domain) 0 = use PLOT_UNIT_LIMIT, -1 = unlimited */
INSERT INTO Defines (Name, Value) VALUES ('CITY_LAND_UNIT_LIMIT', 200);
INSERT INTO Defines (Name, Value) VALUES ('CITY_SEA_UNIT_LIMIT', 200);
INSERT INTO Defines (Name, Value) VALUES ('CITY_AIR_UNIT_LIMIT', 150);

/* Damage Limit */
INSERT INTO Defines (Name, Value) VALUES ('MAX_HP_PERCENT_RECEIVED_DAMAGE', 20);	-- Can't receive more than 20% of (our) Max Hit Points in a combat.
INSERT INTO Defines (Name, Value) VALUES ('MAX_HP_PERCENT_INFLICTED_DAMAGE', 100);	-- Can't inflict more than 100% of (our) Max Hit Points in a combat.

/* Fire Points Action Cost */
INSERT INTO Defines (Name, Value) VALUES ('FIRE_POINTS_OFFENSIVE_STRIKE_COST', 3);
INSERT INTO Defines (Name, Value) VALUES ('FIRE_POINTS_DEFENSIVE_STRIKE_COST', 2);
INSERT INTO Defines (Name, Value) VALUES ('FIRE_POINTS_COUNTER_FIRE_COST', 1);
INSERT INTO Defines (Name, Value) VALUES ('FIRE_POINTS_OPPORTUNITY_FIRE_COST', 1);

/* Fire Support */
INSERT INTO Defines (Name, Value) VALUES ('SUPPORT_FIRE_MAX_REQUEST_RANGE', 0);			-- Distance maximum between an unit requesting support fire and the unit providing support fire. 0 means same plot only.
INSERT INTO Defines (Name, Value) VALUES ('SUPPORT_FIRE_MIN_HEALTH_PERCENT_LEFT', 33);	-- Don't provide Support Fire (including counter-fire) at low health (could be exposed to another unit's counter-fire)
INSERT INTO Defines (Name, Value) VALUES ('SUPPORT_FIRE_CHANCE_BY_HEALTH', 0);			-- (bool) Chance to provide Support Fire is related to health
INSERT INTO Defines (Name, Value) VALUES ('SUPPORT_FIRE_BASE_CHANCE_PERCENT', 100);		-- Base chance to provide Support Fire
INSERT INTO Defines (Name, Value) VALUES ('SUPPORT_FIRE_NO_COUNTER', 1);				-- No Counter-Fire on Support Fire

/* Supply Lines */
INSERT INTO Defines (Name, Value) VALUES ('SUPPLY_TRUCKS_MOVEMENT', 8);					-- Distance before supply Line start losing efficiency, based on the movement cost of the full supply line (1 point = 1 move on flat terrain with no road/railroad/features)
INSERT INTO Defines (Name, Value) VALUES ('SUPPLY_TRUCKS_MINIMAL_EFFICIENCY', 10);		-- minimal % of supply transported when the movement cost of a supply line is superior to the supply trucks movement points.


--------------------------------------------------------------------------------------------
-- Combat & Stacking rules...
--------------------------------------------------------------------------------------------

/* Max Hit Points */
UPDATE Units SET MaxHP = 75 WHERE Domain = 'DOMAIN_AIR';

UPDATE Units SET MaxHP = 200 WHERE Domain = 'DOMAIN_LAND';
UPDATE Units SET MaxHP = 400 WHERE Domain = 'DOMAIN_LAND' AND (Class LIKE '%INFANTRY%') AND NOT (Class LIKE '%TANK%');
UPDATE Units SET MaxHP = 75 WHERE Domain = 'DOMAIN_LAND' AND (Class LIKE '%TANK_DESTROYER%' OR Class LIKE '%ASSAULT_GUN%' OR Class LIKE '%ARTILLERY%' OR Class LIKE '%AA_GUN%' OR Class LIKE '%ANTI_AIRCRAFT_GUN%' OR Class LIKE '%FIELD_GUN%');
UPDATE Units SET MaxHP = 50 WHERE Domain = 'DOMAIN_LAND' AND (Class LIKE '%FORTIFIED_GUN%');
UPDATE Units SET MaxHP = 45 WHERE Domain = 'DOMAIN_LAND' AND (Class LIKE '%HEAVY%');
UPDATE Units SET MaxHP = 10 WHERE Domain = 'DOMAIN_LAND' AND (Class LIKE '%SPECIAL_FORCES%');

UPDATE Units SET MaxHP = 75 WHERE Domain = 'DOMAIN_SEA';

/* Capture territory */
UPDATE Units SET CanCaptureTerritory = 0 WHERE Domain = 'DOMAIN_SEA';
UPDATE Units SET CanCaptureTerritory = 0 WHERE Domain = 'DOMAIN_AIR';
UPDATE Units SET CanCaptureTerritory = 0 WHERE Domain = 'DOMAIN_LAND' AND (Class LIKE '%SPECIAL_FORCES%' OR Class LIKE '%ARTILLERY%' OR Class LIKE '%AA_GUN%' OR Class LIKE '%ANTI_AIRCRAFT_GUN%' OR Class LIKE '%FIELD_GUN%');

/* Combat Limit */
UPDATE Units SET CombatLimit		= 500 WHERE CombatLimit > 0;		-- melee combat limit, if set to 50 this unit can't attack an enemy unit that would have more than 50 damage point after the combat.
UPDATE Units SET RangedCombatLimit	= 500 WHERE RangedCombatLimit > 0;	-- same, for ranged attack.

/* Stack Value */
UPDATE Units SET StackValue = 30 WHERE Domain = 'DOMAIN_AIR';
UPDATE Units SET StackValue = 10 WHERE Domain = 'DOMAIN_AIR' AND (Class LIKE '%FIGHTER%' OR Class LIKE '%ATTACK_AIRCRAFT%' OR Class LIKE '%NAVY_BOMBER%' OR Class LIKE '%TORPEDO_BOMBER%');
UPDATE Units SET StackValue = 20 WHERE Domain = 'DOMAIN_AIR' AND (Class LIKE '%LIGHT_BOMBER%' OR Class LIKE '%NAVY_LIGHT_BOMBER%' OR Class LIKE '%FAST_BOMBER%' OR Class LIKE '%JET_BOMBER%');

UPDATE Units SET StackValue = 60 WHERE Domain = 'DOMAIN_LAND';
UPDATE Units SET StackValue = 30 WHERE Domain = 'DOMAIN_LAND' AND (Class LIKE '%TANK_DESTROYER%' OR Class LIKE '%ASSAULT_GUN%' OR Class LIKE '%ARTILLERY%' OR Class LIKE '%AA_GUN%' OR Class LIKE '%ANTI_AIRCRAFT_GUN%' OR Class LIKE '%FIELD_GUN%');
UPDATE Units SET StackValue = 39 WHERE Domain = 'DOMAIN_LAND' AND (Class LIKE '%HEAVY%');
UPDATE Units SET StackValue = 20 WHERE Domain = 'DOMAIN_LAND' AND (Class LIKE '%SPECIAL_FORCES%');
UPDATE Units SET StackValue = 10 WHERE Domain = 'DOMAIN_LAND' AND (Class LIKE '%FORTIFIED_GUN%');

UPDATE Units SET StackValue = 60 WHERE Domain = 'DOMAIN_SEA';
UPDATE Units SET StackValue = 39 WHERE Domain = 'DOMAIN_SEA' AND (Class LIKE '%CRUISER%');
UPDATE Units SET StackValue = 30 WHERE Domain = 'DOMAIN_SEA' AND (Class LIKE '%DESTROYER%' OR Class LIKE '%SUBMARINE%');
UPDATE Units SET StackValue = 20 WHERE Domain = 'DOMAIN_SEA' AND (Class LIKE '%CONVOY%');

/* Support Fire Only classes (can't do normal ranged attack) */
UPDATE Units SET OnlySupportFire = 1 WHERE Class = 'UNITCLASS_FORTIFICATION' OR Class LIKE '%TANK_DESTROYER%';

/* Offensive Support Fire */
UPDATE Units SET OffensiveSupportFire = 1 WHERE CombatClass = 'UNITCOMBAT_SIEGE';

/* Defensive Support Fire */
UPDATE Units SET DefensiveSupportFire = 1 WHERE CombatClass = 'UNITCOMBAT_SIEGE';

/* Counter Fire */
UPDATE Units SET CounterFire = 1 WHERE (CombatClass = 'UNITCOMBAT_SIEGE' OR CombatClass = 'UNITCOMBAT_NAVAL' OR CombatClass = 'UNITCOMBAT_ARCHER') AND NOT (Class LIKE '%SUBMARINE%');

/* Fire points */
UPDATE Units SET FirePoints = 5 WHERE (CombatClass = 'UNITCOMBAT_SIEGE' OR CombatClass = 'UNITCOMBAT_NAVAL' OR CombatClass = 'UNITCOMBAT_ARCHER') AND NOT (Class LIKE '%SUBMARINE%');

/* Immunity to counter fire */
UPDATE Units SET ImmuneToCounterFire = 1 WHERE Domain = 'DOMAIN_SEA' AND (Class LIKE '%SUBMARINE%');

/* Counter Fire only against same combat class */
--UPDATE Units SET CounterFireSameCombatType = 1 WHERE CombatClass = 'UNITCOMBAT_ARCHER' AND Class <> 'UNITCLASS_ROMAN_BALLISTA';


--------------------------------------------------------------------------------------------
-- Combat damage --
--------------------------------------------------------------------------------------------
UPDATE Defines SET Value = 10		WHERE Name = 'COMBAT_DAMAGE';											-- default = 20
UPDATE Defines SET Value = 1250		WHERE Name = 'ATTACK_SAME_STRENGTH_MIN_DAMAGE';							-- default = 2400
UPDATE Defines SET Value = 950		WHERE Name = 'ATTACK_SAME_STRENGTH_POSSIBLE_EXTRA_DAMAGE';				-- default = 1200
UPDATE Defines SET Value = 700		WHERE Name = 'RANGE_ATTACK_SAME_STRENGTH_MIN_DAMAGE';					-- default = 2400
UPDATE Defines SET Value = 500		WHERE Name = 'RANGE_ATTACK_SAME_STRENGTH_POSSIBLE_EXTRA_DAMAGE';		-- default = 1200
UPDATE Defines SET Value = 800		WHERE Name = 'AIR_STRIKE_SAME_STRENGTH_MIN_DEFENSE_DAMAGE';				-- default = 2400
UPDATE Defines SET Value = 600		WHERE Name = 'AIR_STRIKE_SAME_STRENGTH_POSSIBLE_EXTRA_DEFENSE_DAMAGE';	-- default = 1200
UPDATE Defines SET Value = 1000		WHERE Name = 'INTERCEPTION_SAME_STRENGTH_MIN_DAMAGE';					-- default = 2400
UPDATE Defines SET Value = 800		WHERE Name = 'INTERCEPTION_SAME_STRENGTH_POSSIBLE_EXTRA_DAMAGE';		-- default = 1200
UPDATE Defines SET Value = 200		WHERE Name = 'CITY_ATTACKING_DAMAGE_MOD';								-- default = 100
UPDATE Defines SET Value = 200		WHERE Name = 'ATTACKING_CITY_MELEE_DAMAGE_MOD';							-- default = 100

/* test for tactical play */
/*
UPDATE Units SET Range = 10 WHERE Range > 0 AND (CombatClass = 'UNITCOMBAT_SIEGE' OR CombatClass = 'UNITCOMBAT_NAVAL' OR CombatClass = 'UNITCOMBAT_ARCHER');
UPDATE Defines SET Value = 3		WHERE Name = 'SUPPORT_FIRE_MAX_REQUEST_RANGE';
UPDATE Defines SET Value = 33		WHERE Name = 'SUPPORT_FIRE_MIN_HEALTH_PERCENT_LEFT';
UPDATE Defines SET Value = 1		WHERE Name = 'SUPPORT_FIRE_CHANCE_BY_HEALTH';
UPDATE Defines SET Value = 66		WHERE Name = 'SUPPORT_FIRE_BASE_CHANCE_PERCENT';
UPDATE Defines SET Value = 0		WHERE Name = 'SUPPORT_FIRE_NO_COUNTER';
UPDATE Units SET BaseSightRange = BaseSightRange + 2 WHERE BaseSightRange > 0 AND NOT (CombatClass = 'UNITCOMBAT_SIEGE');
--*/

/* Post Defines */

INSERT INTO "PostDefines" VALUES('PROMOTION_NO_SUPPLY','PROMOTION_NO_SUPPLY','UnitPromotions');