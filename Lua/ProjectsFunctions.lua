-- ProjectsFunctions
-- Author: Gedemon
-- DateCreated: 14-Jul-15 15:25:50
--------------------------------------------------------------

include ("ProjectsDefines")

print("Loading Red Projects Functions...")
print("-------------------------------------")

--------------------------------------------------------------
-- Projects functions 
--------------------------------------------------------------
function InitializeProjects()

	local bDebug = true

	Dprint("-------------------------------------")
	Dprint("Initializing new projects...")

	if g_ProjectsAvailableAtStart then
		-- Already researched at start	
		local savedData = Modding.OpenSaveData()
		local startProjectInitialized = savedData.GetValue("FromStartProjects")
		if startProjectInitialized ~=1 then
			for civID, projects in pairs(g_ProjectsAvailableAtStart) do
				for n, projectID in pairs(projects) do
					local projectInfo = GameInfo.Projects[projectID]
					MarkProjectDone(projectID, civID) -- new code
					local saveStr = "Project-"..projectID
					savedData.SetValue(saveStr, 1) -- mark as triggered !
					Dprint ( Locale.ConvertTextKey(projectInfo.Description) .." is completed.", debug )
				end
			end
			savedData.SetValue("FromStartProjects", 1)
		end
	end
	
	if not g_ProjectsTable then
		return
	end

	-- Projects to research
	for id, projectData in pairs(g_ProjectsTable) do	
		local savedData = Modding.OpenSaveData()
		local saveStr = "Project-"..id
		local triggered = savedData.GetValue(saveStr)
		if triggered ~= 1 then -- not triggered yet, test it !

			-- check if other projects are required for this one
			local bMissingProject = false
			local allowedTable = projectData.Projects
			local projectInfo = GameInfo.Projects[id]
			if allowedTable then -- don't check if there is no project prerequested
				for i, projectID in ipairs (allowedTable) do
					if (not IsProjectDone(projectID)) then -- not looking for a specific civs here
						Dprint ( " - " .. Locale.ConvertTextKey(projectInfo.Description) .." lacks pre-required project.", debug )
						bMissingProject = true
					end
				end
			end

			-- check if project is available for this scenario
			local bMissingScenario = true
			local ScenarioList = projectData.Scenarios
			if ScenarioList then 
				for i, scenarioName in ipairs (ScenarioList) do
					if scenarioName == g_Scenario_Name then
						Dprint ( " - " .. Locale.ConvertTextKey(projectInfo.Description) .." available in " .. scenarioName, debug )
						bMissingScenario = false
					end
				end
			else -- no scenario prerequested...
				bMissingScenario = false
			end

			if (not bMissingProject) and (not bMissingScenario) then
				data = projectData.Trigger
				if not data then -- initialize immediatly
					savedData.SetValue(saveStr, 1)
					Dprint ( " - No trigger data, " .. Locale.ConvertTextKey(projectInfo.Description) .." is immediatly available.", debug )
				else
					local bDateCheck = true
					local bXPCheck = true
					local sNotificationString = ""

					local iActivePlayer = Game.GetActivePlayer()
					local iActiveCiv = GetCivIDFromPlayerID(iActivePlayer, false)

					if (data.Type == TRIGGER_DATE or data.Type == TRIGGER_DATE_AND_XP or data.Type == TRIGGER_DATE_OR_XP) then
						if data.Date and data.ProbPerTurn then
							local rand = math.random( 1, 100 )
							local turn = Game.GetGameTurn()
							local date = g_Calendar[turn] or " "
							if data.ProbPerTurn >= rand and date.Number >= data.Date then
								sNotificationString = Locale.ConvertTextKey(projectInfo.Description) .." is now available."
								Dprint ( " - " .. Locale.ConvertTextKey(projectInfo.Description) .." date = Checked ! ( >= ".. tostring(data.Date) .." and Prob ".. tostring(data.ProbPerTurn) .."% >= "..tostring(rand)..")", debug )
							else
								bDateCheck = false
								Dprint ( " - " .. Locale.ConvertTextKey(projectInfo.Description) .." date = Fail ! ( < ".. tostring(data.Date) .." or Prob ".. tostring(data.ProbPerTurn) .."% < "..tostring(rand)..")", debug )
							end
						else						
							Dprint ( " - ERROR: missing data.Date or data.ProbPerTurn for " .. Locale.ConvertTextKey(projectInfo.Description) .." whith Date triggering...", debug )
						end
					end
					if (data.Type == TRIGGER_XP or data.Type == TRIGGER_DATE_AND_XP or data.Type == TRIGGER_DATE_OR_XP) then
						if data.Reference then
							local unitInfo = GameInfo.Units[data.Reference]
							if unitInfo then
								local combatXP = GetTotalCombatXP(data.Reference)
								if combatXP >= data.XP then
									Dprint ( " - " .. Locale.ConvertTextKey(projectInfo.Description) .." Checked ! (XP = ".. tostring(combatXP) .." >= "..tostring(data.XP)..")", debug )							
									sNotificationString = "Based on combat experience with ".. Locale.ConvertTextKey(unitInfo.Description) ..", " .. Locale.ConvertTextKey(projectInfo.Description) .." is now available."
								else
									Dprint ( " - " .. Locale.ConvertTextKey(projectInfo.Description) .." XP = Fail ! (XP = ".. tostring(combatXP) .." < "..tostring(data.XP)..")", debug )
									bXPCheck = false
								end							
							else						
								Dprint ( " - ERROR: no unitInfo found  with data.Reference = " .. tostring(data.Reference) .." for " .. Locale.ConvertTextKey(projectInfo.Description), debug )
							end
						else						
							Dprint ( " - ERROR: no unit in data.Reference for " .. Locale.ConvertTextKey(projectInfo.Description) .." whith XP triggering...", debug )
						end
					end
					if	((data.Type == TRIGGER_XP or data.Type == TRIGGER_DATE) and (bDateCheck and bXPCheck)) -- if data.Type is TRIGGER_XP then bDateCheck is always true and if data.Type is TRIGGER_DATE then bXPCheck is always true...
					 or ((data.Type == TRIGGER_DATE_AND_XP) and (bDateCheck and bXPCheck))
					 or ((data.Type == TRIGGER_DATE_OR_XP) and (bDateCheck or bXPCheck))
					 then
						savedData.SetValue(saveStr, 1)
						if IsProjectOfCiv(id, iActiveCiv) then
							Players[iActivePlayer]:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, sNotificationString, "New Project available !", -1, -1)
						end
						Dprint ( sNotificationString, debug )
					end
				end
			end
		end
	end
