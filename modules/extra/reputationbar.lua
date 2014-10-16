local T, C, L = Tukui:unpack()
local Miscellaneous = T["Miscellaneous"]
local Minimap = T["Maps"].Minimap
local MaxLevel = MAX_PLAYER_LEVEL

if (UnitLevel("player") ~= MaxLevel) then
	return
end

hooksecurefunc(Miscellaneous.Reputation, "Create", function()
		Miscellaneous.Reputation.RepBar2:Kill()
		
		Miscellaneous.Reputation.RepBar1:ClearAllPoints()
		Miscellaneous.Reputation.RepBar1:SetPoint("TOPLEFT", Minimap, "BOTTOMLEFT", 0, -3)
		Miscellaneous.Reputation.RepBar1:Size(Minimap:GetWidth(), 6)
end)

hooksecurefunc(Miscellaneous.Reputation, "SetTooltip", function()
	if (not GetWatchedFactionInfo()) then
		return
	end
	
	if Miscellaneous.Reputation.RepBar1 then
		GameTooltip:SetOwner(Minimap, "ANCHOR_BOTTOM", 0, -11)
	else
		GameTooltip:Hide()
	end
	
	local Name, ID, Min, Max, Value = GetWatchedFactionInfo()
	GameTooltip:AddLine(string.format("%s (%s)", Name, _G["FACTION_STANDING_LABEL" .. ID]))
	GameTooltip:AddLine(string.format("%d / %d (%d%%)", Value - Min, Max - Min, (Value - Min) / (Max - Min) * 100))
	GameTooltip:Show()
end)