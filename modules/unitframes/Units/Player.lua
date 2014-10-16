T, C, L = Tukui:unpack()
local TukuiUnitFrames = T["UnitFrames"]
local Font = T.GetFont(C["UnitFrames"].Font)
local Class = select(2, UnitClass("player"))
local Panels = T["Panels"]
local Movers = T["Movers"]

hooksecurefunc(TukuiUnitFrames, "Player", function(Player)
	---------------------------------------------------
	--General
	---------------------------------------------------
	Player:SetBackdrop( nil )
	Player:SetBackdropColor( 0, 0, 0 )
	Player.Shadow:Kill()
	Player.Panel:Kill()
	
	Player.Status:ClearAllPoints()
	Player.Status:Point("CENTER", Player.Health, "CENTER", 0, 0)
	
	---------------------------------------------------	
	--Health
	---------------------------------------------------
	Player.Health:Size(192, 25)
	Player.Health:CreateBackdrop("Default")
	Player.Health.bg:SetVertexColor(.5, .5, .5)
	Player.Health.Value:Point( "RIGHT", Player.Health, "RIGHT", -4, 0)

	---------------------------------------------------	
	--Power
	---------------------------------------------------
	if C.UnitFrames.Portrait == true then
		Player.Power:Size(156, 2)
	else
		Player.Power:Size(192, 2)
	end
	Player.Power:ClearAllPoints()
	Player.Power:Point( "BOTTOMLEFT", Player.Health, "TOPLEFT", 0, 3 )
	Player.Power:CreateBackdrop("Default")
	Player.Power.Value:Point( "LEFT", Player.Health, "LEFT", 4, 0)

	---------------------------------------------------
	-- Castbar
	---------------------------------------------------
	if C.UnitFrames.CastBar == true then
		Player.Castbar:ClearAllPoints()
		local CBMover = CreateFrame("Frame", "Move Player Castbar", UIParent)
		CBMover:SetPoint("CENTER", UIParent, "CENTER", 8, -123)
		CBMover:Width(C.CastBars.PlayerWidth)
		CBMover:Height(C.CastBars.PlayerHeight)
		
		Player.Castbar:SetPoint("CENTER", CBMover, "CENTER", 0, 0)
		Player.Castbar:Width(C.CastBars.PlayerWidth)
		Player.Castbar:Height(C.CastBars.PlayerHeight)
		Player.Castbar:CreateBackdrop()

		Player.Castbar.Time:ClearAllPoints()
		Player.Castbar.Time:SetPoint("RIGHT", Player.Castbar, "RIGHT", -4, 0)
	
		if (C.UnitFrames.CastBarIcon) then
			Player.Castbar.Button:ClearAllPoints()
			Player.Castbar.Button:Point("RIGHT", Player.Castbar, "LEFT", -2, 0)
			Player.Castbar.Button:Size(C.CastBars.PCBIconSize)
		end
		
		if (C.UnitFrames.UnlinkCastBar) then
			Player.Castbar.Icon:ClearAllPoints()
			Player.Castbar.Icon:Point("RIGHT", Player.Castbar, "LEFT", -3, 0)
			Player.Castbar.Icon:Size(C.CastBars.PCBIconSize-2)
			
			Player.Castbar.Button:ClearAllPoints()
			Player.Castbar.Button:Point("RIGHT", Player.Castbar, "LEFT", -2, 0)
			Player.Castbar.Button:Size(C.CastBars.PCBIconSize)
		end

		Player.Castbar.Text:ClearAllPoints()
		Player.Castbar.Text:SetPoint("LEFT", Player.Castbar, "LEFT", 4, 0)
		
		Movers:RegisterFrame(CBMover)
	end
	---------------------------------------------------
	-- Classicons
	---------------------------------------------------
	local classicon = CreateFrame( "Frame", Player:GetName() .. "_ClassIconBorder", Player )
	classicon:SetTemplate("Default")
	classicon:Size(27, 27)
	classicon:Point("TOPLEFT", Player.Health, "TOPRIGHT", 2, 1)
			
	local class = classicon:CreateTexture(Player:GetName() .. "_ClassIcon", "ARTWORK")
	class:Point("TOPLEFT", 1, -1)
	class:Point("BOTTOMRIGHT", -1, 1)
	Player.ClassIcon = class

	---------------------------------------------------
	-- Combaticon
	---------------------------------------------------	
	Player.Combat:ClearAllPoints()
	Player.Combat:SetPoint("CENTER", Player.Health, "CENTER", 0, 0)
	
	---------------------------------------------------
	-- Portrait
	---------------------------------------------------
	if C.UnitFrames.Portrait then
		Player.Portrait:Hide()
	end
end)