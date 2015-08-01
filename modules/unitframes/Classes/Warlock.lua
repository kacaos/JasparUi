T, C, L = Tukui:unpack()
local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local Movers = T["Movers"]
T.myname = select(1, UnitName("player"))


hooksecurefunc(TukuiUnitFrames, "Player", function(Player)
	if (Class == "WARLOCK") then
		if C.ClassBars.Warlock == false then
			Player.WarlockSpecBars:SetAlpha(0)
		else
			local WarlockMover = CreateFrame("Frame", "Move Warlock Classbar", UIParent)
		
			if (T.myname == "Jâspar") then
				WarlockMover:Size(202, 6)
				WarlockMover:SetPoint("CENTER", UIParent, "CENTER", 0, -100)
				Player.WarlockSpecBars:SetWidth(200)
			else
				WarlockMover:Size(194, 6)
				WarlockMover:SetPoint("CENTER", Player.Power, "CENTER", 0, 6)
				Player.WarlockSpecBars:SetWidth(192)
			end
		
			Player.Totems:SetAlpha(0) -- Dunno why the sometimes appear. Seems to be a bug ?!
			
			Player.WarlockSpecBars:ClearAllPoints()
			Player.WarlockSpecBars:Point("CENTER", WarlockMover, "CENTER", 0, 0)
			Player.WarlockSpecBars:SetHeight(4)
			
			for i = 1, 4 do
				Player.WarlockSpecBars[i]:Height(4)
				Player.WarlockSpecBars[i]:SetStatusBarTexture(C["Medias"].Blank)
			end
			
			Movers:RegisterFrame(WarlockMover)
		
			if C.ClassBars.Power == true then
				---------------------------------------------------------
				--Powerbar
				---------------------------------------------------------
				local sPowerBG = CreateFrame("Frame", "sPowerBG",Player.WarlockSpecBars)
				sPowerBG:Height(10)
				sPowerBG:Point("TOPLEFT", Player.WarlockSpecBars, "BOTTOMLEFT", -1, -2)
				sPowerBG:Point("TOPRIGHT", Player.WarlockSpecBars, "BOTTOMRIGHT", 1, -2)
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
	end
end)