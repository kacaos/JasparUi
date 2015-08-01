local T, C, L = Tukui:unpack()
local Tooltip = T["Tooltips"]
local Panels = T["Panels"]
local Colors = T.Colors
local RaidColors = RAID_CLASS_COLORS
local HealthBar = GameTooltipStatusBar

hooksecurefunc(Tooltip, "CreateAnchor", function()
	Tooltip.Anchor:ClearAllPoints()
	Tooltip.Anchor:SetPoint("BOTTOMRIGHT", RightChatBG, -5, 125)
end)

hooksecurefunc(Tooltip, "SetColor", function()
	if Player then
		local Class = select(2, UnitClass(Unit))
		local Color = Colors.class[Class]
		R, G, B = Color[1], Color[2], Color[3]
		
		HealthBar:SetStatusBarColor(R, G, B)

	elseif Reaction then
		local Color = Colors.reaction[Reaction]
		R, G, B = Color[1], Color[2], Color[3]
		
		HealthBar:SetStatusBarColor(R, G, B)
		
	else
		Tooltip:SetBackdropBorderColor(unpack(C["General"].BorderColor))
		HealthBar.Backdrop:SetBackdropBorderColor(unpack(C["General"].BorderColor))

	end
end)

hooksecurefunc(Tooltip, "Enable", function()
	HealthBar:ClearAllPoints()
	HealthBar:Point("BOTTOMLEFT", HealthBar:GetParent(), "TOPLEFT", 0, 2)
	HealthBar:Point("BOTTOMRIGHT", HealthBar:GetParent(), "TOPRIGHT", 0, 2)
	HealthBar:Height(10)
	
	if C["Tooltips"].UnitHealthText then
		HealthBar.Text:SetFont(HealthBar.Text:GetFont(), 12, "MONOCHROMEOUTLINE")
		HealthBar.Text:Point("CENTER", HealthBar, "CENTER", 0, 2)
	end
end)