-- Lua RedUnitFunctions
-- Author: Gedemon
-- DateCreated: 14-Jul-15 15:25:50
--------------------------------------------------------------

include ("UnitsDefines")

print("Loading Red Units Functions...")
print("-------------------------------------")

--------------------------------------------------------------
-- Units renaming
-- to do : make it scenario dependant ? allow defined strings ?
--------------------------------------------------------------
function UnitName(playerID, unitID, num) -- num = number of unit of this type
	
	local bDebug = false
	local player = Players[ playerID ]
	local unit = player:GetUnitByID( unitID )

	--Dprint("-------------------------------------", bDebug)
	Dprint ("Renaming new unit...", bDebug)
	local unitType = unit:GetUnitType()
	local unitClassType = unit:GetUnitClassType()
	local numType = g_Unit_Classes[unitClassType].NumType or -1
	local str = nil

	--------------------------------------------- France ---------------------------------------------
	if ( GetCivIDFromPlayerID (playerID) == FRANCE ) then		
		if ( numType == CLASS_INFANTRY ) then
			if (num == 1) then
				str = "1ere "
			else			
				str = num .. "eme "
			end
			str = str .. "Division d'infanterie"
			unit:SetName(str)
		end	
		if ( numType == CLASS_INFANTRY_2 ) then
			if (num == 1) then
				str = "1er "
			else			
				str = num .. "eme "
			end
			str = str .. "Regiment etranger d'infanterie"
			unit:SetName(str)
		end
		if ( numType == CLASS_PARATROOPER ) then
			if (num == 1) then
				str = "1er "
			else			
				str = num .. "eme "
			end
			str = str .. "Regiment de Chasseurs Parachutistes"
			unit:SetName(str)
		end
		if ( numType == CLASS_SPECIAL_FORCES ) then
			if (num == 1) then
				str = "1ere "
			else			
				str = num .. "eme "
			end
			str = str .. "Compagnie d'Infanterie de l'Air"
			unit:SetName(str)
		end
		if ( numType == CLASS_MECHANIZED_INFANTRY ) then
			if (num == 1) then
				str = "1ere "
			else			
				str = num .. "eme "
			end
			str = str .. "Division d'Infantrie Motorisee"
			unit:SetName(str)
		end
		if IsArmorClass( numType ) then
			if (num == 1) then
				str = "1ere "
			else			
				str = num .. "eme "
			end
			str = str .. "Division blindee"
			unit:SetName(str)
		end
		if ( numType == CLASS_ARTILLERY ) then
			if (num == 1) then
				str = "1er "
			else			
				str = num .. "eme "
			end
			str = str .. "Regiment d'artillerie"
			unit:SetName(str)
		end
		if IsFighterClass( numType  ) then
			if (num == 1) then
				str = "1er "
			else			
				str = num .. "eme "
			end
			str = str .. "Escadron de chasse"
			unit:SetName(str)
		end
		if IsBomberClass( numType  ) then
			if (num == 1) then
				str = "1er "
			else			
				str = num .. "eme "
			end
			str = str .. "Escadron de bombardement"
			unit:SetName(str)
		end
		if ( unitType == FR_BATTLESHIP ) then
			local name = { "Dunkerque", "Strasbourg"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end
		if ( unitType == FR_GALISSONIERE ) then
			local name = { "La Galissonniere", "Montcalm", "Georges Leygues", "Jean de Vienne", "Marseillaise", "Gloire"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end
		if ( unitType == FR_BATTLESHIP_2 ) then
			local name = { "Richelieu", "Jean Bart", "Clemenceau", "Gascogne"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end

	--------------------------------------------- Germany ---------------------------------------------
	elseif ( GetCivIDFromPlayerID (playerID) == GERMANY ) then
 		
		if ( numType == CLASS_INFANTRY ) then
			str = num .. ". Infanterie-Division"
			unit:SetName(str)
		end
		if ( numType == CLASS_INFANTRY_2 ) then
			str = num .. ". Waffen-Grenadier-Division der SS"
			unit:SetName(str)
		end	
		if ( numType == CLASS_PARATROOPER ) then
			str = num .. ". Fallschirm-Jager-Division"
			unit:SetName(str)
		end	
		if ( numType == CLASS_SPECIAL_FORCES ) then
			local name = { "Brandenburg", "Munstereifel", "Niederrhein"}
			if (num <= # name) then
				str = name[num]
				str = "Fallschirm-Jager-Bataillon '".. name[num] .."'"
				unit:SetName(str)
			else
				str = num .. ". Fallschirm-Jager-Bataillon"
			end
		end	
		if IsArmorClass( numType ) then
			str = num .. ". Panzer-Division"
			unit:SetName(str)
		end
		if ( numType == CLASS_ARTILLERY ) then
			str = num .. ". Artillerie-Regiment"
			unit:SetName(str)
		end
		if ( numType == CLASS_MECHANIZED_INFANTRY ) then
			str = num .. ". Panzergrenadier-Division"
			unit:SetName(str)
		end
		if IsFighterClass( numType  ) then
			str = "Jagdgeschwader " .. num
			unit:SetName(str)
		end
		if IsBomberClass( numType  ) then
			str = "Kampfgeschwader " .. num
			unit:SetName(str)
		end
		if ( unitType == GE_BATTLESHIP ) then
			local name = { "Scharnhorst", "Gneisenau"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end
		if ( unitType == GE_BATTLESHIP_2 ) then
			local name = { "Bismarck", "Tirpitz"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end
		if ( unitType == GE_LEIPZIG ) then
			local name = { "Leipzig", "Nurnberg"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end
		if ( unitType == GE_DEUTSCHLAND ) then
			local name = { "Lutzow", "Admiral Scheer", "Admiral Graf Spee"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end

	--------------------------------------------- Italy ---------------------------------------------
	elseif ( GetCivIDFromPlayerID (playerID) == ITALY ) then
 		
		if ( unitType == IT_INFANTRY ) then
			str = num .. "a Divisione fanteria"
			unit:SetName(str)
		end	
		if IsArmorClass( numType ) then
			str = num .. "a Divisione corazzata"
			unit:SetName(str)
		end
		if ( numType == CLASS_ARTILLERY ) then
			str = num .. "a Reggimento Artiglieria"
			unit:SetName(str)
		end
		if IsFighterClass( numType  ) then
			str = num .. "a Squadriglia di caccia"
			unit:SetName(str)
		end
		if IsBomberClass( numType  ) then
			str = num .. "a Squadriglia di bombardieri"
			unit:SetName(str)
		end
		if ( unitType == IT_BATTLESHIP ) then
			local name = { "Vittorio Veneto", "Littorio", "Roma", "Impero"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end
		if ( unitType == IT_ZARA ) then
			local name = { "Zara", "Fiume", "Pola", "Gorizia"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end
		if ( unitType == IT_DI_CAVOUR ) then
			local name = { "Conte Di Cavour", "Giulio Cesare", "Leonardo Da Vinci"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end

	--------------------------------------------- USSR ---------------------------------------------
	elseif ( GetCivIDFromPlayerID (playerID) == USSR ) then
 		
		if ( unitType == RU_INFANTRY ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Rifle Division"
			unit:SetName(str)
		end	
		if IsArmorClass( numType ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Tank Corps"
			unit:SetName(str)
		end
		if ( numType == CLASS_ARTILLERY ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Artillery Regiment"
			unit:SetName(str)
		end
		if IsFighterClass( numType  ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Fighter Aviation Division"
			unit:SetName(str)
		end
		if IsBomberClass( numType  ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Bomber Aviation Division"
			unit:SetName(str)
		end
		if ( unitType == RU_BATTLESHIP ) then
			local name = { "Sovetsky Soyuz", "Sovetskaya Ukraina", "Sovetskaya Rossiya", "Sovetskaya Belorussiya"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end
		if ( unitType == RU_GANGUT ) then
			local name = { "Oktyabrskaya Revolyutsiya", "Petropavlovsk", "Poltava", "Sevastopol"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end
		if ( unitType == RU_KIROV ) then
			local name = { "Kirov", "Voroshilov", "Maxim Gorky", "Molotov", "Kaganovich", "Kalinin"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end

	--------------------------------------------- Greece ---------------------------------------------
	elseif ( GetCivIDFromPlayerID (playerID) == GREECE ) then		
		if ( unitType == GR_INFANTRY ) then
			str = num .. "i Merarchia Pezikou"
			unit:SetName(str)
		end	
		if IsArmorClass( numType ) then
			str = num .. "i Merarchia Tethorakismenon"
			unit:SetName(str)
		end
		if ( numType == CLASS_ARTILLERY ) then
			str = num .. "i Merarchia Pirobolikou"
			unit:SetName(str)
		end
		if IsFighterClass( numType  ) then
			str = num .. "i Omada Maxitikon"
			unit:SetName(str)
		end
		if IsBomberClass( numType  ) then
			str = num .. "i Omada Bombardistikon"
			unit:SetName(str)
		end
		if ( unitType == GR_PISA ) then
			local name = { "Georgios Averof"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end

	--------------------------------------------- U.K. ---------------------------------------------

	elseif (GetCivIDFromPlayerID (playerID) == ENGLAND) then	
		
		if ( numType == CLASS_INFANTRY ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Infantry Division"
			unit:SetName(str)
		end	
		if ( numType == CLASS_PARATROOPER ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Airborn Division"
			unit:SetName(str)
		end
		if ( numType == CLASS_SPECIAL_FORCES ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "SAS Regiment"
			unit:SetName(str)
		end
		if ( numType == CLASS_MECHANIZED_INFANTRY ) then

			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Mechanized Infantry Division"
			unit:SetName(str)
		end
		if IsArmorClass( numType ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Armored Division"
			unit:SetName(str)
		end
		if ( numType == CLASS_ARTILLERY ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Artillery Regiment"
			unit:SetName(str)
		end
		if IsFighterClass( numType  ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Fighter Squadron"
			unit:SetName(str)
		end
		if IsBomberClass( numType  ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Bomber Squadron"
			unit:SetName(str)
		end
		
		if ( unitType == UK_BATTLESHIP ) then
			local name = { "HMS Hood", "HMS Rodney"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end
		if ( unitType == UK_BATTLESHIP_2 ) then
			local name = { "HMS King George V", "HMS Prince Of Wales", "HMS Duke Of York", "HMS Anson", "HMS Howe"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end
		if ( unitType == UK_DIDO ) then
			local name = {	"HMS Argonaut", "HMS Bonaventure", "HMS Charybdis", "HMS Cleopatra", "HMS Dido",
							"HMS Euryalus", "HMS Hermione", "HMS Naiad", "HMS Phoebe", "HMS Scylla", "HMS Sirius",
							"HMS Bellona", "HMS Black Prince", "HMS Diadem", "HMS Royalist", "HMS Spartan"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end
		if ( unitType == UK_ELIZABETH ) then
			local name = { "HMS Queen Elizabeth", "HMS Warspite", "HMS Valiant", "HMS Barham", "HMS Malaya"}
			if (num <= # name) then
				str = name[num]
				unit:SetName(str)
			end
		end

	--------------------------------------------- other ---------------------------------------------

	else
		if ( numType == CLASS_INFANTRY ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Infantry Division"
			unit:SetName(str)
		end	
		if ( numType == CLASS_PARATROOPER ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Airborn Division"
			unit:SetName(str)
		end
		if ( numType == CLASS_SPECIAL_FORCES ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. " Special Forces Regiment"
			unit:SetName(str)
		end
		if ( numType == CLASS_MECHANIZED_INFANTRY ) then

			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Mechanized Infantry Division"
			unit:SetName(str)
		end
		if IsArmorClass( numType ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Armored Division"
			unit:SetName(str)
		end
		if ( numType == CLASS_ARTILLERY ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Artillery Regiment"
			unit:SetName(str)
		end
		if IsFighterClass( numType  ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Fighter Squadron"
			unit:SetName(str)
		end
		if IsBomberClass( numType  ) then
			if (num == 1) then
				str = "1st "
			elseif (num == 2) then			
				str = "2nd "
			elseif (num == 3) then			
				str = "3rd "
			else
				str = num .. "th "
			end
			str = str .. "Bomber Squadron"
			unit:SetName(str)
		end
	end
	if str then
		Dprint ("New name : " .. str, bDebug)
		return str
	else
		Dprint ("No name found", bDebug)
		return unit:GetName()
	end
end

--------------------------------------------------------------
-- Units Initialization
--------------------------------------------------------------

function RegisterNewUnit(playerID, unit, bNoAutoNaming) -- unit is object, not ID

	local bDebug = true

	if NO_AUTO_NAMING then
		bNoAutoNaming = NO_AUTO_NAMING
	end
	local unitClass = unit:GetUnitClassType()
	local unitType = unit:GetUnitType()
	local value = g_Unit_Classes[unitClass]
	local unitID = unit:GetID()

	if ( value == nil ) then
		Dprint("WARNING : unit (id="..unit:GetID()..", class='".. GameInfo.Units[unitType].Class .."', type='".. GameInfo.Units[unitType].Type .."') is not defined in g_Unit_Classes table", bDebug )
		value = {Moral = 100, NumType = -1, MaxHP = 100}
	end	

	if (value.NumType == nil) then
		Dprint("WARNING : NumType for type='".. GameInfo.Units[unitType].Type .."' class=".. GameInfo.Units[unitType].Class .." (".. unitClass ..") is not defined in g_Unit_Classes table", bDebug )
		-- some units did not have valid NumType but everything else is okay, initialize with unitType as hardcoded fix :-/
		-- todo: find out why this is needed
		value.NumType = unitType
	end

	-- temp, waiting to see if variable maxHP could be implemented
	local maxHP = MAX_HP -- maxHP from Defines here
	--[[
	local maxHP = value.MaxHP
	local initialDamage = MAX_HP - value.MaxHP -- set custom maxHP by substracting the value.MaxHP (requested MaxHit point for this unit) to the global MAX_HP than applying the result as damage (or none if the requested max HP is >= global max HP)
	if initialDamage > 0 then
		unit:SetDamage (initialDamage)
	end 
	--]]

	local unitKey = GetUnitKey(unit)

	MapModData.RED.UnitData[unitKey] = { 
		UniqueID = unitID.."-"..playerID.."-"..os.clock(), -- for linked statistics
		UnitID = unitID,
		BuilderID = playerID,
		Damage = 0,
		OwnerID = playerID,
		TurnCreated = Game.GetGameTurn(),
		NumType = value.NumType,
		Type = GameInfo.Units[unitType].Type,
		TypeID = unitType,
		Moral = value.Moral,
		Alive = true,
		TotalXP = unit:GetExperience(),
		CombatXP = 0,
		MaxHP = value.MaxHP,
		OrderType = nil,
		OrderReference = nil,
		OrderObjective = nil,
		TransportType = nil,
		TransportReference = nil,
		TotalControl = false, -- when set to true, R.E.D. scripts can totally control the unit, even if it belongs to human
	}

	if not (bNoAutoNaming) then
		local num = CountUnitClass (unitClass, playerID)
		UnitName(playerID, unitID, num)
	end

	-- remove embarked promotion if needed
	CheckEmbarkedPromotion(unit)

	-- Set special units that can stack with normal units (but not with other special units)
	if IsRegiment(unit) then
		unit:SetIsSpecialType(true)
	end
	--DynamicTilePromotion(playerID, UnitID, unit:GetX(), unit:GetY())

	-- apply germany trait
	if GetCivIDFromPlayerID (playerID) == GERMANY then		
		if IsArmorClass(value.NumType) and not (IsAssaultGun(unit) or IsTankDestroyer(unit)) then
			unit:SetHasPromotion(PROMOTION_BLITZ, true)
		end
	end

	-- some units can only fight in defense
	if IsTankDestroyer(unit) or unit:IsHasPromotion(PROMOTION_FORTIFIED_GUN) then
		unit:SetMadeAttack(true) -- will be set to false when needed in counter-fire / first strike functions in RedCombat.lua
	end

	--[[
	-- Place fort under airport
	if unitType == AIRFIELD then
		local plot = unit:GetPlot()
		local fortType = GameInfoTypes["IMPROVEMENT_FORT"]
		if (plot:GetImprovementType() ~= fortType) then
			plot:SetImprovementType(fortType)
		end
	end

	-- Place citadel under fortified guns
	if unitType == FORTIFIED_GUN then
		local plot = unit:GetPlot()
		--local citadelType = GameInfoTypes["IMPROVEMENT_CITADEL"]
		local citadelType = GameInfoTypes["IMPROVEMENT_FORT"] -- to do: resize citadel ? use fort
		if (plot:GetImprovementType() ~= citadelType) then
			plot:SetImprovementType(citadelType)
		end
	end
	--]]

	LuaEvents.NewUnitCreated()
end

function InitializeUnit(playerID, unitID)
	local bDebug = true
	local player = Players[ playerID ]
	local unit = player:GetUnitByID( unitID )
	if unit then
		local unitKey = GetUnitKey(unit)

		-- initialize only new units...
		if unit:GetGameTurnCreated() ~= Game.GetGameTurn() then
			return
		end
		-- don't initialise settlers
		if unit:GetUnitType() == SETTLER then
			Dprint("  - Unit (TypeID=".. unit:GetID() ..") is a Settler, don't initialize... ", bDebug) 
			return
		end


		if ( SetMinorUU(playerID, unitID) ) then
			-- unit was changed to Minor UU during the above test, don't initialize now, this will be recalled by the new UU creation
			return
		end
	
		if MapModData.RED.UnitData[unitKey] then
			-- unit already registered, don't add it again...
			Dprint("  - ".. unit:GetName() .." is already registered as " .. MapModData.RED.UnitData[unitKey].Type, bDebug) 
			return
		end

		Dprint ("Initializing new unit (".. unit:GetName() ..") for ".. player:GetName() .."...", bDebug)
		local bNoAutoNaming = string.len(unit:GetNameNoDesc()) > 1 -- check if unit has a custom name
		RegisterNewUnit(playerID, unit, bNoAutoNaming) -- no autonaming if unit already has a custom name
		Dprint("-------------------------------------", bDebug)
	else
		Dprint ("- WARNING : tried to initialize nil unit for ".. player:GetName(), bDebug)
	end

end


--------------------------------------------------------------
-- Units placement from Order of Battle
--------------------------------------------------------------
function PlaceUnits(oob)
	local playerID = GetPlayerIDFromCivID( oob.CivID, oob.IsMinor )
	local player = Players [ playerID ]
	local plot = GetPlot(oob.X, oob.Y)
	local plotList = GetAdjacentPlots(plot, true)
	local placedUnits = 0
	for i, unitPlot in pairs (plotList) do
		local unitType = oob.Group[i]
		if unitPlot:GetNumUnits() > 0 then
			Dprint("- WARNING : trying to place unit on occupied plot at " .. unitPlot:GetX() .."," .. unitPlot:GetY())
		end
		if unitType and (unitPlot:GetNumUnits() == 0 or FORCE_UNIT_SPAWNING_ON_OCCUPIED_PLOT) then
			local unit = player:InitUnit(unitType, unitPlot:GetX(), unitPlot:GetY())
			FinalizeUnitFromOOB(unit, oob, i)
			placedUnits = placedUnits + 1
		end
	end
	if placedUnits < #oob.Group then
		Dprint("- WARNING : asked to place " ..  tostring(#oob.Group) .. " units, but found valid plots for only " .. tostring(placedUnits))
	end
end
function PlaceAirUnits(oob)
	local playerID = GetPlayerIDFromCivID( oob.CivID, oob.IsMinor )
	local player = Players [ playerID ]
	local plot = GetPlot(oob.X, oob.Y)
	for i, unitType in ipairs (oob.Group) do
		local unit = player:InitUnit(unitType, oob.X, oob.Y)
		FinalizeUnitFromOOB(unit, oob, i)
	end
end
function FinalizeUnitFromOOB(unit, oob, i)
	local bDebug = true
	if unit:GetDomainType() == DomainTypes.DOMAIN_LAND and unit:GetPlot():IsWater() then
		Dprint("- initializing Land unit on sea...", bDebug)
		if (not unit:IsHasPromotion(PROMOTION_EMBARKATION)) then
			Dprint("   - Adding embarked promotion unitID =".. unit:GetID(), bDebug)
			unit:SetHasPromotion(PROMOTION_EMBARKATION, true)
		end
		--unit:SetEmbarked(true)
		unit:Embark(unit:GetPlot())
	end
	if unit:GetDomainType() == DomainTypes.DOMAIN_SEA and not unit:GetPlot():IsWater() then
		Dprint("- WARNING : tried to spawn a sea unit on land, calling JumpToNearestValidPlot()...", bDebug)
		unit:JumpToNearestValidPlot() -- safe with sea units ?
	end
	if oob.UnitsName and oob.UnitsName[i] then
		Dprint("   - Set name to unitID =".. unit:GetID(), bDebug)
		unit:SetName(oob.UnitsName[i])
	end
	if oob.UnitsXP and oob.UnitsXP[i] then
		Dprint("   - Set XP to unitID =".. unit:GetID(), bDebug)
		unit:SetExperience(oob.UnitsXP[i])
	end
	if oob.Promotions and oob.Promotions[i] then
		Dprint("   - Set promotion to unitID =".. unit:GetID(), bDebug)
		for j, promotion in pairs(oob.Promotions[i]) do
			unit:SetHasPromotion(promotion, true)
		end
	end
	if oob.InitialObjective then -- Initial objective is set for all units of all groups tagged InitialObjective = true		
		Dprint("   - Set Initial objective to unitID =".. unit:GetID(), bDebug)
		unit:SetDeployFromOperationTurn(Game.GetGameTurn()+1)
	end
end

-- Initial Order of Battle
function InitializeOOB ()
	-- mass units initialization is made in PlaceUnits() and PlaceAirUnits() functions
	local bDebug = true
	if g_Initial_OOB then
		Dprint("-------------------------------------")
		Dprint("Initialize Order of Battle")
		local dominanceZone = {}
		for i, oob in ipairs (g_Initial_OOB) do
			local playerID = GetPlayerIDFromCivID (oob.CivID, oob.IsMinor)	
			Dprint("CivID = " .. oob.CivID, bDebug)
			Dprint("PlayerID = " .. playerID, bDebug)
			local player = Players[playerID]
			local bIsHumanSide = player and (player:IsHuman() or IsSameSideHuman(player))
			if (not (bIsHumanSide and oob.AI)) 
			--or BothSideHuman() 
			then
				Dprint("-------------------------------------", bDebug)
				Dprint("Placing ".. oob.Name, bDebug)
				if oob.Domain == "Land" or  oob.Domain == "Sea" then
					PlaceUnits(oob)
				elseif oob.Domain == "Air" or oob.Domain == "City" then
					PlaceAirUnits(oob)
				else
					Dprint("WARNING, domain is not valid : ".. oob.Domain, bDebug)
				end
				if oob.InitialObjective then
					dominanceZone[player] = oob.InitialObjective
				end
			end
		end
		for player, plotkey in pairs(dominanceZone) do
			Dprint("Set dominance zone for ".. player:GetName() .. " at " .. plotkey, bDebug)
			player:AddTemporaryDominanceZone (GetPlotXYFromKey (plotkey), AI_TACTICAL_TARGET_CITY)
		end
		Dprint("-------------------------------------", bDebug)
		Dprint("End of Order of Battle initialization ...", bDebug)
	end
end

-- Mid-Game Reinforcement
function SpawnReinforcements(playerID)

	local bDebug = true

	if g_Reinforcement_OOB then
		local CivID = GetCivIDFromPlayerID (playerID)
		if g_Reinforcement_OOB[CivID] then
			local player = Players[playerID]
			Dprint("-------------------------------------")
			Dprint("Check Reinforcement to spawn for ".. player:GetName())
			local turn = Game.GetGameTurn()
			local turnDate, prevDate = 0, 0
			if g_Calendar[turn] then turnDate = g_Calendar[turn].Number else turnDate = 19470105 end
			if g_Calendar[turn-1] then prevDate = g_Calendar[turn-1].Number else  prevDate = turnDate - 1 end
	
			Dprint ("Current turn date : " .. turnDate ..", next turn date :" .. prevDate, bDebug )

			for date, reinforcements in pairs(g_Reinforcement_OOB[CivID]) do
				if date <= turnDate and date > prevDate then
					for i, oob in ipairs (reinforcements) do
						Dprint (date .. " <= " .. turnDate .." and ".. date .." > " .. prevDate, bDebug )
						local bIsHumanSide = player and (player:IsHuman() or IsSameSideHuman(player))
						if (not (bIsHumanSide and oob.AI)) 
						-- or BothSideHuman()
						then
							Dprint("-------------------------------------", bDebug)
							Dprint("Placing ".. oob.Name, bDebug)
							if oob.Domain == "Land" or  oob.Domain == "Sea" then
								PlaceUnits(oob)
							elseif oob.Domain == "Air" or oob.Domain == "City" then
								PlaceAirUnits(oob)
							else
								Dprint("WARNING, domain is not valid : ".. oob.Domain, bDebug)
							end
						end
					end					
					if oob.InitialObjective then
						player:AddTemporaryDominanceZone (GetPlotXYFromKey ( oob.InitialObjective ), AI_TACTICAL_TARGET_CITY)
					end
				end
			end
			Dprint("-------------------------------------", bDebug)
			Dprint("End of Reinforcement spawning ...", bDebug)
		end
	end
end
-- GameEvents.PlayerDoTurn.Add(SpawnReinforcements)

function LaunchMilitaryOperation(playerID)

	local bDebug = true
	
	Dprint("-------------------------------------")
	Dprint("Check for Military Operations...")

	if not g_Military_Project then
		Dprint("- But no military project defined for this scenario...")
		return
	end

	if playerID == nil then
		Dprint("- PlayerID was nil, assume LaunchMilitaryOperation was called by ActivePlayerStartTurn for active player...")
		playerID = Game.GetActivePlayer()
		if not Players[playerID]:IsHuman() then		
			Dprint("- Game.GetActivePlayer() has returned a non human player... WTF ??? escaping here, bug maybe caused by auto end turn...")
			return
		end
	end

	local player = Players[playerID]

	if player:IsHuman() and not IsActivePlayerTurnInitialised() then
		Dprint("- Player is human, but function called before it's turn has been initialized, wait for ActivePlayerStartTurn...")
		return -- for human player this will be called again at ActivePlayerStart turn
	end

	local civID = GetCivIDFromPlayerID(playerID, false)

	if not g_Military_Project[civID] then
		Dprint("- But no military project defined for this nation...")
		return
	end

	
	if (player:IsMinorCiv() and (not g_Military_Project[civID].IsMinor)) or ((not player:IsMinorCiv()) and g_Military_Project[civID].IsMinor) then
		Dprint("- but minor/major/project defines do not match...")
		return
	end

	Dprint("-------------------------------------")
	Dprint("Initializing Military Operations for " .. player:GetName())

	for id, militaryOperation in pairs(g_Military_Project[civID]) do	
		local savedData = Modding.OpenSaveData()
		local saveStr = "Operation-"..id
		local triggered = savedData.GetValue(saveStr)
		if triggered ~= 1 then -- not triggered yet, test it !
		
			Dprint(" - Testing condition for Operation ID = " .. id, bDebug)
			-- check if required project is done
			if (IsProjectDone(id, civID)) then
				local condition
				if militaryOperation.Condition then
					condition = militaryOperation.Condition()
				else
					condition = true -- if no condition set, assume always true
				end
				if condition then
					
					Dprint(" - Launching Operation ID = " .. tostring(id), bDebug)
					Dprint(" - Code Name =  " .. Locale.ConvertTextKey(militaryOperation.Name), bDebug)
					if militaryOperation.Name then
						Events.GameplayAlertMessage(Locale.ConvertTextKey(militaryOperation.Name).." has been launched !")
						BroadcastNotification(NotificationTypes.NOTIFICATION_PROJECT_COMPLETED, Locale.ConvertTextKey(militaryOperation.Name).." launched !", Locale.ConvertTextKey(militaryOperation.Name).." launched !", nil, nil, id, playerID )
					end
					LaunchUnits(militaryOperation)

					if (not CanRepeatProject(id)) then
						Dprint(" - Marking Operation done...", bDebug)
						local saveStr = "Operation-"..id
						savedData.SetValue(saveStr, 1) -- mark as triggered !
					else
						Dprint(" - Operation can be repeated, mark project as not completed so it can be launched again...", bDebug)
						MarkProjectNotCompleted(id, civID) -- now that Civ can build this project again...
					end
					LuaEvents.MilitaryOperationLaunched(id, civID) -- can use LuaEvents.MilitaryOperationLaunched.Add(anyScenarioFunction) in the scenarios Lua to do additional stuff...
					
					--PauseGame(3)
				end
			end
		end
	end
	Dprint("Military Operations initialized...")
	Dprint("-------------------------------------")
end

function LaunchUnits(militaryOperation)
	local bDebug = true
	for i, oob in ipairs (militaryOperation.OrderOfBattle) do
		local playerID = GetPlayerIDFromCivID( oob.CivID, oob.IsMinor )
		local player = Players [ playerID ]
		local bIsHumanSide = player and (player:IsHuman() or IsSameSideHuman(player))
		if (not (bIsHumanSide and oob.AI)) or BothSideHuman() then
			Dprint("   - Launching " .. tostring(oob.Name), bDebug)
			--PauseGame(2)
			local plot = GetPlot(oob.X, oob.Y)
			local plotList = GetAdjacentPlots(plot, true)

			local objectivePlot = nil
			local objectivePlotList = {}
			local validPlotList = {}
			local bParadrop = (oob.LaunchType and oob.LaunchType == "ParaDrop")
			local bAmphibious = (oob.LaunchType and oob.LaunchType == "Amphibious")
			if  bParadrop then
				objectivePlot = GetPlot(oob.LaunchX, oob.LaunchY)
				objectivePlotList = GetPlotsInCircle(objectivePlot, 0, oob.LaunchImprecision)
				for i, testPlot in pairs(objectivePlotList) do
					if IsSafePlot( testPlot, playerID) and not testPlot:IsWater() and not testPlot:IsImpassable() and not testPlot:IsCity() and not IsNeutral(testPlot:GetOwner()) then
						table.insert(validPlotList, testPlot)
					end
				end
				Shuffle(validPlotList)
			end
	
	--		if player:GetID() == Game:GetActivePlayer() and bParadrop then
			if bParadrop then
			
				Dprint("   - Looking at objective at " .. tostring(objectivePlot:GetX()) .. "," .. tostring(objectivePlot:GetY()), bDebug)
				UI.LookAt(objectivePlot, 0)
				--PlaceCameraAtPlot(objectivePlot)
			end

			local placedUnits = 0
			local unitList = {}

			-- place units on map
			for i, unitPlot in pairs (plotList) do
				local unitType = oob.Group[i]
				if unitPlot:GetNumUnits() > 0 then
					Dprint("- WARNING : trying to place unit on occupied plot at " .. unitPlot:GetX() .."," .. unitPlot:GetY())
				end
				if unitType and (unitPlot:GetNumUnits() == 0 or FORCE_UNIT_SPAWNING_ON_OCCUPIED_PLOT) then
			
					local bCanPlaceUnit = true
					if bParadrop and not validPlotList[i] then
						Dprint("- WARNING : Not enough valid Airdrop destination plot for i = " .. tostring(i))
						bCanPlaceUnit = false
					end
					if bCanPlaceUnit then
						local unit = player:InitUnit(unitType, unitPlot:GetX(), unitPlot:GetY())
						RegisterNewUnit(playerID, unit) -- force immediate registration to allow change in MapModData.RED.UnitData
						local unitKey = GetUnitKey(unit)
						FinalizeUnitFromOOB(unit, oob, i)
						placedUnits = placedUnits + 1
						table.insert(unitList, unitKey)

						if bAmphibious then -- initialize first move for Amphibious operation
							Dprint("   - Initialize first move for Amphibious unit...", bDebug)							
							
							local routeID = oob.RouteID

							MapModData.RED.UnitData[unitKey].OrderReference = routeID
							MapModData.RED.UnitData[unitKey].TotalControl = true

							local newWaypoint = GetFirstWaypoint(playerID, routeID)

							if newWaypoint then
								MapModData.RED.UnitData[unitKey].OrderType = RED_MOVE_TO_EMBARKED_WAYPOINT
								MapModData.RED.UnitData[unitKey].OrderObjective = newWaypoint
								MoveUnitTo (unit, GetPlot (newWaypoint.X, newWaypoint.Y ))
							else
								local newDestination = GetDestinationToDisembark(playerID, routeID)
								MapModData.RED.UnitData[unitKey].OrderType = RED_MOVE_TO_DISEMBARK
								MapModData.RED.UnitData[unitKey].OrderObjective = newDestination
								MoveUnitTo (unit, GetPlot (newDestination.X, newDestination.Y ))
							end
						end
					end
				end
			end

			-- now the show for paradrop...
			if bParadrop then
				--PauseGame(2)
				spotterList = {}
				Dprint("   - Placing spotters for Paradrop mission...", bDebug)
				for i, unitKey in pairs (unitList) do		
					local dropPlot = validPlotList[i]		
					local spotter = player:InitUnit(SETTLER, dropPlot:GetX(), dropPlot:GetY())
					spotter:SetHasPromotion(PROMOTION_AIR_RECON, true)

					local spotterKey = GetUnitKey(spotter)
					Dprint("     - Placing spotters (key = ".. tostring(spotterKey) ..") at " .. tostring(dropPlot:GetX()) .."," .. tostring(dropPlot:GetY()), bDebug)
					table.insert(spotterList, spotterKey)
				end
				
				--PauseGame(2)
				--UI.LookAt(objectivePlot, 0)
				local paraList = {}
				for i, unitKey in pairs (unitList) do
					local unit = GetUnitFromKey ( unitKey )
					local dropPlot = validPlotList[i]
					
					Dprint("   - Launch Paradrop mission for " .. unit:GetName() .. " (unitID = ".. unit:GetID() .. ") at " .. tostring(dropPlot:GetX()) .."," .. tostring(dropPlot:GetY()), bDebug)

					unit:SetHasPromotion(PROMOTION_LONG_PARADROP, true)
					unit:PopMission()
					unit:PushMission(MissionTypes.MISSION_PARADROP, dropPlot:GetX(), dropPlot:GetY(), 0, 0, 1, MissionTypes.MISSION_PARADROP, unit:GetPlot(), unit)
					--unit:SetMoves(0)
					unit:SetHasPromotion(PROMOTION_LONG_PARADROP, false)
					unit:PopMission()
					ChangeUnitOwner (unit, unit:GetOwner()) -- trying to fix a strange bug (bad initialization for those units...)
				end

				Dprint("   - Remove spotters for Paradrop mission...", bDebug)
				for v in player:Units() do
					if (v:GetUnitType() == SETTLER) then
						Dprint("     - removing spotter at " .. tostring(v:GetX()) .."," .. tostring(v:GetY()), bDebug)
						v:Kill(true, -1)
					end
				end
			end
										
			if oob.InitialObjective then
				player:AddTemporaryDominanceZone (GetPlotXYFromKey ( oob.InitialObjective ), AI_TACTICAL_TARGET_CITY)
			end

			if placedUnits < #oob.Group then
				Dprint("- WARNING : asked to place " ..  tostring(#oob.Group) .. " units, but found valid plots for only " .. tostring(placedUnits))
			end
		end
	end
end

--------------------------------------------------------------
-- Minor Civilizations Units replacing
--------------------------------------------------------------
function ChangeUnitTo ( playerID, unitID, unitType )
	local player = Players[ playerID ]
	local unit = player:GetUnitByID( unitID )

	-- get position before killing the unit !
	local x = unit:GetX()
	local y = unit:GetY()

	-- kill old unit
	unit:SetDamage( unit:GetMaxHitPoints() )

	-- create the new unit from the old one
	local newUnit = player:InitUnit(unitType, x, y)
	newUnit:SetExperience ( unit:GetExperience() )
	newUnit:SetLevel ( unit:GetLevel() )
	for unitPromotion in GameInfo.UnitPromotions() do
		local unitPromotionID = unitPromotion.ID
		if( unit:IsHasPromotion( unitPromotionID ) ) then
			newUnit:SetHasPromotion( unitPromotionID )
		end
	end
end

function GetMinorUUType(playerID, unitClassTypeID)
	local player = Players[ playerID ]
	local playerCivID = player:GetMinorCivType()
	local minorUUID = nil
	local minorList = g_Minor_UU[playerCivID]
	if minorList then
		minorUUID = minorList[unitClassTypeID]
	end

	if minorUUID then
		return minorUUID
	end
	return -1
end

function SetMinorUU( playerID, unitID )

	local player = Players[ playerID ]
	if ( player:IsMinorCiv() ) then
		local unit = player:GetUnitByID( unitID )
		local unitType = unit:GetUnitType()		
		local unitClassTypeID = unit:GetUnitClassType()
		local citystateUUTypeID = GetMinorUUType( playerID, unitClassTypeID )

		-- be cautious when setting conditions, remember that we can create an infinite loop here
		if (citystateUUTypeID >= 0  and unitType ~= citystateUUTypeID) then
			ChangeUnitTo ( playerID, unitID, citystateUUTypeID )
			return true
		end
	end

	return false
end


--------------------------------------------------------------
-- Units Upgrade
--------------------------------------------------------------

-- Return next upgrade type for this unit type
function GetUnitUpgradeType(unitType)
	if g_UnitUpgrades and g_UnitUpgrades[unitType] then
		return g_UnitUpgrades[unitType]
	end
	return nil
end

-- Return the last available upgrade type for this player and unit type
function GetLastUnitUpgradeType(player, unitType)
	local testType = unitType
	local upgradeType = nil

	repeat
		testType = GetUnitUpgradeType(testType)
		if testType and player:CanTrain(testType) then
			upgradeType = testType
		end
	until not testType

	return upgradeType
end

function GetUnitUpgradeCost(unitType, upgradeType)
	local diffCost = tonumber(GameInfo.Units[upgradeType].Cost) - tonumber(GameInfo.Units[unitType].Cost)
	local cost = GameDefines.BASE_UNIT_UPGRADE_COST +  diffCost * GameDefines.UNIT_UPGRADE_COST_PER_PRODUCTION
	if cost > 0 then
		return cost
	else
		return 0
	end
end

function UpgradingUnits(playerID)
	local bDebug = true
	local player = Players[playerID]
	if ( player:IsAlive() and not player:IsBarbarian() ) then
		Dprint("-------------------------------------", bDebug)
		Dprint("Check possible unit upgrade for ".. player:GetCivilizationShortDescription() .."...", bDebug)
		local upgradeTable = {} 
		for unit in player:Units() do
			local upgradeType = GetLastUnitUpgradeType(player, unit:GetUnitType() )
			-- to do : check if upgradeType can also be upgraded and upgrade to last type available...
			if upgradeType -- upgrade is available ?
			  and (unit:GetDamage() < unit:GetMaxHitPoints() / 2) -- don't upgrade more than half-damaged unit
			  and not unit:IsEmbarked()
			  and not (unit:IsHasPromotion(PROMOTION_NO_SUPPLY)) and not (unit:IsHasPromotion(PROMOTION_NO_SUPPLY_SPECIAL_FORCES)) -- unit must have supply line
			  then
				table.insert(upgradeTable, { Unit = unit, XP = unit:GetExperience(), UpgradeType = upgradeType })
				Dprint("   -- possible upgrade for ".. unit:GetName() .." (".. unit:GetExperience() .."xp) to " .. Locale.ConvertTextKey(GameInfo.Units[upgradeType].Description), bDebug)
			end
		end
		table.sort(upgradeTable, function(a,b) return a.XP > b.XP end) -- upgrade higher XP first...
		for i, data in ipairs(upgradeTable) do
			local reqMateriel = GetUnitUpgradeCost(data.Unit:GetUnitType(), data.UpgradeType)
			if (reqMateriel <= MapModData.RED.ResourceData[playerID].Materiel) then
				Dprint("Upgrade ".. data.Unit:GetName() .." to " .. Locale.ConvertTextKey(GameInfo.Units[data.UpgradeType].Description), bDebug)
				MapModData.RED.ResourceData[playerID].Materiel = MapModData.RED.ResourceData[playerID].Materiel - reqMateriel
				MapModData.RED.ResourceData[playerID].MatToUpgrade = reqMateriel
				local oldType = data.Unit:GetUnitType()
				local plot = data.Unit:GetPlot()
				local newUnit = ChangeUnitType (data.Unit, data.UpgradeType)
				player:AddNotification(NotificationTypes.NOTIFICATION_UNIT_PROMOTION, newUnit:GetNameNoDesc() .. " have just been upgraded from ".. Locale.ConvertTextKey(GameInfo.Units[oldType].Description).." to " .. Locale.ConvertTextKey(GameInfo.Units[data.UpgradeType].Description), newUnit:GetNameNoDesc() .. " upgraded !", -1, -1, data.UpgradeType, newUnit:GetID())
				return -- upgrade one unit per turn max...
			end
		end		
		Dprint("No upgrade made (not enought materiel, or no upgradable units available)", bDebug)
		MapModData.RED.ResourceData[playerID].MatToUpgrade = nil
	end
end
-- add to GameEvents.PlayerDoTurn


function UnitsBleeding(playerID)
	local bDebug = true
	local player = Players[playerID]
	if ( player:IsAlive() and not player:IsBarbarian() ) then
		Dprint("-------------------------------------", bDebug)
		Dprint("Check units bleeding for ".. player:GetCivilizationShortDescription() .."...", bDebug)
		for unit in player:Units() do
			if IsBleeding(unit) and (not unit:IsDead()) then
				Dprint(" - apply bleeding to ".. unit:GetName() .."...", bDebug)
				local damage = unit:GetDamage()
				unit:SetDamage(unit:GetDamage() + BLEEDING_PER_TURN)
			end
		end
	end
end


--------------------------------------------------------------
-- Unit Utils 
--------------------------------------------------------------

-- return unique key for units table [unitID,playerID]
function GetUnitKey(unit)
	if unit then
		local ownerID = unit:GetOwner()
		local unitID = unit:GetID()
		local turn = unit:GetGameTurnCreated()
		local unitKey = unitID..","..ownerID..","..turn
		return unitKey
	else
		Dprint("- WARNING: unit is nil for GetUnitKey()")
	end
end

-- return the unit refered by the key string
function GetUnitFromKey ( unitKey )
	if MapModData.RED.UnitData[unitKey] then
		local pos = string.find(unitKey, ",")
		local unitID = tonumber(string.sub(unitKey, 1 , pos -1))
		local pos2 = string.find(unitKey, ",", pos+1)
		local playerID = tonumber(string.sub(unitKey, pos +1, pos2 -1))
		--local ownerID = MapModData.RED.UnitData[unitKey].OwnerID
		local unit = Players[playerID]:GetUnitByID(unitID)
		if unit then
			return unit
		else
			if MapModData.RED.UnitData[unitKey].Alive == nil then
				Dprint("- WARNING: unit is nil and alive is not set for GetUnitFromKey(), marking as dead")
				Dprint("--- UnitId = " .. MapModData.RED.UnitData[unitKey].UnitID ..", BuilderID = " .. MapModData.RED.UnitData[unitKey].BuilderID ..", Type = " .. MapModData.RED.UnitData[unitKey].Type )
				MapModData.RED.UnitData[unitKey].Alive = false
				return nil
			elseif MapModData.RED.UnitData[unitKey].Alive then
				Dprint("- WARNING: unit is marked alive but is nil for GetUnitFromKey(), marking as dead")
				Dprint("--- UnitId = " .. MapModData.RED.UnitData[unitKey].UnitID ..", BuilderID = " .. MapModData.RED.UnitData[unitKey].BuilderID ..", Type = " .. MapModData.RED.UnitData[unitKey].Type )
				MapModData.RED.UnitData[unitKey].Alive = false
				return nil
			else -- alive = false, don't return
				--Dprint("- WARNING: unit is nil for GetUnitFromKey()")
				--Dprint("--- UnitId = " .. MapModData.RED.UnitData[unitKey].UnitId ..", BuilderID = " .. MapModData.RED.UnitData[unitKey].BuilderID ..", Type = " .. MapModData.RED.UnitData[unitKey].Type )
				return nil
			end
		end
	else
		Dprint("- WARNING: MapModData.RED.UnitData[unitKey] is nil for GetUnitFromKey()")
		if unitKey then Dprint("--- unitKey =	" .. unitKey ) end
		if unitID then Dprint("--- unitID =		" .. unitID ) end
		if ownerID then Dprint("--- ownerID =	" .. ownerID ) end
		return nil
	end
end


-- change unit ownership
function ChangeUnitOwner (unit, iNewOwner)
	
	local unitKey = GetUnitKey(unit)
	if MapModData.RED.UnitData[unitKey] then

		-- first update to unit table
		MapModData.RED.UnitData[unitKey].OwnerID = iNewOwner

		local player = Players[ iNewOwner ]

		-- get position and damage before killing the unit !
		local x = unit:GetX()
		local y = unit:GetY()
		local damage = unit:GetDamage()
		local moves = unit:GetMoves()


		-- create the new unit from the old one
		local newUnit = player:InitUnit(unit:GetUnitType(), x, y)
		newUnit:SetExperience ( unit:GetExperience() )
		newUnit:SetLevel ( unit:GetLevel() )
		newUnit:SetDamage(damage)
		newUnit:SetMoves(moves)
		newUnit:SetName(unit:GetNameNoDesc())
		newUnit:SetOriginalOwner(unit:GetOriginalOwner()) -- so it always return the first unit owner, even after multiple change
		newUnit:SetEmbarked(unit:IsEmbarked())
		for unitPromotion in GameInfo.UnitPromotions() do
			local unitPromotionID = unitPromotion.ID
			if( unit:IsHasPromotion( unitPromotionID ) ) then
				newUnit:SetHasPromotion( unitPromotionID, true )
			end
		end
				
		-- kill old unit
		--unit:SetDamage( unit:GetMaxHitPoints() )
		unit:Kill()

		-- second update to units table
		local newUnitKey = GetUnitKey(newUnit)
		MapModData.RED.UnitData[newUnitKey] = MapModData.RED.UnitData[unitKey]
		MapModData.RED.UnitData[unitKey] = nil
		return newUnit -- in case we want to do something with the new unit...
	else
		Dprint("- WARNING: MapModData.RED.UnitData[unitKey] is nil for ChangeUnitOwner()")
	end
end

-- change unit type for upgrade (note: should not use this function to change to a different numType)
function ChangeUnitType (unit, iType)
	
	local unitKey = GetUnitKey(unit)
	if MapModData.RED.UnitData[unitKey] then

		-- first update to unit table
		MapModData.RED.UnitData[unitKey].TypeID = iType
		MapModData.RED.UnitData[unitKey].Type = GameInfo.Units[iType].Type

		local player = Players[ unit:GetOwner() ]

		-- get position and damage before killing the unit !
		local x = unit:GetX()
		local y = unit:GetY()
		local damage = unit:GetDamage()
		local moves = unit:GetMoves()


		-- create the new unit from the old one
		local newUnit = player:InitUnit(iType, x, y)
		newUnit:SetExperience ( unit:GetExperience() )
		newUnit:SetLevel ( unit:GetLevel() )
		newUnit:SetDamage(damage)
		newUnit:SetMoves(moves)
		newUnit:SetName(unit:GetNameNoDesc())
		newUnit:SetOriginalOwner(unit:GetOriginalOwner()) -- so it always return the first unit owner, even after multiple change
		newUnit:SetEmbarked(unit:IsEmbarked())
		for unitPromotion in GameInfo.UnitPromotions() do
			local unitPromotionID = unitPromotion.ID
			if( unit:IsHasPromotion( unitPromotionID ) ) then
				newUnit:SetHasPromotion( unitPromotionID, true )
			end
		end
				
		-- kill old unit
		--unit:SetDamage( unit:GetMaxHitPoints() )
		unit:Kill()

		-- second update to units table
		local newUnitKey = GetUnitKey(newUnit)
		MapModData.RED.UnitData[newUnitKey] = MapModData.RED.UnitData[unitKey]
		MapModData.RED.UnitData[newUnitKey].CombatXP = 0 -- reset combat XP, as it's a new type
		MapModData.RED.UnitData[unitKey] = nil
		return newUnit -- in case we want to do something with the new unit...
	else
		Dprint("- WARNING: MapModData.RED.UnitData[unitKey] is nil for ChangeUnitType()")
	end
end

-- Track combat XP for Projects based on XP gained.
function UpdateCombatXP(unit)
	local unitKey = GetUnitKey(unit)
	if MapModData.RED.UnitData[unitKey] then
		local combatXP = MapModData.RED.UnitData[unitKey].CombatXP or 0
		local prevXP = MapModData.RED.UnitData[unitKey].TotalXP or 0
		local diffXP = unit:GetExperience() - prevXP
		combatXP = combatXP + diffXP
		Dprint("Updating XP for " .. unit:GetName() ..", gain "..diffXP.."xp from combat, now has "..combatXP.." combatXP / " .. unit:GetExperience() .." totalXP", g_DebugCombat )
		MapModData.RED.UnitData[unitKey].CombatXP = combatXP	
		MapModData.RED.UnitData[unitKey].TotalXP = unit:GetExperience()
		return combatXP
	else
		Dprint("- WARNING: MapModData.RED.UnitData[unitKey] is nil for UpdateCombatXP()", g_DebugCombat)
		return 0
	end
end


function IsBleeding(unit)
	if UNIT_BLEEDING then
		return (    unit:IsHasPromotion( GameInfo.UnitPromotions.PROMOTION_NO_SUPPLY.ID )
				 or unit:IsHasPromotion( GameInfo.UnitPromotions.PROMOTION_NO_SUPPLY_MECHANIZED.ID )
				)
	else
		return false
	end
end

function IsNoSupply(unit)
	return (    unit:IsHasPromotion( GameInfo.UnitPromotions.PROMOTION_NO_SUPPLY.ID )
			 or unit:IsHasPromotion( GameInfo.UnitPromotions.PROMOTION_NO_SUPPLY_SPECIAL_FORCES.ID )
			 or unit:IsHasPromotion( GameInfo.UnitPromotions.PROMOTION_NO_SUPPLY_MECHANIZED.ID )
			)
end

function Disband(unit)
	local iGoldToScrap = unit:GetScrapGold()
	local iPlayer = unit:GetOwner()
	local pPlayer = Players[iPlayer]
	unit:Kill()
	pPlayer:ChangeGold(iGoldToScrap)
	LuaEvents.OnUnitKilled(iPlayer)
end