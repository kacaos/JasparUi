T, C, L = Tukui:unpack()
local TukuiUnitFrames = T["UnitFrames"]
local Font = T.GetFont(C["UnitFrames"].Font)
local Class = select(2, UnitClass("target"))
local Panels = T["Panels"]
local Movers = T["Movers"]

hooksecurefunc(TukuiUnitFrames, "Target", function(Target)
	--------------------------------------------------
	--General
	--------------------------------------------------
	Target:SetBackdrop( nil )
	Target:SetBackdropColor( 0, 0, 0 )
	Target.Shadow:Kill()
	Target.Panel:Kill()

	---------------------------------------------------
	--Health
	---------------------------------------------------
	Target.Health:Size( 192, 25 )
	Target.Health:CreateBackdrop("Default")
	Target.Health.bg:SetVertexColor(.5, .5, .5)
	Target.Health.Value:Point( "RIGHT", Target.Health, "RIGHT", -4, 0)
	
	---------------------------------------------------	
	--Power
	---------------------------------------------------
	if C.UnitFrames.Portrait == true then
		Target.Power:Size(156, 2)
	else
		Target.Power:Size(192, 2)
	end
	Target.Power:ClearAllPoints()
	Target.Power:Point( "BOTTOMLEFT", Target.Health, "TOPLEFT", 0, 3 )
	Target.Power:SetFrameLevel( Target.Health:GetFrameLevel() + 2 )
	Target.Power:CreateBackdrop("Default")
	Target.Power.Value:Point( "LEFT", Target.Health, "LEFT", 4, 0 )

	---------------------------------------------------
	-- Name
	---------------------------------------------------
	Target.Name:ClearAllPoints()
	Target.Name:SetParent(Target.Health)
	Target:Tag(Target.Name, "[Tukui:GetNameColor][Tukui:NameMedium] [Tukui:DiffColor][level] [shortclassification]")

	---------------------------------------------------
	-- Debuffs / Buffs
	---------------------------------------------------
	Target.Debuffs:ClearAllPoints()
	Target.Debuffs:Point("BOTTOMLEFT", Target.Buffs, "TOPLEFT", -2, 3)
	Target.Debuffs:SetWidth(196)

	Target.Buffs:SetWidth(196)	
	Target.Buffs.numRow = 7
	Target.Buffs.num = 7

	---------------------------------------------------
	-- Castbar
	---------------------------------------------------
	if C.UnitFrames.CastBar == true then
		local CBTMover = CreateFrame("Frame", "Move Target Castbar", UIParent)
		CBTMover:SetPoint("CENTER", UIParent, "CENTER", 0, 200)
		CBTMover:Width(C.CastBars.TargetWidth)
		CBTMover:Height(C.CastBars.TargetHeight)
		
		Target.Castbar:ClearAllPoints()
		Target.Castbar:SetPoint("CENTER", CBTMover, "CENTER", 0, 0)
		Target.Castbar:Width(C.CastBars.TargetWidth)
		Target.Castbar:Height(C.CastBars.TargetHeight)
		Target.Castbar:CreateBackdrop()

		Target.Castbar.Time:ClearAllPoints()
		Target.Castbar.Time:SetPoint("RIGHT", Target.Castbar, "RIGHT", -4, 0)

		if (C.UnitFrames.CastBarIcon) then
			Target.Castbar.Button:ClearAllPoints()
			Target.Castbar.Button:Point("CENTER", Target.Castbar, "CENTER", 0, 33)
			Target.Castbar.Button:Size(C.CastBars.TCBIconSize)
		end
		
		if (C.UnitFrames.UnlinkCastBar) then
			Target.Castbar.Icon:ClearAllPoints()
			Target.Castbar.Icon:Point("CENTER", Target.Castbar, "CENTER", 0, 33)
			Target.Castbar.Icon:Size(C.CastBars.TCBIconSize-2)
			
			Target.Castbar.Button:ClearAllPoints()
			Target.Castbar.Button:Point("CENTER", Target.Castbar, "CENTER", 0, 33)
			Target.Castbar.Button:Size(C.CastBars.TCBIconSize)
		end

		Target.Castbar.Text:ClearAllPoints()
		Target.Castbar.Text:SetPoint("LEFT", Target.Castbar, "LEFT", 4, 0)
		
		Movers:RegisterFrame(CBTMover)
	end
	---------------------------------------------------
	-- Combopoints
	---------------------------------------------------
	if C.ClassBars.Combo == false then
		Target.ComboPointsBar:SetAlpha(0)
	else
		local ComboMover = CreateFrame("Frame", "Move Combopoints", UIParent)
		ComboMover:Size(194, 10)
		ComboMover:SetPoint("BOTTOM", Target.Power, "TOP", -555, 15)

		Target.ComboPointsBar:ClearAllPoints()
		Target.ComboPointsBar:Point("CENTER", ComboMover, "CENTER", 0, 0)
		Target.ComboPointsBar:Size(192,8)
		Target.ComboPointsBar:CreateBackdrop()
		
		for i = 1, 5 do
			if i == 1 then
				Target.ComboPointsBar[i]:Width(36)
			else
				Target.ComboPointsBar[i]:Width(38)
			end
		end
		
		Movers:RegisterFrame(ComboMover)
	end
	
	---------------------------------------------------
	-- Classicons
	---------------------------------------------------
	local classicon = CreateFrame( "Frame", Target:GetName() .. "_ClassIconBorder", Target)
	classicon:SetTemplate("Default")
	classicon:Size(27, 27)
	classicon:Point("TOPRIGHT", Target.Health, "TOPLEFT", -2, 1)
			
	local class = classicon:CreateTexture(Target:GetName() .. "_ClassIcon", "ARTWORK")
	class:Point("TOPLEFT", 1, -1)
	class:Point("BOTTOMRIGHT", -1, 1)
	Target.ClassIcon = class

	---------------------------------------------------
	-- Portrait
	---------------------------------------------------
	if C.UnitFrames.Portrait then
		Target.Portrait:Hide()
	end
end)