end

function PlayerCreateRestriction (iPlayer, iProjectType)
print("calling PlayerCreateRestriction")
	local civID = GetCivIDFromPlayerID(iPlayer, false)

	if IsProjectDone(iProjectType, civID) then
		return false -- don't allow project marked as done for this civ
	end

	-- project available for this player ?
	if IsProjectOfCiv(iProjectType, civID) then
		-- projects triggered ?
		if g_ProjectsTable[iProjectType] then

			if g_ProjectsTable[iProjectType].AIOnly and Players[iPlayer]:IsHuman() then -- some projects are available for the AI only
				return false
			end

			local triggerData = g_ProjectsTable[iProjectType].Trigger
			if triggerData then
				local savedData = Modding.OpenSaveData()
				local saveStr = "Project-"..iProjectType
				local triggered = savedData.GetValue(saveStr)
				if triggered == 1 then
					return true
				end
			else -- project allowed for this nation, but no trigger data defined, return true
				return true
			end
		else
			Dprint ("WARNING: project (ID="..iProjectType..") is not defined in g_ProjectsTable")
		end
	end

	return false
end
--added to GameEvents.PlayerCanCreate

function CityCreateRestriction (iPlayer, iCity, iProjectType)
	local civID = GetCivIDFromPlayerID(iPlayer, false)
	local player = Players [ iPlayer ]
	local city = player:GetCityByID(iCity)
	local bCanCreate = false

	if g_ProjectsTable[iProjectType] then
		local allowedTable = g_ProjectsTable[iProjectType].Buildings
		if (allowedTable) then
			for i, reqBuilding in ipairs (allowedTable) do
				if (city:IsHasBuilding(reqBuilding)) then
					bCanCreate = true
				end
			end
			return bCanCreate
		else
			return true	-- no building defined, return default = true
		end		
	else
		return true	-- no table defined, return default = true	
	end
	return bCanCreate

