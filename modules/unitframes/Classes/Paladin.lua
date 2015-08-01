T, C, L = Tukui:unpack()
local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local Movers = T["Movers"]

hooksecurefunc(TukuiUnitFrames, "Player", function(Player)
	if (Class == "PALADIN") then
		if C.ClassBars.Paladin == false then
			Player.HolyPower:SetAlpha(0)
		else
			local PaladinMover = CreateFrame("Frame", "Move Paladin Classbar", UIParent)
			PaladinMover:Size(252, 12)
			PaladinMover:SetPoint("BOTTOM", Player.Power, "TOP", 0, 2)
			
			Player.HolyPower:ClearAllPoints()
			Player.HolyPower:SetPoint("CENTER", PaladinMover, "CENTER", 0, 0)
			Player.HolyPower:Size(192, 8)
			
			for i = 1, 5 do
				if i == 1 then
				Player.HolyPower[i]:Width(36)
				else
				Player.HolyPower[i]:Width(38)
				end
			end
			
			Movers:RegisterFrame(PaladinMover)
			
			if C.UnitFrames.TotemBar == true then
				Player.Totems:ClearAllPoints()
				Player.Totems:SetPoint("BOTTOM", PaladinMover, "TOP", 0, 1)
				Player.Totems:SetWidth(192)
				
				for i = 1, 2 do
					if i == 1 then
						Player.Totems[i]:Width(192/2)
						Player.Totems[i]:Point("LEFT", Player.Totems, "LEFT", 0, 0)
					else
						Player.Totems[i]:Width(192/2)
						Player.Totems[i]:Point("RIGHT", Player.Totems, "RIGHT", 0, 0)
					end
				end
			end
		end
			if C.ClassBars.Power == true then
				---------------------------------------------------------
				--Powerbar
				---------------------------------------------------------
				local sPowerBG = CreateFrame("Frame", "sPowerBG",Player.HolyPower)
				sPowerBG:Height(10)
				sPowerBG:Point("TOPLEFT", Player.HolyPower, "BOTTOMLEFT", -1, -2)
				sPowerBG:Point("TOPRIGHT", Player.HolyPower, "BOTTOMRIGHT", 1, -2)
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