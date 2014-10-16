local T, C, L = Tukui:unpack()

ClassColor = RAID_CLASS_COLORS[select(2,UnitClass("player"))]
local Mult = 768/string.match(GetCVar("gxResolution"), "%d+x(%d+)")/C.General.UIScale
local Scale = function(x) return Mult*math.floor(x/Mult+.5) end

T.Scale = Scale
T.Mult = Mult

local function SetOutside(obj, anchor, xOffset, yOffset)
	xOffset = xOffset or (C.General.InOut and 2) or 1
	yOffset = yOffset or (C.General.InOut and 2) or 1
	anchor = anchor or obj:GetParent()

	if obj:GetPoint() then obj:ClearAllPoints() end
	
	obj:Point("TOPLEFT", anchor, "TOPLEFT", -xOffset, yOffset)
	obj:Point("BOTTOMRIGHT", anchor, "BOTTOMRIGHT", xOffset, -yOffset)
end

local function SetInside(obj, anchor, xOffset, yOffset)
	xOffset = xOffset or (C.General.InOut and 2) or 1
	yOffset = yOffset or (C.General.InOut and 2) or 1
	anchor = anchor or obj:GetParent()

	if obj:GetPoint() then obj:ClearAllPoints() end
	
	obj:Point("TOPLEFT", anchor, "TOPLEFT", xOffset, -yOffset)
	obj:Point("BOTTOMRIGHT", anchor, "BOTTOMRIGHT", -xOffset, yOffset)
end

local function SetTemplate(f, t, tex)
	local balpha = 1
	if t == "Transparent" then balpha = 0.8 end
	local borderr, borderg, borderb = unpack(C.General.BorderColor)
	local backdropr, backdropg, backdropb = unpack(C.General.BackdropColor)
	local backdropa = balpha
	local texture = C.Medias.Blank

	if tex then 
		texture = C.Medias.Normal 
	end
	
	f:SetBackdrop({
	  bgFile = texture,
	  edgeFile = C.Medias.Blank,
	  tile = false, tileSize = 0, edgeSize = Mult,
	})
	
	if C.General.InOut and not f.isInsetDone then
		f.insettop = f:CreateTexture(nil, "BORDER")
		f.insettop:Point("TOPLEFT", f, "TOPLEFT", -1, 1)
		f.insettop:Point("TOPRIGHT", f, "TOPRIGHT", 1, -1)
		f.insettop:Height(1)
		f.insettop:SetTexture(0,0,0)	
		f.insettop:SetDrawLayer("BORDER", -7)
		
		f.insetbottom = f:CreateTexture(nil, "BORDER")
		f.insetbottom:Point("BOTTOMLEFT", f, "BOTTOMLEFT", -1, -1)
		f.insetbottom:Point("BOTTOMRIGHT", f, "BOTTOMRIGHT", 1, -1)
		f.insetbottom:Height(1)
		f.insetbottom:SetTexture(0,0,0)	
		f.insetbottom:SetDrawLayer("BORDER", -7)
		
		f.insetleft = f:CreateTexture(nil, "BORDER")
		f.insetleft:Point("TOPLEFT", f, "TOPLEFT", -1, 1)
		f.insetleft:Point("BOTTOMLEFT", f, "BOTTOMLEFT", 1, -1)
		f.insetleft:Width(1)
		f.insetleft:SetTexture(0,0,0)
		f.insetleft:SetDrawLayer("BORDER", -7)
		
		f.insetright = f:CreateTexture(nil, "BORDER")
		f.insetright:Point("TOPRIGHT", f, "TOPRIGHT", 1, 1)
		f.insetright:Point("BOTTOMRIGHT", f, "BOTTOMRIGHT", -1, -1)
		f.insetright:Width(1)
		f.insetright:SetTexture(0,0,0)	
		f.insetright:SetDrawLayer("BORDER", -7)

		f.insetinsidetop = f:CreateTexture(nil, "BORDER")
		f.insetinsidetop:Point("TOPLEFT", f, "TOPLEFT", 1, -1)
		f.insetinsidetop:Point("TOPRIGHT", f, "TOPRIGHT", -1, 1)
		f.insetinsidetop:Height(1)
		f.insetinsidetop:SetTexture(0,0,0)	
		f.insetinsidetop:SetDrawLayer("BORDER", -7)
		
		f.insetinsidebottom = f:CreateTexture(nil, "BORDER")
		f.insetinsidebottom:Point("BOTTOMLEFT", f, "BOTTOMLEFT", 1, 1)
		f.insetinsidebottom:Point("BOTTOMRIGHT", f, "BOTTOMRIGHT", -1, 1)
		f.insetinsidebottom:Height(1)
		f.insetinsidebottom:SetTexture(0,0,0)	
		f.insetinsidebottom:SetDrawLayer("BORDER", -7)
		
		f.insetinsideleft = f:CreateTexture(nil, "BORDER")
		f.insetinsideleft:Point("TOPLEFT", f, "TOPLEFT", 1, -1)
		f.insetinsideleft:Point("BOTTOMLEFT", f, "BOTTOMLEFT", -1, 1)
		f.insetinsideleft:Width(1)
		f.insetinsideleft:SetTexture(0,0,0)
		f.insetinsideleft:SetDrawLayer("BORDER", -7)
		
		f.insetinsideright = f:CreateTexture(nil, "BORDER")
		f.insetinsideright:Point("TOPRIGHT", f, "TOPRIGHT", -1, -1)
		f.insetinsideright:Point("BOTTOMRIGHT", f, "BOTTOMRIGHT", 1, 1)
		f.insetinsideright:Width(1)
		f.insetinsideright:SetTexture(0,0,0)	
		f.insetinsideright:SetDrawLayer("BORDER", -7)

		f.isInsetDone = true
	end
	
	f:SetBackdropColor(backdropr, backdropg, backdropb, backdropa)
	f:SetBackdropBorderColor(borderr, borderg, borderb)
end

---------------------------------------------------
-- MERGE TUKUI API WITH WOW API
---------------------------------------------------

local function addapi(object)
	local mt = getmetatable(object).__index

	mt.SetOutside = SetOutside
	mt.SetInside = SetInside
	mt.SetTemplate = SetTemplate
	
end

local handled = {["Frame"] = true}
local object = CreateFrame("Frame")
addapi(object)
addapi(object:CreateTexture())
addapi(object:CreateFontString())

object = EnumerateFrames()
while object do
	if not handled[object:GetObjectType()] then
		addapi(object)
		handled[object:GetObjectType()] = true
	end

	object = EnumerateFrames(object)
end