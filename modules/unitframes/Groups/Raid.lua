T, C, L = Tukui:unpack()
local TukuiUnitFrames = T["UnitFrames"]
local Font = T.GetFont(C["UnitFrames"].Font)
local Class = select(2, UnitClass("player"))
local Panels = T["Panels"]



function TukuiUnitFrames:GetRaidFramesAttributes()
	local height
	if C.Raid.ShowHealthText == true and C.Raid.MaxUnitPerColumn == 1 then
		height = T.Scale(15)
	elseif C.Raid.MaxUnitPerColumn == 1 then
		height = T.Scale(15)
	elseif C.Raid.ShowHealthText == true then
		height = T.Scale(30)
	else
		height = T.Scale(21)
	end

	local onecolumn
	if C.Raid.MaxUnitPerColumn == 1 then
		onecolumn = 40
	else
		onecolumn = math.ceil(40/5)
	end
	
	local Properties = C.Party.Enable and "custom [@raid6,exists] show;hide" or "solo,party,raid"
	
	return
		"TukuiRaid", 
		nil, 
		Properties,
		"oUF-initialConfigFunction", [[
			local header = self:GetParent()
			self:SetWidth(header:GetAttribute("initial-width"))
			self:SetHeight(header:GetAttribute("initial-height"))
		]],
		"initial-width", T.Scale(71),
		"initial-height", height,
		"showParty", true,
		"showRaid", true,
		"showPlayer", true,
		"showSolo", false,
		"xoffset", T.Scale(4),
		"yOffset", T.Scale(-4),
		"point", "LEFT",
		"groupFilter", "1,2,3,4,5,6,7,8",
		"groupingOrder", "1,2,3,4,5,6,7,8",
		"groupBy", C["Raid"].GroupBy.Value,
		"maxColumns", onecolumn,
		"unitsPerColumn", C["Raid"].MaxUnitPerColumn,
		"columnSpacing", T.Scale(4),
		"columnAnchorPoint", "TOP"
end

hooksecurefunc(TukuiUnitFrames, "Raid", function(Raid)
	--------------------------------------------------
	-- General
	--------------------------------------------------
	Raid:SetBackdropColor( 0, 0, 0 )
	Raid.Shadow:Kill()
	Raid.Panel:Kill()
	
	--------------------------------------------------
	-- Power
	--------------------------------------------------
	Raid.Power:CreateBackdrop("Default")
	Raid.Power:Point("TOP", Raid.Health, "BOTTOM", 0, 0)
	Raid.Power:SetHeight(2)
	
	--------------------------------------------------
	-- Health
	--------------------------------------------------
	if C.Raid.ShowHealthText == true and C.Raid.MaxUnitPerColumn == 1 then
		Raid.Health:Height(13)
	elseif C.Raid.MaxUnitPerColumn == 1 then
		Raid.Health:Height(13)
	elseif C.Raid.ShowHealthText == true then
		Raid.Health:Height(28)
	else
		Raid.Health:Height(19)
	end
	Raid.Health:CreateBackdrop("Default")
	Raid.Health.bg:SetVertexColor(.5, .5, .5)

	--------------------------------------------------
	-- Name
	--------------------------------------------------
	Raid.Name:ClearAllPoints()
	Raid.Name:SetParent(Raid.Health)
	if C.Raid.ShowHealthText == true and C.Raid.MaxUnitPerColumn == 1 then
		Raid.Name:SetPoint("LEFT", Raid.Health, "RIGHT", 3, 0)
	elseif C.Raid.ShowHealthText == false and C.Raid.MaxUnitPerColumn == 1 then
		Raid.Name:SetPoint("LEFT", Raid.Health, "RIGHT", 3, 0)
	else
		Raid.Name:SetPoint("CENTER", Raid.Health, "CENTER", 0, 1)
	end
	
	--------------------------------------------------
	-- Healthtext
	--------------------------------------------------
	if C.Raid.ShowHealthText == true and C.Raid.MaxUnitPerColumn == 1 then
		Raid.Health.Value:Point("CENTER", Raid.Health, "CENTER", 0, 0)
	elseif C.Raid.ShowHealthText == true then
		Raid.Health.Value:Point("CENTER", Raid.Health, 0, -8)
	end
	
	--------------------------------------------------
	-- RaidIcon
	--------------------------------------------------
	Raid.RaidIcon:SetSize(16, 16)
	Raid.RaidIcon:SetPoint("TOP", Raid.Health, 0, 8)
	
	--------------------------------------------------
	-- RoleIcon
	--------------------------------------------------
	Raid.LFDRole:ClearAllPoints()
	Raid.LFDRole:Size(6,6)
	Raid.LFDRole:SetPoint("TOPLEFT", Raid.Health, "TOPLEFT", 2, -2)
	
	--------------------------------------------------
	-- Readycheck Icon
	--------------------------------------------------
	Raid.ReadyCheck:ClearAllPoints()
	Raid.ReadyCheck:SetPoint("RIGHT", Raid.Health)
	
	--------------------------------------------------
	-- Raiddebuffs
	--------------------------------------------------	
	if C["Raid"].AuraWatch then
		Raid.RaidDebuffs:SetWidth(15)
		Raid.RaidDebuffs:SetHeight(15)
		Raid.RaidDebuffs:SetPoint("CENTER", Raid.Health, "CENTER", 0, -1)
	end
end)