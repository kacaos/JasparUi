local T, C, L = Tukui:unpack()
local Miscellaneous = T["Miscellaneous"]
local Minimap = T["Maps"].Minimap
local MaxLevel = MAX_PLAYER_LEVEL

if (UnitLevel("player") == MaxLevel) then
	return
end
	
hooksecurefunc(Miscellaneous.Experience, "Create", function()
	--Remove rightxpbar
	Miscellaneous.Experience.XPBar2:Kill()
	Miscellaneous.Experience.RestedBar2:Kill()
	
	-- Move and resize leftxpbar
	Miscellaneous.Experience.XPBar1:ClearAllPoints()
	Miscellaneous.Experience.XPBar1:SetPoint("TOPLEFT", Minimap, "BOTTOMLEFT", 0, -3)
	Miscellaneous.Experience.XPBar1:Size(Minimap:GetWidth(), 6)
end)

hooksecurefunc(Miscellaneous.Experience, "SetTooltip", function()
	local Current, Max = Miscellaneous.Experience:GetExperience()
	local Rested = GetXPExhaustion()
	local Bars = 20
	
	if Miscellaneous.Experience.XPBar1 then
		GameTooltip:SetOwner(Minimap, "ANCHOR_BOTTOM", 0, -11)
	end
	
	GameTooltip:AddLine(string.format("|cff4BAF4C"..XP..": %d / %d (%d%% - %d/%d)|r", Current, Max, Current / Max * 100, Bars - (Bars * (Max - Current) / Max), Bars))
	
	if Rested then
		GameTooltip:AddLine(string.format("|cff0090FF"..TUTORIAL_TITLE26..": +%d (%d%%)|r", Rested, Rested / Max * 100))
	end
	
	GameTooltip:Show()
end)