T, C, L = Tukui:unpack()
local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local Movers = T["Movers"]

hooksecurefunc(TukuiUnitFrames, "Player", function(Player)
	if (Class == "MONK") then
		if C.ClassBars.Monk == false then
			Player.HarmonyBar:SetAlpha(0)
		else
			local MonkMover = CreateFrame("Frame", "Move Monk Classbar", UIParent)
			MonkMover:Size(194, 12)
			MonkMover:SetPoint("BOTTOM", Player.Power, "TOP", 0, 15)
			
			Player.HarmonyBar:ClearAllPoints()
			Player.HarmonyBar:Point("CENTER", MonkMover, "CENTER", 0, 0)
			Player.HarmonyBar:CreateBackdrop()
			Player.HarmonyBar:Width(192)

			Player.Totems:ClearAllPoints()
			Player.Totems:Point("BOTTOM", Player.HarmonyBar, "TOP", 0, 5)
			Player.Totems:CreateBackdrop()
			Player.Totems:Width(192)
			
			Movers:RegisterFrame(MonkMover)
			
			if C.ClassBars.Power == true then
				---------------------------------------------------------
				--Powerbar
				---------------------------------------------------------
				local sPowerBG = CreateFrame("Frame", "sPowerBG",Player.HarmonyBar)
				sPowerBG:Height(12)
				sPowerBG:Point("TOPLEFT", Player.HarmonyBar, "BOTTOMLEFT", -1, -3)
				sPowerBG:Point("TOPRIGHT", Player.HarmonyBar, "BOTTOMRIGHT", 1, -3)
				sPowerBG:SetTemplate("Default")

				local sPowerStatus = CreateFrame("StatusBar", "sPowerStatus", sPowerBG)
				sPowerStatus:SetStatusBarTexture(C["Medias"].Blank)
				sPowerStatus:SetFrameLevel(10)
				sPowerStatus:Point("TOPLEFT", sPowerBG, "TOPLEFT", 1, -1)
				sPowerStatus:Point("BOTTOMRIGHT", sPowerBG, "BOTTOMRIGHT", -1, 1)
				sPowerStatus.t = sPowerStatus:CreateFontString(nil, "OVERLAY")
				sPowerStatus.t:SetPoint("CENTER", -10, 0)
				sPowerStatus.t:SetFont(C["Medias"].PixelFont, 12, "MONOCHROMEOUTLINE")
				sPowerStatus.t:SetShadowColor(0,0,0)		
				sPowerStatus.tt = sPowerStatus:CreateFontString(nil, "OVERLAY")
				sPowerStatus.tt:SetPoint("CENTER", 4, 0)
				sPowerStatus.tt:SetFont(C["Medias"].PixelFont, 12, "MONOCHROMEOUTLINE")
				sPowerStatus.tt:SetShadowColor(0,0,0)		
				sPowerStatus.tz = sPowerStatus:CreateFontString(nil, "OVERLAY")
				sPowerStatus.tz:SetPoint("CENTER", 16, 0)
				sPowerStatus.tz:SetFont(C["Medias"].PixelFont, 12, "MONOCHROMEOUTLINE")
				sPowerStatus.tz:SetShadowColor(0,0,0)
				
				sPowerStatus:SetStatusBarColor(ClassColor.r, ClassColor.g, ClassColor.b)
				local t = 0
				sPowerStatus:SetScript("OnUpdate", function(self, elapsed)
					t = t + elapsed;
					if (t > 0.07) then
						sPowerStatus:SetMinMaxValues(0, UnitPowerMax("player"))
						local power = UnitPower("player")
						local activeRegen = floor(GetPowerRegen())
						sPowerStatus:SetValue(power)
						sPowerStatus.t:SetText(ShortValue(power))
						sPowerStatus.tt:SetText(" | ", activeRegen)
						sPowerStatus.tz:SetText(activeRegen)
					end
				end)
				sPowerStatus:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
				sPowerBG:RegisterEvent("PLAYER_ENTERING_WORLD")
				sPowerBG:RegisterEvent("UNIT_DISPLAYPOWER")
			end
		end
	end
end)