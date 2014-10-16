local T, C, L, D = Tukui:unpack()

function JasparUI:AddRBReminder()
if not C.Misc.BuffReminder == true then return end

local function SetCasterOnlyBuffs()
	Spell1Buff = {
		1459, -- Arcane Brilliance
		61316, -- Dalaran Brilliance
		109773, -- Dark Intent
	}
	Spell2Buff = {
		--24907, -- Moonkin Aura
		49868, -- Mind Quickening
	}
	Spell3Buff = {
		1126, -- Mark of the Wild
		20217, -- Blessing of Kings
		115921, -- Legacy of the Emperor
	}
	Spell4Buff = {
		469, -- Commanding Shout
		21562, -- Power Word: Fortitude
		166928, -- Blood Pact
		90364, -- Qiraji Fortitude
	}
	Spell5Buff = {
		19740, -- Blessing of Might
		116956, -- Grace of Air
	}
	Spell6Buff = {
		1459, -- Arcane Brilliance
		24932, -- Leader of the Pack
		61316, -- Dalaran Brilliance
		116781, -- Legacy of the White Tiger
	}
end

local function SetBuffs()
	Spell1Buff = {
		55610, -- Unholy Aura
		113742, -- Swiftblade's Cunning
		128432, -- Cackling Howl
	}
	Spell2Buff = {
		1459, -- Arcane Brilliance
		24932, -- Leader of the Pack
		61316, -- Dalaran Brilliance
		109773, -- Dark Intent
		116781, -- Legacy of the White Tiger
	}
	Spell3Buff = {
		1126, -- Mark of the Wild
		20217, -- Blessing of Kings
		115921, -- Legacy of the Emperor
	}
	Spell4Buff = {
		469, -- Commanding Shout
		21562, -- Power Word: Fortitude
		166928,	-- Blood Pact
		90364, -- Qiraji Fortitude
	}
	Spell5Buff = {
		19740, -- Blessing of Might
		116956, -- Grace of Air
	}
	Spell6Buff = {
		6673, -- Battle Shout
		19506, -- Trueshot Aura
		57330, -- Horn of Winter
	}
end


--Main Script
local function OnAuraChange(self, event, arg1, unit)
	if event == "UNIT_AURA" and arg1 ~= "player" then 
		return
	end
	
	--If We're a caster we may want to see differant buffs
	if T.Role == "Caster" or T.Role == "Healer" then 
		SetCasterOnlyBuffs()
	else
		SetBuffs()
	end
	
	
	for i, Spell1Buff in pairs(Spell1Buff) do
		local spellname = select(1, GetSpellInfo(Spell1Buff))
		if UnitAura("player", spellname) then
			Spell1Frame.t:SetAlpha(1)
			Spell1Frame.t:SetTexture(select(3, GetSpellInfo(Spell1Buff)))
			Spell1Frame.id = Spell1Buff
			break
		else
			Spell1Frame.t:SetAlpha(0.3)
			Spell1Frame.t:SetTexture(select(3, GetSpellInfo(Spell1Buff)))
		end
		Spell1Frame.id = Spell1Buff
	end	
	
	for i, Spell2Buff in pairs(Spell2Buff) do
		local spellname = select(1, GetSpellInfo(Spell2Buff))
		if UnitAura("player", spellname) then
			Spell2Frame.t:SetAlpha(1)
			Spell2Frame.t:SetTexture(select(3, GetSpellInfo(Spell2Buff)))
			Spell2Frame.id = Spell2Buff
			break
		else
			Spell2Frame.t:SetAlpha(0.3)
			Spell2Frame.t:SetTexture(select(3, GetSpellInfo(Spell2Buff)))
		end
		Spell2Frame.id = Spell2Buff
	end	
	
	for i, Spell3Buff in pairs(Spell3Buff) do
		local spellname = select(1, GetSpellInfo(Spell3Buff))
		if UnitAura("player", spellname) then
			Spell3Frame.t:SetAlpha(1)
			Spell3Frame.t:SetTexture(select(3, GetSpellInfo(Spell3Buff)))
			Spell3Frame.id = Spell3Buff
			break
		else
			Spell3Frame.t:SetAlpha(0.3)
			Spell3Frame.t:SetTexture(select(3, GetSpellInfo(Spell3Buff)))
		end
		Spell3Frame.id = Spell3Buff
	end
	
	for i, Spell4Buff in pairs(Spell4Buff) do
		local spellname = select(1, GetSpellInfo(Spell4Buff))
		if UnitAura("player", spellname) then
			Spell4Frame.t:SetAlpha(1)
			Spell4Frame.t:SetTexture(select(3, GetSpellInfo(Spell4Buff)))
			Spell4Frame.id = Spell4Buff
			break
		else
			Spell4Frame.t:SetAlpha(0.3)
			Spell4Frame.t:SetTexture(select(3, GetSpellInfo(Spell4Buff)))
			Spell4Frame.id = Spell4Buff
		end
	end
	
	for i, Spell5Buff in pairs(Spell5Buff) do
		local spellname = select(1, GetSpellInfo(Spell5Buff))
		if UnitAura("player", spellname) then
			Spell5Frame.t:SetAlpha(1)
			Spell5Frame.t:SetTexture(select(3, GetSpellInfo(Spell5Buff)))
			Spell5Frame.id = Spell5Buff
			break
		else
			-- Spell5Frame:SetAlpha(0.3)
			Spell5Frame.t:SetAlpha(0.3)
			Spell5Frame.t:SetTexture(select(3, GetSpellInfo(Spell5Buff)))
		end
		Spell5Frame.id = Spell5Buff
	end	
	
	for i, Spell6Buff in pairs(Spell6Buff) do
		local spellname = select(1, GetSpellInfo(Spell6Buff))
		if UnitAura("player", spellname) then
			Spell6Frame.t:SetAlpha(1)
			Spell6Frame.t:SetTexture(select(3, GetSpellInfo(Spell6Buff)))
			Spell6Frame.id = Spell6Buff
			break
		else
			Spell6Frame.t:SetAlpha(0.3)
			Spell6Frame.t:SetTexture(select(3, GetSpellInfo(Spell6Buff)))
		end
		Spell6Frame.id = Spell6Buff
	end	
