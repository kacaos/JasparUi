local T, C, L = Tukui:unpack()

C["General"]["HideShadows"] = true
C["General"]["BackdropColor"] = {0.1, 0.1, 0.1}
C["General"]["BorderColor"] = {0, 0, 0}

C["Chat"]["Background"] = true
C["Chat"]["TabFont"] = "Pixel"
C["Chat"]["Namealert"] = true
C["Chat"]["TabText"] = {0,1,0}
C["Chat"]["TabTextClassColor"] = true

C["ActionBars"]["Font"] = "Pixel"
C["ActionBars"]["Macro"] = true
C["ActionBars"]["HotKey"] = true
C["ActionBars"]["HideBackdrop"] = true
C["ActionBars"]["OwnMetamorphosisBar"] = false
C["ActionBars"]["ButtonSpacing"] = 1
C["ActionBars"]["ShapeShift"] = false

C["UnitFrames"]["Font"] = "Pixel"
C["UnitFrames"]["HealthTexture"] = "Blank"
C["UnitFrames"]["PowerTexture"] = "Blank"
C["UnitFrames"]["CastTexture"] = "Blank"
C["UnitFrames"]["DarkTheme"] = false

C["Auras"]["Font"] = "Pixel"
C["Auras"]["ClassicTimer"] = true
C["Auras"]["BuffsPerRow"] = 18

C["DataTexts"]["Font"] = "Pixel"
C["DataTexts"]["Time24HrFormat"] = true
C["DataTexts"]["NameColor"] = {0,1,0}
C["DataTexts"]["ValueColor"] = {0,1,0}
C["DataTexts"]["ClassColor"] = true

C["Bags"]["Font"] = "Pixel"
C["Bags"]["PulseNewItem"] = true

C["Cooldowns"]["Font"] = "Pixel"

C["NamePlates"]["Font"] = "Pixel"
C["NamePlates"]["Texture"] = "Blank"
C["NamePlates"]["HealthText"] = true

C["Party"]["Font"] = "Pixel"
C["Party"]["ShowPlayer"] = true
C["Party"]["PowerTexture"] = "Blank"
C["Party"]["HealthTexture"] = "Blank"
C["Party"]["HealthFont"] = "Pixel"

C["Raid"]["Font"] = "Pixel"
C["Raid"]["PowerTexture"] = "Blank"
C["Raid"]["HealthTexture"] = "Blank"
C["Raid"]["ShowPets"] = false
C["Raid"]["MaxUnitPerColumn"] = 5
C["Raid"]["ShowHealthText"] = false

C["Tooltips"]["HealthFont"] = "Pixel"
C["Tooltips"]["HealthTexture"] = "Blank"

C["Misc"]["BuffReminder"] = true
C["Misc"]["autoscreen"] = true

C["Merchant"]["UseGuildRepair"] = true

C["ClassBars"] = {
	["Shaman"] = true,
	["Warlock"] = true,
	["Monk"] = true,
	["Druid"] = true,
	["Mage"] = true,
	["Paladin"] = true,
	["Priest"] = true,
	["Deathknight"] = true,
	["Warrior"] = true,
	["Power"] = false,
}

C["CastBars"] = {
	["PlayerWidth"] =  184,
	["PlayerHeight"] = 13,
	["PCBIconSize"] = 15,
	["TargetWidth"] = 250,
	["TargetHeight"] = 25,
	["TCBIconSize"] = 36,
}

C["Invite"] = {
	["autoaccept"] = true,
}