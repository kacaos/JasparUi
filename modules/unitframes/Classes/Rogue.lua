T, C, L = Tukui:unpack()
local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local Movers = T["Movers"]

hooksecurefunc(TukuiUnitFrames, "Player", function(Player)
	if (Class == "ROGUE") then
		if C.UnitFrames.AnticipationBar then
			local AnticipationMover = CreateFrame("Frame", "Move Combopoints", UIParent)
			AnticipationMover:Size(194, 10)
			AnticipationMover:SetPoint("BOTTOM", Player.Power, "TOP", 0, 30)
			
			Player.AnticipationBar:ClearAllPoints()
			Player.AnticipationBar:Point("CENTER", AnticipationMover, "CENTER", 0, 0)
			Player.AnticipationBar:Size(192,8)
			
			for i = 1, 5 do
				if i == 1 then
					Player.AnticipationBar[i]:Width(36)
				else
					Player.AnticipationBar[i]:Width(38)
				end
			end	

		Movers:RegisterFrame(AnticipationMover)
		end
	end
end)