end
-- added to GameEvents.CityCanCreate

function FinalizeNextPlayerProjects(CurrentPlayerID)
	Dprint ("-------------------------------------")
	Dprint ("Finalize projects of next player...")
	local bDebug = true
	local playerID = GetNextMajorPlayerID(CurrentPlayerID)
	local player = Players[playerID]
	if player then
		for city in player:Cities() do
			local projectID = city:GetProductionProject()
			if projectID ~= -1 then
				local projectInfo = GameInfo.Projects[projectID]
				local str = Locale.ConvertTextKey( projectInfo.Description )
				Dprint (" - " .. city:GetName() .. " is building project : " .. str, bDebug)
				local turnLeft = city:GetProjectProductionTurnsLeft( projectID )
				Dprint ("     - Turn(s) left = " .. turnLeft, bDebug)
				if turnLeft < 2 then
					Dprint ("     - Removing project from build list and mark it as done...", bDebug)
					city:SetProduction(0) -- in case the project is allowed to be build again...
					city:PopOrder()
					local civID = GetCivIDFromPlayerID(playerID)
					if (not CanRepeatProject(projectID)) or (IsMilitaryOperationProject(projectID, civID)) then -- Military operation are marked available again in RedUnitFunctions if they can be produced multiple time
						MarkProjectDone(projectID, civID)
					end
					-- todo : alert all player for some projects only...
					if g_ProjectsTable[projectID].TopSecret then
						player:AddNotification(NotificationTypes.NOTIFICATION_PROJECT_COMPLETED, str .. " is finished", "Project done !", city:GetX(), city:GetY(), projectID, playerID)
					else
						BroadcastNotification(NotificationTypes.NOTIFICATION_PROJECT_COMPLETED, str .. " is finished", "Project done !", city:GetX(), city:GetY(), projectID, playerID )
					end
					LuaEvents.ProjectDone(projectID, civID) -- can use LuaEvents.ProjectDone.Add(anyScenarioFunction) in the scenarios Lua to do special stuff...
				end
			end
		end
	else
		Dprint (" - WARNING ! next player is nil for FinalizeNextPlayerProjects...")
	end
end


--------------------------------------------------------------
-- Projects Utils 
--------------------------------------------------------------

function GetTotalCombatXP(unitTypeID)
	local total = 0
	for key, data in pairs(MapModData.RED.UnitData) do
		if data.TypeID == unitTypeID then
			total = total + data.CombatXP
		end
	end
	return total
end

function IsProjectOfCiv(iProjectType, civID)
	local allowedTable = g_Major_Projects[civID]
	if (allowedTable) then
		for i, allowedType in pairs (allowedTable) do
			if (allowedType == iProjectType) then
				return true
			end
		end
	end
end

function IsProjectDone(iProjectType, civID)
	if not civID then 
		return MapModData.RED.ProjectsDone[iProjectType] -- function can be called with no 2nd argument to check if the project was done by ANY civ.

	elseif MapModData.RED.ProjectsDone[iProjectType] and MapModData.RED.ProjectsDone[iProjectType][civID] then
		return true
	end
	return false
end

function CanRepeatProject(iProjectType)
	return g_ProjectsTable[iProjectType].Repeat
end

function IsMilitaryOperationProject(iProjectType, civID)
	if not g_Military_Project then
		return false
	end
	if not g_Military_Project[civID] then
		return false
	end
	if not g_Military_Project[civID][iProjectType] then
		return false
	end
	return true
end

function MarkProjectNotCompleted(iProjectType, civID)
	MapModData.RED.ProjectsDone[iProjectType] = { [civID] = false}
end

function MarkProjectDone(iProjectType, civID)
	MapModData.RED.ProjectsDone[iProjectType] = { [civID] = true}
end
