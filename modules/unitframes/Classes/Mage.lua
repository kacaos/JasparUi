T, C, L = Tukui:unpack()
local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local Movers = T["Movers"]

hooksecurefunc(TukuiUnitFrames, "Player", function(Player)
	if (Class == "MAGE") then
		if C.ClassBars.Mage == false then
			Player.ArcaneChargeBar:SetAlpha(0)
			
			Player.Totems:SetAlpha(0)
		else
			local MageMover = CreateFrame("Frame", "Move Mage Classbar", UIParent)
			MageMover:Size(194, 12)
			MageMover:SetPoint("BOTTOM", Player.Power, "TOP", 0, 2)
			
			Player.ArcaneChargeBar:ClearAllPoints()
			Player.ArcaneChargeBar:SetPoint("CENTER", MageMover, "CENTER", 0, 0)
			Player.ArcaneChargeBar:Width(192)
			
			for i = 1, 4 do
				if i == 1 then
					Player.ArcaneChargeBar[i]:Width(48)
				else
					Player.ArcaneChargeBar[i]:Width(47)
				end
			end
			
			Player.Totems:ClearAllPoints()
			Player.Totems:Point("TOP", Player.ArcaneChargeBar, "BOTTOM", 0, -3)
			Player.Totems:Width(192)
			
			for i = 1, 2 do
				if i == 1 then
					Player.Totems:Width(95)
				else
					Player.Totems:Width(95)
				end
			end
			
			Movers:RegisterFrame(MageMover)
		end

			if C.ClassBars.Power == true then
				---------------------------------------------------------
				--Powerbar
				---------------------------------------------------------
				local sPowerBG = CreateFrame("Frame", "sPowerBG",Player.ArcaneChargeBar)
				sPowerBG:Height(10)
				sPowerBG:Point("TOPLEFT", Player.ArcaneChargeBar, "BOTTOMLEFT", -1, -2)
				sPowerBG:Point("TOPRIGHT", Player.ArcaneChargeBar, "BOTTOMRIGHT", 1, -2)
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