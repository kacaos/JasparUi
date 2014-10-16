T, C, L = Tukui:unpack()
local TukuiUnitFrames = T["UnitFrames"]
local Font = T.GetFont(C["UnitFrames"].Font)

hooksecurefunc(TukuiUnitFrames, "TargetOfTarget", function(TargetOfTarget)
	--------------------------------------------------
	--General
	--------------------------------------------------
	TargetOfTarget:SetBackdrop( nil )
	TargetOfTarget:SetBackdropColor( 0, 0, 0 )
	TargetOfTarget.Shadow:Kill()
	TargetOfTarget.Panel:Kill()

	--------------------------------------------------
	--Health
	--------------------------------------------------
	TargetOfTarget.Health:Size( 80, 15 )
	TargetOfTarget.Health:CreateBackdrop("Default")
	TargetOfTarget.Health.bg:SetVertexColor(.5, .5, .5)

	--------------------------------------------------
	-- Name
	--------------------------------------------------
	TargetOfTarget.Name:ClearAllPoints()
	TargetOfTarget.Name:SetParent(TargetOfTarget.Health)
	TargetOfTarget.Name:Point("CENTER", TargetOfTarget.Health, "CENTER", 0, 0)
	TargetOfTarget:Tag(TargetOfTarget.Name, "[Tukui:GetNameColor][Tukui:NameShort]")

end)