T, C, L = Tukui:unpack()
local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local Movers = T["Movers"]

hooksecurefunc(TukuiUnitFrames, "Player", function(Player)	
	if (Class == "DEATHKNIGHT") then
		if C.ClassBars.Deathknight == false then
			Player.Runes:SetAlpha(0)
		else
			local DKMover = CreateFrame("Frame", "Move Deathknight Classbar", UIParent)
			DKMover:Size(194, 12)
			DKMover:SetPoint("BOTTOM", Player.Power, "TOP", 0, 2)
			
			Player.Runes:ClearAllPoints()
			Player.Runes:Point("CENTER", DKMover, "CENTER", 0, 0)
			Player.Runes:Size(192, 8)
			
			for i = 1, 6 do
				if i == 1 then
					Player.Runes[i]:Width(32)
				else
					Player.Runes[i]:Width(31)
				end
			end
			
			Movers:RegisterFrame(DKMover)
		end
		
			if C.ClassBars.Power == true then
				---------------------------------------------------------
				--Powerbar
				---------------------------------------------------------
				local sPowerBG = CreateFrame("Frame", "sPowerBG",Player.Runes)
				sPowerBG:Height(10)
				sPowerBG:Point("TOPLEFT", Player.Runes, "BOTTOMLEFT", -1, -2)
				sPowerBG:Point("TOPRIGHT", Player.Runes, "BOTTOMRIGHT", 1, -2)
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