local T, C, L = Tukui:unpack()
local Miscellaneous = T["Miscellaneous"]
local ThreatBar = Miscellaneous.ThreatBar

if C.Misc.ThreatBarEnable ~= true then
	return
end

hooksecurefunc(ThreatBar, "Create", function()
	ThreatBar:ClearAllPoints()
	ThreatBar:Size(7, 112)
	ThreatBar:Point("RIGHT", UIParent, "BOTTOMRIGHT", -377, 63)
	ThreatBar.Text:Hide()
	ThreatBar.Title:Hide()
	ThreatBar:SetOrientation("VERTICAL")
	ThreatBar:CreateBackdrop()
	
	ThreatBar.Background:Hide()
end)


