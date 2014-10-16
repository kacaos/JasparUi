T, C, L = Tukui:unpack()
local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local Movers = T["Movers"]

hooksecurefunc(TukuiUnitFrames, "Player", function(Player)
	if (Class == "WARRIOR") then
		if C.ClassBars.Warrior == false then
			Player.Totems:SetAlpha(0)
		else
			local WarriorMover = CreateFrame("Frame", "Move Warrior Classbar", UIParent)
			WarriorMover:Size(194, 12)
			WarriorMover:SetPoint("BOTTOM", Player.Power, "TOP", 0, 2)
			
			Player.Totems:ClearAllPoints()
			Player.Totems:SetPoint("CENTER", WarriorMover, "CENTER", 0, 0)
			Player.Totems:Width(192)
			
			Movers:RegisterFrame(WarriorMover)
		end
		
			if C.ClassBars.Power == true then
				---------------------------------------------------------
				--Powerbar
				---------------------------------------------------------
				local sPowerBG = CreateFrame("Frame", "sPowerBG",Player.Totems)
				sPowerBG:Height(10)
				sPowerBG:Point("TOPLEFT", Player.Totems, "BOTTOMLEFT", -1, -2)
				sPowerBG:Point("TOPRIGHT", Player.Totems, "BOTTOMRIGHT", 1, -2)
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