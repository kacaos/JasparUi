T, C, L = Tukui:unpack()
local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local Movers = T["Movers"]

hooksecurefunc(TukuiUnitFrames, "Player", function(Player)
	if (Class == "SHAMAN") then
		if C.ClassBars.Shaman == false then
			Player.Totems:SetAlpha(0)
		else
			local TotemMover = CreateFrame("Frame", "Move Totembar", UIParent)
			TotemMover:Size(194, 12)
			TotemMover:SetPoint("BOTTOMLEFT", Player.Power, "TOPLEFT", -1, 1)
			
			Player.Totems:ClearAllPoints()
			Player.Totems:Point("CENTER", TotemMover, "CENTER", 0, 0)
			Player.Totems:Width(192)
			
			for i = 1, 4 do
				if i == 1 then
					Player.Totems[i]:Width(48)
				else
					Player.Totems[i]:Width(47)
				end
			end
			
			Movers:RegisterFrame(TotemMover)
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