end

local RBRWidth = ((T.Maps.Minimap:GetWidth()) /6) + 3

local raidbuff_reminder = CreateFrame('Frame', 'RaidBuffReminder', Minimap)
raidbuff_reminder:Width(RBRWidth)
raidbuff_reminder:Point('TOPLEFT', T.Maps.Minimap, 'TOPRIGHT', 2, 3)
raidbuff_reminder:Point('BOTTOMLEFT', T.Maps.Minimap, 'BOTTOMRIGHT', 2, -3)

raidbuff_reminder:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
raidbuff_reminder:RegisterEvent("UNIT_INVENTORY_CHANGED")
raidbuff_reminder:RegisterEvent("UNIT_AURA")
raidbuff_reminder:RegisterEvent("PLAYER_REGEN_ENABLED")
raidbuff_reminder:RegisterEvent("PLAYER_REGEN_DISABLED")
raidbuff_reminder:RegisterEvent("PLAYER_ENTERING_WORLD")
raidbuff_reminder:RegisterEvent("UPDATE_BONUS_ACTIONBAR")
raidbuff_reminder:RegisterEvent("CHARACTER_POINTS_CHANGED")
raidbuff_reminder:RegisterEvent("ZONE_CHANGED_NEW_AREA")
raidbuff_reminder:SetScript("OnEvent", OnAuraChange)

--Function to create buttons
local function CreateButton(name, relativeTo, firstbutton, lastbutton)
	local button = CreateFrame("Button", name, RaidBuffReminder)
	button:SetTemplate('Default')
	button:Size(RBRWidth - 3)
	if firstbutton == true then
		button:Point("TOP", relativeTo, "TOP", 0, -2)
	else
		button:Point("TOP", relativeTo, "BOTTOM", 0, -1)
	end
	
	if lastbutton == true then
		button:Point("BOTTOM", RaidBuffReminder, "BOTTOM", 0, 2)
	end
	
	button.t = button:CreateTexture(name..".t", "OVERLAY")
	button.t:SetTexCoord(.08, .92, .08, .92)
	button.t:Point("TOPLEFT", 2, -2)
	button.t:Point("BOTTOMRIGHT", -2, 2)
	button:SetScript("OnMouseUp", microMenuGenerator)
	
	return button
end

--Create Buttons
do
CreateButton("Spell1Frame", RaidBuffReminder, true)
CreateButton("Spell2Frame", Spell1Frame, false)
CreateButton("Spell3Frame", Spell2Frame, false)
CreateButton("Spell4Frame", Spell3Frame, false)
CreateButton("Spell5Frame", Spell4Frame, false)
CreateButton("Spell6Frame", Spell5Frame, false, true)
end
end