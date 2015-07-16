-- REDInitFunctions
-- Author: Gedemon
-- DateCreated: 21-May-15 17:36:06
--------------------------------------------------------------

print("Loading Red Initialization Functions...")
print("-------------------------------------")


--------------------------------------------------------------
-- Initializing functions 
--------------------------------------------------------------


-- remove starting units (Settler) from hidden minor civs
function RemoveHiddenCivs()
	Dprint("-------------------------------------")
	Dprint("Remove starting units from hidden minor civs ...")
	for playerID = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 1 do
		local player = Players[playerID]
		local minorCivID = player:GetMinorCivType()
		-- Does this civ exist ?
		if minorCivID ~= -1 then
			for v in player:Units() do
				if (v:GetUnitType() == SETTLER) then
					v:SetDamage( v:GetMaxHitPoints() )
				end
			end
		end
	end
	
	if HOTSEAT_CIV_TO_KILL then
		Dprint("-------------------------------------")
		Dprint("Remove starting units from hidden major civs ...")
		local player = Players[GetPlayerIDFromCivID (HOTSEAT_CIV_TO_KILL, false, true)]
		if player then
			for v in player:Units() do
				v:Kill(true, -1)
			end
		end
	end
end


--------------------------------------------------------------
-- Common batch functions 
--------------------------------------------------------------

-- functions to call at beginning of each turn
function CommonOnNewTurn()
	SetTurnDate()
	--[[
	InitializeProjects()
	MapUpdate() -- check for culture consistency
	SetMinorRelations()
	SetMinorDOW()
	SetMajorRelations()	
	ClearAIairSweep()
	RepairImprovements()
	LaunchMilitaryOperation()
	SetGlobalAIStrategicValues()
	--]]
end

-- functions to call at beginning of each active player turn
function CommonOnActivePlayerTurn()
	--[[
	InitializeActivePlayerTurn()
	LaunchMilitaryOperation()
	--]]
end

-- functions to call at end of each turn
function CommonOnEndTurn()
end

-- functions to call at end of 1st turn
function CommonOnFirstTurnEnd()
end

-- functions to call ASAP after loading this file when game is launched for the first time
function CommonOnFirstTurn()
	SetTurnDate()
	RemoveHiddenCivs()
end

-- functions to call ASAP after loading a saved game
function CommonOnLoading()
	SetTurnDate()
end

-- functions to call after first game initialization (DoM screen button "Begin your journey" appears)
function CommonOnGameInit()
	--[[
	-- calling order is important ! 
	InitializeGameOption()								-- before everything else !
	LoadAllTable()										-- before any change on tables...
	RegisterScenarioUnits()
	Events.SerialEventUnitCreated.Add( InitializeUnit ) -- before initializing Order Of Battle
	CreateTerritoryMap()
	SetInitialCityBuilds()
	InitializeProjects()
	SetMinorRelations()
	SetMinorDOW()
	SetMajorRelations()
	GameEvents.UnitSetXY.Add( DynamicTilePromotion )	-- before initializing Order Of Battle
	InitializeOOB()
	InitializeResourceTable()
	InitializeResourceMap()
	InitializeHotseat()
	ShareGlobalTables()									-- Before UI initialization, after any table initialization (Resource, projects, etc...)
	UpdateREDLoadingFix()
	SetGlobalAIStrategicValues()
	--]]
end

-- functions to call after game initialization (DoM screen button "Continue your journey" appears) after loading a saved game
function CommonOnGameInitReloaded()
	--[[
	-- calling order is important ! 
	InitializeGameOption()								-- before everything else !
	LoadAllTable()										-- before any change on tables...
	Events.SerialEventUnitCreated.Add( InitializeUnit )
	OnLoadMapUpdate()
	GameEvents.UnitSetXY.Add( DynamicTilePromotion )
	ReinitUnitsOnLoad()
	InitializeHotseat()
	ShareGlobalTables() -- Before UI initialization
	UpdateREDLoadingFix()	
	SetGlobalAIStrategicValues()
	--]]
end

