local T, C, L, G = unpack( Tukui )
local TukuiUnitFrames = T["UnitFrames"]
local Panels = T["Panels"]

function ShortValue(v)
	if( v >= 1e6 ) then
		return ( "%.1fm" ):format( v / 1e6 ):gsub( "%.?0+([km])$", "%1" )
	elseif( v >= 1e3 or v <= -1e3 ) then
		return ( "%.1fk" ):format( v / 1e3 ):gsub( "%.?0+([km])$", "%1" )
	else
		return v
	end
end

-- Move Targetname
hooksecurefunc(TukuiUnitFrames, "UpdateNamePosition", function(self)
	if (self.Power.Value:GetText() and UnitIsEnemy("player", "target")) then
		self.Name:ClearAllPoints()
		self.Name:SetPoint("CENTER", self.Health, "CENTER", 0, 0)
	else
		self.Name:ClearAllPoints()
		self.Power.Value:SetAlpha(1)
		self.Name:SetPoint("TOPLEFT", self.Health, "BOTTOMLEFT", 0, 0)
	end
end)

-- Move Targetbuffs
hooksecurefunc(TukuiUnitFrames, "UpdateBuffsHeaderPosition", function(self)
	local Frame = self:GetParent()
	local Buffs = Frame.Buffs

	if not Buffs then
		return
	end

	Buffs:ClearAllPoints() 
	Buffs:Point("BOTTOMLEFT", Frame, "TOPLEFT", -1, 8)
end)

-- Skin Buffs/Debuffs of Target
function TukuiUnitFrames:PostCreateAura(button)
	local Font = T.GetFont(C["UnitFrames"].Font)
	button:SetTemplate("Default")
	button:CreateShadow()

	button.Remaining = button:CreateFontString(nil, "OVERLAY")
	button.Remaining:SetFontObject(Font)
	button.Remaining:Point("CENTER", 1, 0)

	button.cd.noOCC = true
	button.cd.noCooldownCount = true
	button.cd:SetReverse()
	button.cd:SetFrameLevel(button:GetFrameLevel() + 1)
	button.cd:ClearAllPoints()
	button.cd:SetInside()

	button.icon:SetInside()
	button.icon:SetTexCoord(unpack(T.IconCoord))
	button.icon:SetDrawLayer("ARTWORK")

	button.count:Point("BOTTOMRIGHT", 3, 3)
	button.count:SetJustifyH("RIGHT")
	button.count:SetFont(C.Medias.Font, 9, "THICKOUTLINE")
	button.count:SetTextColor(0.84, 0.75, 0.65)

	button.OverlayFrame = CreateFrame("Frame", nil, button, nil)
	button.OverlayFrame:SetFrameLevel(button.cd:GetFrameLevel() + 1)
	button.overlay:SetParent(button.OverlayFrame)
	button.count:SetParent(button.OverlayFrame)
	button.Remaining:SetParent(button.OverlayFrame)
	
	button.Animation = button:CreateAnimationGroup()
	button.Animation:SetLooping("BOUNCE")

	button.Animation.FadeOut = button.Animation:CreateAnimation("Alpha")
	button.Animation.FadeOut:SetChange(-.9)
	button.Animation.FadeOut:SetDuration(.6)
	button.Animation.FadeOut:SetSmoothing("IN_OUT")
end