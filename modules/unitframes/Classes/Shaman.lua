T, C, L = Tukui:unpack()
local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local Movers = T["Movers"]
T.myname = select(1, UnitName("player"))

hooksecurefunc(TukuiUnitFrames, "Player", function(Player)
	if (Class == "SHAMAN") then
		if C.ClassBars.Shaman == false then
			Player.Totems:SetAlpha(0)
		else
			local TotemMover = CreateFrame("Frame", "Move Totembar", UIParent)

			if (T.myname == "Jaspâr") then
				TotemMover:Size(202, 6)
				TotemMover:SetPoint("CENTER", UIParent, "CENTER", 0, -98)
				Player.Totems:SetWidth(200)
				
				for i = 1, 4 do
					if i == 1 then
						Player.Totems[i]:Width(50)
					else
						Player.Totems[i]:Width(49)
					end
				end
			else
				TotemMover:Size(194, 6)
				TotemMover:SetPoint("CENTER", Player.Power, "CENTER", 0, 8)
				Player.Totems:SetWidth(192)
				
				for i = 1, 4 do
					if i == 1 then
						Player.Totems[i]:Width(48)
					else
						Player.Totems[i]:Width(47)
					end
				end
			end
			

			
			Player.Totems:ClearAllPoints()
			Player.Totems:SetHeight(6)
			Player.Totems:Point("CENTER", TotemMover, "CENTER", 0, 0)
			

			
			Movers:RegisterFrame(TotemMover)
		end
		
			if C.ClassBars.Power == true then
				---------------------------------------------------------
				--Powerbar
				---------------------------------------------------------
				local sPowerBG = CreateFrame("Frame", "sPowerBG",Player.Totems)
				sPowerBG:Height(10)
				sPowerBG:Point("TOPLEFT", Player.Totems, "BOTTOMLEFT", -1, -3)
				sPowerBG:Point("TOPRIGHT", Player.Totems, "BOTTOMRIGHT", 1, -3)
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