T, C, L = Tukui:unpack()
local UnitFrames = T["UnitFrames"]
local Font = T.GetFont(C["UnitFrames"].Font)
local Class = select(2, UnitClass("player"))
local Panels = T["Panels"]

function UnitFrames:GetRaidFramesAttributes()
	local Properties = C.Party.Enable and "custom [@raid6,exists] show;hide" or "solo, party, raid"
	
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
	"initial-height", T.Scale(20),
	"showParty", true,
	"showRaid", true,
	"showPlayer", true,
	"showSolo", true,
	"xoffset", T.Scale(4),
	"yOffset", T.Scale(-4),
	"point", "LEFT",
	"groupFilter", "1,2,3,4,5,6,7,8",
	"groupingOrder", "1,2,3,4,5,6,7,8",
	"groupBy", "GROUP",
	"maxColumns", math.ceil(40/5),
	"unitsPerColumn", 5,
	"columnSpacing", T.Scale(4),
	"columnAnchorPoint", "TOP"
end

hooksecurefunc(UnitFrames, "Raid", function(Raid)
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
	Raid.Power:SetHeight(3)
	
	--------------------------------------------------
	-- Health
	--------------------------------------------------
	Raid.Health:Height(17)
	Raid.Health:CreateBackdrop("Default")
	Raid.Health.bg:SetVertexColor(.5, .5, .5)

	--------------------------------------------------
	-- Name
	--------------------------------------------------
	Raid.Name:ClearAllPoints()
	Raid.Name:SetParent(Raid.Health)
	Raid.Name:SetPoint("CENTER", Raid.Health, "CENTER", 0, 1)
end)