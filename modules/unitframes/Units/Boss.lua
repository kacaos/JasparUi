T, C, L = Tukui:unpack()
local TukuiUnitFrames = T["UnitFrames"]
local Font = T.GetFont(C["UnitFrames"].Font)

hooksecurefunc(TukuiUnitFrames, "Boss", function(Boss)
	--------------------------------------------------
	-- General
	--------------------------------------------------
	Boss:SetBackdrop( nil )
	Boss:SetBackdropColor( 0, 0, 0 )
	Boss.Shadow:Kill()

	--------------------------------------------------
	--Health
	--------------------------------------------------
	Boss.Health:Size( 233, 23 )
	Boss.Health:CreateBackdrop("Default")
	Boss.Health.bg:SetVertexColor(.5, .5, .5)

	--------------------------------------------------
	--Power
	--------------------------------------------------
	Boss.Power:Size( 233, 5 )
	Boss.Power:ClearAllPoints()
	Boss.Power:Point( "TOPRIGHT", Boss.Health, "BOTTOMRIGHT", 0, -1 )
	Boss.Power:Point( "TOPLEFT", Boss.Health, "BOTTOMLEFT", 0, -1 )
	Boss.Power:SetFrameLevel( Boss.Health:GetFrameLevel() + 2 )
	Boss.Power:CreateBackdrop("Default")
	
	--------------------------------------------------
	-- Buffs / Debuffs
	--------------------------------------------------
	Boss.Buffs.size = 31
	Boss.Debuffs.size = 31

	--------------------------------------------------
	-- Castbar
	--------------------------------------------------
	if C.UnitFrames.CastBar == true then
		Boss.Castbar:ClearAllPoints()
		Boss.Castbar:SetPoint("TOPRIGHT", Boss, "BOTTOMRIGHT", -1, -4)
		Boss.Castbar:Width(177)
		Boss.Castbar:Height(15)
		Boss.Castbar:CreateBackdrop()

		Boss.Castbar.Time:ClearAllPoints()
		Boss.Castbar.Time:SetPoint("RIGHT", Boss.Castbar, "RIGHT", -4, 0)

		if (C.UnitFrames.CastBarIcon) then
			Boss.Castbar.Button:ClearAllPoints()
			Boss.Castbar.Button:Point("RIGHT", Boss.Castbar, "LEFT", -4, 0)
			Boss.Castbar.Button:Size(19)
		end

		Boss.Castbar.Text:ClearAllPoints()
		Boss.Castbar.Text:SetPoint("LEFT", Boss.Castbar, "LEFT", 4, 0)
	end
end)