-- functions to call after entering game (DoM screen button pushed)
function CommonOnEnterGame()
	--[[
	Events.InterfaceModeChanged.Add(AirSweepHighlight)
	Events.SerialEventCityCaptured.Add(	VictoryCheck )
	GameEvents.CityCaptureComplete.Add(	HandleCityCapture )					-- called before the attack animation
	--LuaEvents.OnCityCaptured.Add( FixCityGraphicBug )						-- called after the attack animation ?
	GameEvents.MustAbortAttack.Add(	AbortSuicideAttacks )
	GameEvents.CombatResult.Add( CombatResult )
	GameEvents.CombatEnded.Add(	CombatEnded )
	GameEvents.CombatResult.Add( NavalCounterAttack )
	GameEvents.CombatResult.Add( CounterFire )
	GameEvents.CanRangeStrikeAt.Add( CanRangeStrike )
	GameEvents.UnitSetXY.Add( UnitCaptureTile )	
	GameEvents.UnitSetXY.Add( IsAtDestination ) 
	GameEvents.UnitSetXY.Add( SubHunting )
	GameEvents.TurnComplete.Add( REDAutoSave )
	GameEvents.PlayerEndTurnInitiated.Add( REDAutoSaveEachPlayer )
	GameEvents.UnitHasPillaged.Add( SetPillageDamage )
	LuaEvents.OnUnitKilled.Add( PlayerCacheIsLimitedByRatio )
	LuaEvents.OnUnitKilled.Add( PlayerCacheTrainingRestriction )
	GameEvents.PlayerDoTurn.Add( PlayerCacheIsLimitedByRatio )
	GameEvents.PlayerDoTurn.Add( PlayerCacheTrainingRestriction )
	GameEvents.PlayerDoTurn.Add( ShowPlayerInfo )
	GameEvents.PlayerDoTurn.Add( FinalizeNextPlayerProjects )	
	GameEvents.PlayerDoTurn.Add( ShowAITrainingRestriction )
	GameEvents.PlayerDoTurn.Add( ListCitiesBuild )
	GameEvents.PlayerDoTurn.Add( UnitsBleeding )							-- UnitsBleeding: before doing other stuff with units, no need to reinforce/upgrade/control a dying unit...
	GameEvents.PlayerDoTurn.Add( DynamicUnitPromotion )						-- DynamicUnitPromotion: before calling reinforcements
	GameEvents.PlayerDoTurn.Add( ManageResources )
	GameEvents.PlayerDoTurn.Add( UpgradingUnits )							-- UpgradingUnits: after calling reinforcement
	GameEvents.PlayerDoTurn.Add( CallReserveTroops )
	GameEvents.PlayerDoTurn.Add( SpawnReinforcements )
	GameEvents.PlayerDoTurn.Add( SpawnConvoy )
	GameEvents.PlayerDoTurn.Add( AIUnitControl )
	GameEvents.PlayerDoTurn.Add( LaunchMilitaryOperation )
	GameEvents.PlayerDoTurn.Add( ResetCombatTracking )
	GameEvents.PlayerDoTurn.Add( ReinitUnits )
	GameEvents.PlayerDoTurn.Add( UpdatePlayerData )
	GameEvents.PlayerCanConstruct.Add( PlayerBuildingRestriction )
	GameEvents.CityCanConstruct.Add( CityBuildingRestriction )
	GameEvents.PlayerCanTrain.Add( PlayerTrainingRestriction )
	GameEvents.CityCanTrain.Add( CityTrainingRestriction )
	GameEvents.PlayerCanCreate.Add( PlayerCreateRestriction )
	GameEvents.CityCanCreate.Add( CityCreateRestriction )
	GameEvents.CityCanMaintain.Add( CityMaintainingRestriction )
	Events.WarStateChanged.Add( WarConsequences )
	Events.WarStateChanged.Add( PeaceConsequences )
	Events.WarStateChanged.Add( WarPlannedOperations )
	Events.WarStateChanged.Add( GeneralMobilization )
	GameEvents.CanDeclareWar.Add( DeclareWarRestriction )	
	GameEvents.CanSendDiploStatement.Add( CanSendDiploStatement )
	Events.SerialEventGameMessagePopup.Add( HideMinorWarButton )
	Events.SerialEventGameMessagePopup.Add( HideMinorPeaceButton )
	Events.SerialEventHexCultureChanged.Add( CheckCultureChange ) 
	RegisterOnSaveCallback()
	InitializeDynamicPromotions()
	GameEvents.TacticalAILaunchUnitAttack.Add(TacticalAILaunchUnitAttack )
	GameEvents.PushingMissionTo.Add( PushingMissionTo )
	GameEvents.GameCoreUpdateBegin.Add( InitializeUnitFunctions )
	GameEvents.GetFreeUnitsFromScenario.Add( GetFreeUnitsFromScenario )
	InitializeClosedBorders()
	UpdateGlobalData()
	ValidateData()											
	InitializeUI()															-- InitializeUI: Last to call
	--]]
end


