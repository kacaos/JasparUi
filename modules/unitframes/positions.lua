local T, C, L, G = unpack( Tukui )
local TukuiUnitFrames = T["UnitFrames"]
local Panels = T["Panels"]

-- Size & Position
hooksecurefunc(TukuiUnitFrames, "CreateUnits", function()
	local Player = TukuiUnitFrames.Units.Player
	local Target = TukuiUnitFrames.Units.Target
	local ToT = TukuiUnitFrames.Units.TargetOfTarget
	local Pet = TukuiUnitFrames.Units.Pet
	local Target = TukuiUnitFrames.Units.Target
	local Focus = TukuiUnitFrames.Units.Focus
	local FocusTarget = TukuiUnitFrames.Units.FocusTarget
	local Party = TukuiUnitFrames.Headers.Party
	local Raid = TukuiUnitFrames.Headers.Raid
	local RaidPet = TukuiUnitFrames.Headers.RaidPet
	local Boss = TukuiUnitFrames.Units.Boss[1]
	local Arena = TukuiUnitFrames.Units.Arena[1]
	
	---------------------------------------------
	-- Size
	---------------------------------------------
	Player:Size(192, 25)
	Target:Size(192, 25)
	ToT:Size(80, 15)
	Pet:Size(80, 15)
	
	---------------------------------------------
	-- Position	
	---------------------------------------------
	Player:ClearAllPoints()	
	Player:SetPoint("BOTTOMLEFT", TukuiUnitFrames.Anchor, "TOPLEFT", -30, 150)
	
	Target:ClearAllPoints()	
	Target:SetPoint("BOTTOMRIGHT", TukuiUnitFrames.Anchor, "TOPRIGHT", 30, 150)
	
	ToT:ClearAllPoints()	
	if C.UnitFrames.Portrait == true then
		ToT:SetPoint("TOPRIGHT", Target, "BOTTOMRIGHT", -37, -3)
	else
		ToT:SetPoint("TOPRIGHT", Target, "BOTTOMRIGHT", 0, -3)
	end
	
	Pet:ClearAllPoints()	
	if C.UnitFrames.Portrait == true then
		Pet:SetPoint("TOPLEFT", Player, "BOTTOMLEFT", 37, -3)
	else
		Pet:SetPoint("TOPLEFT", Player, "BOTTOMLEFT", 0, -3)
	end
	
	Raid:ClearAllPoints()	
	Raid:SetPoint("BOTTOMLEFT", Panels.LeftChatBG, "TOPLEFT", 0, 15)
	
	Focus:ClearAllPoints()	
	Focus:SetPoint("CENTER", UIParent, "CENTER", -400, 0)
	
	Boss:ClearAllPoints()	
	Boss:SetPoint("CENTER", UIParent, "CENTER", 550, -150)
	
	Arena:ClearAllPoints()	
	Arena:SetPoint("CENTER", UIParent, "CENTER", 550, -150)

	RaidPet:ClearAllPoints()
	RaidPet:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -2000)
end)