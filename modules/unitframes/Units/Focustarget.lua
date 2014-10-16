T, C, L = Tukui:unpack()
local TukuiUnitFrames = T["UnitFrames"]
local Font = T.GetFont(C["UnitFrames"].Font)

hooksecurefunc(TukuiUnitFrames, "FocusTarget", function(FocusTarget)
	--------------------------------------------------
	--General
	--------------------------------------------------
	FocusTarget:SetBackdrop( nil )
	FocusTarget:SetBackdropColor( 0, 0, 0 )
	FocusTarget.Shadow:Kill()

	--------------------------------------------------
	--Health
	--------------------------------------------------
	FocusTarget.Health:Size( 200, 20 )
	FocusTarget.Health:CreateBackdrop("Default")
	FocusTarget.Health.bg:SetVertexColor(.5, .5, .5)
	FocusTarget.Health.Value:Point( "LEFT", FocusTarget.Health, "LEFT", 4, 0 )

	--------------------------------------------------
	--Power
	--------------------------------------------------
	FocusTarget.Power:Size( 233, 5 )
	FocusTarget.Power:ClearAllPoints()
	FocusTarget.Power:Point( "TOPRIGHT", FocusTarget.Health, "BOTTOMRIGHT", 0, 0 )
	FocusTarget.Power:Point( "TOPLEFT", FocusTarget.Health, "BOTTOMLEFT", 0, 0 )
	FocusTarget.Power:SetFrameLevel( FocusTarget.Health:GetFrameLevel() + 2 )
	FocusTarget.Power:CreateBackdrop("Default")
	FocusTarget.Power.Value:Point( "RIGHT", FocusTarget.Health, "RIGHT", -4, 0 )

	--------------------------------------------------
	-- Name
	--------------------------------------------------
	FocusTarget.Name:ClearAllPoints()
	FocusTarget.Name:SetParent(FocusTarget.Health)
	FocusTarget.Name:Point("CENTER", FocusTarget.Health, "CENTER", 0, 0)

	--------------------------------------------------
	-- Castbar
	--------------------------------------------------
	if C.UnitFrames.CastBar == true then
		FocusTarget.Castbar:ClearAllPoints()
		FocusTarget.Castbar:SetPoint("TOPRIGHT", FocusTarget, "BOTTOMRIGHT", -1, 0)
		FocusTarget.Castbar:Width(FocusTarget.Health:GetWidth()-24)
		FocusTarget.Castbar:Height(15)

		FocusTarget.Castbar.Time:ClearAllPoints()
		FocusTarget.Castbar.Time:SetPoint("RIGHT", FocusTarget.Castbar, "RIGHT", -4, 0)

		if (C.UnitFrames.CastBarIcon) then
			FocusTarget.Castbar.Button:ClearAllPoints()
			FocusTarget.Castbar.Button:Point("RIGHT", FocusTarget.Castbar, "LEFT", -5, 0)
			FocusTarget.Castbar.Button:Size(19)
		end

		FocusTarget.Castbar.Text:ClearAllPoints()
		FocusTarget.Castbar.Text:SetPoint("LEFT", FocusTarget.Castbar, "LEFT", 4, 0)
	end
end)