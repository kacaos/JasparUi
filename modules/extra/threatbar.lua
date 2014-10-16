local T, C, L = Tukui:unpack()
local Miscellaneous = T["Miscellaneous"]

function JasparUI:AddThreatAltBar()
-- Setup ThreatBar
Miscellaneous.ThreatBar:ClearAllPoints()
Miscellaneous.ThreatBar:CreateBackdrop("Default")
Miscellaneous.ThreatBar:Size(7, 112)
Miscellaneous.ThreatBar:Point("RIGHT", UIParent, "BOTTOMRIGHT", -377, 63)
Miscellaneous.ThreatBar.Text:Hide()
Miscellaneous.ThreatBar.Title:Hide()
Miscellaneous.ThreatBar:SetOrientation("VERTICAL")
end