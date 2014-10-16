local T, C, L = Tukui:unpack()
local Miscellaneous = T["Miscellaneous"]

function JasparUI:AddThreatAltBar()
-- Move AltpowerBar
Miscellaneous.AltPowerBar:ClearAllPoints()
Miscellaneous.AltPowerBar:Point("TOP", UIParent, "TOP", 0, -8)
Miscellaneous.AltPowerBar:CreateBackdrop("Default")
Miscellaneous.AltPowerBar:Size(250, 20)

Miscellaneous.AltPowerBar.Status:ClearAllPoints()
Miscellaneous.AltPowerBar.Status:Point("TOP", UIParent, "TOP", 0, -8)
Miscellaneous.AltPowerBar.Status:SetInside(AltPowerBar)
end