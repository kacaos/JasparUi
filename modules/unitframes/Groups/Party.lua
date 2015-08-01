T, C, L = Tukui:unpack()
local TukuiUnitFrames = T["UnitFrames"]
local Font = T.GetFont(C["UnitFrames"].Font)
local Class = select(2, UnitClass("player"))

hooksecurefunc(TukuiUnitFrames, "Party", function(Frame)
	--------------------------------------------------
	-- General
	--------------------------------------------------
	Frame:SetBackdrop( nil )
	Frame:SetBackdropColor( 0, 0, 0 )
	Frame.Shadow:Kill()

	--------------------------------------------------
	-- Health
	--------------------------------------------------
	Frame.Health:Size(220, 20)
	Frame.Health:CreateBackdrop("Default")
	Frame.Health:SetFrameLevel(1)
	Frame.Health.bg:SetVertexColor(.5, .5, .5)

	--------------------------------------------------
	-- Power
	--------------------------------------------------
	Frame.Power:ClearAllPoints()
	Frame.Power:Width(80)
	Frame.Power:Height(5)
	Frame.Power:ClearAllPoints()
	Frame.Power:Point( "TOPRIGHT", Frame.Health, "BOTTOMRIGHT", -15, 3 )
	Frame.Power:SetFrameLevel( Frame.Health:GetFrameLevel() + 2 )
	Frame.Power:CreateBackdrop("Default")

	--------------------------------------------------
	-- Name
	--------------------------------------------------
	Frame.Name:ClearAllPoints()
	Frame.Name:SetPoint("LEFT", Frame.Health, "LEFT", 5, 0)

	--------------------------------------------------
	-- Buffs / Debuffs
	--------------------------------------------------
	Frame.Buffs:SetPoint("TOPLEFT", Frame, "BOTTOMLEFT", 0, -3)
	Frame.Buffs:Hide()
	
	Frame.Debuffs:Point("TOPLEFT", Frame, "TOPRIGHT", 2, 1)
	Frame.Debuffs.size = 22
	Frame.Debuffs.spacing = 1

	--------------------------------------------------
	-- Leader Icon
	--------------------------------------------------
	Frame.Leader:ClearAllPoints()
	Frame.Leader:SetPoint("TOPRIGHT", Frame, "TOPLEFT", 18, 11)

	--------------------------------------------------
	-- Masterlooter Icon
	--------------------------------------------------
	Frame.MasterLooter:ClearAllPoints()
	Frame.MasterLooter:SetPoint("TOPRIGHT", Frame, "TOPLEFT", 32, 11)
	Frame.MasterLooter:Size(14, 14)
	
	---------------------------------------------------
	-- Portrait
	---------------------------------------------------
	if C.Party.Portrait then
		Frame.Portrait:ClearAllPoints()
		Frame.Portrait:SetPoint("CENTER", Frame.Health, "CENTER", 0, 0)
		Frame.Portrait:Size(162, 20)
		Frame.Portrait.Backdrop:SetBackdrop(nil)
		Frame.Portrait:SetAlpha(.2)
		
		Frame.Health:ClearAllPoints()
		Frame.Health:SetPoint("TOPLEFT", 0, 0)
		Frame.Health:SetPoint("TOPRIGHT")
	end
	
	---------------------------------------------------
	-- RaidIcon
	---------------------------------------------------
	Frame.RaidIcon:ClearAllPoints()
	Frame.RaidIcon:SetSize(20, 20)
	Frame.RaidIcon:SetPoint("CENTER", Frame, "CENTER", 0, 14)
end)

function TukuiUnitFrames:GetPartyFramesAttributes()
	return
		"TukuiParty",
		nil,
		"custom [@raid6,exists] hide;show", 
		"oUF-initialConfigFunction", [[
			local header = self:GetParent()
			self:SetWidth(header:GetAttribute("initial-width"))
			self:SetHeight(header:GetAttribute("initial-height"))
		]],
		"initial-width", C.Party.Portrait and T.Scale(162) or T.Scale(206),
		"initial-height", C.Party.Portrait and T.Scale(24) or T.Scale(40),
		"showSolo", false,
		"showParty", true, 
		"showPlayer", C["Party"].ShowPlayer,
		"showRaid", true,
		"groupFilter", "1,2,3,4,5,6,7,8", 
		"groupingOrder", "1,2,3,4,5,6,7,8", 
		"groupBy", "GROUP", 
		"yOffset", T.Scale(-66)	
end