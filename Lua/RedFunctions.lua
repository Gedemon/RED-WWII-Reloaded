-- R.E.D. common Functions
-- Author: Gedemon
-- DateCreated: 14-Jul-15 15:25:50
--------------------------------------------------------------

print("Loading Red Generic Functions...")
print("-------------------------------------")



----------------------------------------------------------------------------------------------------------------------------
-- Supply Lines
----------------------------------------------------------------------------------------------------------------------------

-- Show selected unit supply line
function OnUnitSelect( playerID, unitID, i, j, k, isSelected )

	Game.HideSupplyLine()

    if( Players[ playerID ] == nil or
		not Players[ playerID ]:IsAlive() or
        Players[ playerID ]:GetUnitByID( unitID ) == nil or
        Players[ playerID ]:GetUnitByID( unitID ):IsDead() )
    then
        return
    end
    
	if OptionsManager.GetShowTradeOn() then
		local pUnit = Players[ playerID ]:GetUnitByID( unitID )
		pUnit:ShowSupplyLine()
	end
    
end
Events.UnitSelectionChanged.Add( OnUnitSelect )
function OnShowTradeToggled( bIsChecked )
	 if bIsChecked then
	 	local pUnit = UI.GetHeadSelectedUnit();
		if not pUnit then return; end
		pUnit:ShowSupplyLine()
	 else
		Game.HideSupplyLine()
	 end
end
Events.Event_ToggleTradeRouteDisplay.Add( OnShowTradeToggled )


----------------------------------------------------------------------------------------------------------------------------
-- Calendar
----------------------------------------------------------------------------------------------------------------------------
function SetTurnDate()
	if MapModData.RED and MapModData.RED.Calendar then
		local turn = Game.GetGameTurn()
		local calendar = MapModData.RED.Calendar
		Game.SetDateString(calendar[turn].Text or "You should really end this war now !")
		Game.SetNumeralDate(calendar[turn].Number or REAL_WORLD_ENDING_DATE)
		Events.SerialEventGameDataDirty()
	end
end