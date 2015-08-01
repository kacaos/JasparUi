T, C, L = Tukui:unpack()
local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local Movers = T["Movers"]

hooksecurefunc(TukuiUnitFrames, "Player", function(Player)
	if (Class == "PRIEST") then
		if C.ClassBars.Priest == false then
			Player.ShadowOrbsBar:SetAlpha(0)
		else
			local PriestMover = CreateFrame("Frame", "Move Priest Classbar", UIParent)
			PriestMover:Size(194, 12)
			PriestMover:SetPoint("BOTTOM", Player.Power, "TOP", 0, 2)
			
			Player.ShadowOrbsBar:ClearAllPoints()
			Player.ShadowOrbsBar:SetPoint("CENTER", PriestMover, "CENTER", 0, 0)
			Player.ShadowOrbsBar:Width(192)
			
			for i = 1, 5 do
				if i == 1 then
					Player.ShadowOrbsBar[i]:Width(36)
				else
					Player.ShadowOrbsBar[i]:Width(38)
				end
			end
			
			Player.Totems:ClearAllPoints()
			Player.Totems:SetPoint("CENTER", PriestMover, "CENTER", 0, 0)
			Player.Totems:Width(192)
			
			Movers:RegisterFrame(PriestMover)
		end
		
		if C.UnitFrames.SerendipityBar then
			Player.SerendipityBar:ClearAllPoints()
			Player.SerendipityBar:Point("BOTTOM", Player.Power, "TOP", 0, 25)
			Player.SerendipityBar:Width(192)
			
			for i = 1, 2 do
				if i == 1 then
					Player.SerendipityBar[i]:Width(192/2)
					Player.SerendipityBar[i]:Point("LEFT", Player.SerendipityBar, "LEFT", 0, 0)
				else
					Player.SerendipityBar[i]:Width(192/2)
					Player.SerendipityBar[i]:Point("RIGHT", Player.SerendipityBar, "RIGHT", 0, 0)
				end
			end
		end
				

			if C.ClassBars.Power == true then
				---------------------------------------------------------
				--Powerbar
				---------------------------------------------------------
				local sPowerBG = CreateFrame("Frame", "sPowerBG",Player.ShadowOrbsBar)
				sPowerBG:Height(10)
				sPowerBG:Point("TOPLEFT", Player.ShadowOrbsBar, "BOTTOMLEFT", -1, -2)
				sPowerBG:Point("TOPRIGHT", Player.ShadowOrbsBar, "BOTTOMRIGHT", 1, -2)
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

hooksecurefunc(TukuiUnitFrames, "UpdatePriestClassBars", function(self)
	local Frame = self:GetParent()
	local Serendipity = Frame.SerendipityBar
	local Totems = Frame.Totems
	local Shadow = Frame.Shadow

	if (Serendipity and Serendipity:IsShown()) and (Totems and Totems:IsShown()) then
		Shadow:Point("TOPLEFT", -4, 21)

		Serendipity:ClearAllPoints()
		Serendipity:Point("BOTTOMLEFT", Frame, "TOPLEFT", 0, 25)
	elseif (Serendipity and Serendipity:IsShown()) or (Totems and Totems:IsShown()) then
		Shadow:Point("TOPLEFT", -4, 12)

		Serendipity:ClearAllPoints()
		Serendipity:Point("BOTTOMLEFT", Frame, "TOPLEFT", 0, 25)
	else
		Shadow:Point("TOPLEFT", -4, 4)
	end
end)
