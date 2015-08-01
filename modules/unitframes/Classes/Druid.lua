T, C, L = Tukui:unpack()
local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local Movers = T["Movers"]

hooksecurefunc(TukuiUnitFrames, "Player", function(Player)	
	if (Class == "DRUID") then
		Player.DruidMana:ClearAllPoints()
		Player.DruidMana:Point("TOP", Player.Health, "BOTTOM", 0, -3)
		Player.DruidMana:Size(192, 3)
		
		if C.ClassBars.Druid == false then
			Player.EclipseBar:SetAlpha(0)
		else
			local DruidMover = CreateFrame("Frame", "Move Druid Classbar", UIParent)
			DruidMover:Size(194, 10)
			DruidMover:SetPoint("BOTTOM", Player.Power, "TOP", 0, 3)
			
			Player.EclipseBar:ClearAllPoints()
			Player.EclipseBar:Point("CENTER", DruidMover, "CENTER", 0, 0)
			Player.EclipseBar:Size(192, 8)
			
			Player.EclipseBar.Text:ClearAllPoints()
			Player.EclipseBar.Text:Point("BOTTOM", Player.EclipseBar, "TOP", 0, 1)
			
			Player.EclipseBar.SolarBar:Size(192, 8)
			
			Player.EclipseBar.LunarBar:Size(192, 8)
			
			Movers:RegisterFrame(DruidMover)
		end
		
			if C.ClassBars.Power == true then
				---------------------------------------------------------
				--Powerbar
				---------------------------------------------------------
				local sPowerBG = CreateFrame("Frame", "sPowerBG", Player.EclipseBar)
				sPowerBG:Height(10)
				sPowerBG:Point("TOPLEFT", Player.EclipseBar, "BOTTOMLEFT", -1, -2)
				sPowerBG:Point("TOPRIGHT", Player.EclipseBar, "BOTTOMRIGHT", 1, -2)
				sPowerBG:SetTemplate("Transparent")

				local sPowerStatus = CreateFrame("StatusBar", "sPowerStatus", sPowerBG)
				sPowerStatus:SetStatusBarTexture(C["Medias"].Blank)
				sPowerStatus:SetFrameLevel(6)
				sPowerStatus:Point("TOPLEFT", sPowerBG, "TOPLEFT", 1, -1)
				sPowerStatus:Point("BOTTOMRIGHT", sPowerBG, "BOTTOMRIGHT", -1, 1)
				
				sPowerStatus:SetStatusBarColor(ClassColor.r, ClassColor.g, ClassColor.b)
				local t = 0
				sPowerStatus:SetScript("OnUpdate", function(self, elapsed)
					t = t + elapsed;
					if (t > 0.07) then
						sPowerStatus:SetMinMaxValues(0, UnitPowerMax("player"))
						local power = UnitPower("player")
						local activeRegen = floor(GetPowerRegen())
						sPowerStatus:SetValue(power)
					end
				end)
				sPowerStatus:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
				sPowerBG:RegisterEvent("PLAYER_ENTERING_WORLD")
				sPowerBG:RegisterEvent("UNIT_DISPLAYPOWER")	
			end
	end
end)