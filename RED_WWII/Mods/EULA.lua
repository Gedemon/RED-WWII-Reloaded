-------------------------------------------------
-- EULA Screen
-------------------------------------------------
g_HasAcceptedEULA = false;
include( "RED_Version" );


function OnAccept()
	g_HasAcceptedEULA = true;
	NavigateForward();
end

--------------------------------------------------
-- Navigation Routines
--------------------------------------------------
function NavigateBack()
	UIManager:DequeuePopup( ContextPtr );
end

function NavigateForward()
	UIManager:DequeuePopup(	ContextPtr );
	UIManager:QueuePopup( Controls.ModsBrowser, PopupPriority.ModsBrowserScreen );
end

--------------------------------------------------
-- Explicit Event Handlers
--------------------------------------------------
ContextPtr:SetInputHandler(function(uiMsg, wParam, lParam)

	if uiMsg == KeyEvents.KeyDown then
		if wParam == Keys.VK_ESCAPE then
			NavigateBack();
		end
	end

	return true;
end);

ContextPtr:SetShowHideHandler(function(isHide)
    --UNCOMMENT THIS BLOCK IF YOU WISH TO ONLY 
    --SHOW THE EULA ONCE PER APPLICATION RUN
    --if not isHide and g_HasAcceptedEULA then
	--	NavigateForward();
	--end
	
	--if(not isHide and g_QueueEulaToHide) then
	--	NavigateBack();
	--end
	
	-- <<<<< RED WWII Edition
	if not isHide then
		local latestREDVersion = Modding.GetLatestInstalledModVersion(g_RED_WWII_ID);
		local modUserData = Modding.OpenUserData(g_RED_WWII_ID, latestREDVersion);
		local forceModActivation = modUserData.GetValue("forceModActivation");
		if forceModActivation == 1 then
			NavigateForward(); -- we could always skip the EULA, but do it only when RED is requesting automatic initialization, show some respect to the legal reasons which cause it to be displayed every time...
		end
	end
	-- RED RED WWII Edition >>>>>
end);

-- For now, we don't need to track any sort of acknowledgement of the policy.
Controls.AcceptButton:RegisterCallback( Mouse.eLClick, OnAccept);
Controls.DeclineButton:RegisterCallback( Mouse.eLClick, NavigateBack);
