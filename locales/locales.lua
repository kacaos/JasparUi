local T, C, L, D = Tukui:unpack()

---------------------------------------------
-- Locales
---------------------------------------------
local Misc = {
	["BuffReminder"] = {
			["Name"] = "Show Raidbuffreminder",
			["Desc"] = "Enable Raidbuffreminder next to the Minimap",
	},
	["ThreatBarEnable"] = {
			["Name"] = "Enable Threatbar",
			["Desc"] = "Enable Threatbar",
	},
	["AltPowerBarEnable"] = {
			["Name"] = "Enable Altpowerbar",
			["Desc"] = "Enable Altpowerbar",
	},
	["ExperienceEnable"] = {
			["Name"] = "Enable Experiencebar",
			["Desc"] = "Enable Experiencebar",
	},
	["ReputationEnable"] = {
			["Name"] = "Enable Reputationbar",
			["Desc"] = "Enable Reputationbar",
	},
	["ErrorFilterEnable"] = {
			["Name"] = "Enable Errorfilter",
			["Desc"] = "Filters out messages from the UIErrorsFrame",
	},
	["autoscreen"] = {
			["Name"] = "Enable automatic screenshot",
			["Desc"] = "Screenshot when getting an achievement",
	},
}

local ClassBars = {
	["Shaman"] = {
			["Name"] = "Enable Shaman Totembar",
			["Desc"] = "Enable Shaman Totembar",
	},
	["Warlock"] = {
			["Name"] = "Enable Warlock Classbar",
			["Desc"] = "Enable Warlock Classbar",
	},
	["Monk"] = {
			["Name"] = "Enable Monk Harmonybar",
			["Desc"] = "Enable Monk Harmonybar",
	},
	["Druid"] = {
			["Name"] = "Enable Druid Eclipsebar",
			["Desc"] = "Enable Druid Eclipsebar",
	},
	["Mage"] = {
			["Name"] = "Enable Mage Arcanecharges",
			["Desc"] = "Enable Mage Arcanecharges",
	},
	["Paladin"] = {
			["Name"] = "Enable Paladin Holypower",
			["Desc"] = "Enable Paladin Holypower",
	},
	["Priest"] = {
			["Name"] = "Enable Priest Shadoworbs",
			["Desc"] = "Enable Priest Shadoworbs",
	},
	["Deathknight"] = {
			["Name"] = "Enable Deathknight Runesbar",
			["Desc"] = "Enable Deathknight Runesbar",
	},
	["Warrior"] = {
			["Name"] = "Enable Warrior BannerCD",
			["Desc"] = "Enable Warrior BannerCD",
	},
	["Power"] = {
			["Name"] = "Enable extra bigger powerbar (Need enabled classbar)",
			["Desc"] = "EEnable extra bigger powerbar",
	},	
}

local CastBars = {
	["PlayerWidth"] = {
			["Name"] = "Set width of |cff50e468player|r castbar",
			["Desc"] = "Set width of |cff50e468player|r castbar",
	},
	["PlayerHeight"] = {
			["Name"] = "Set height of |cff50e468player|r castbar",
			["Desc"] = "Set height of |cff50e468player|r castbar",
	},
	["PCBIconSize"] = {
			["Name"] = "Set size of |cff50e468player|r castbaricon",
			["Desc"] = "Set size of |cff50e468player|r castbaricon",
	},
	["TargetWidth"] = {
			["Name"] = "Set width of |cFFFF0000target|r castbar",
			["Desc"] = "Set width of |cFFFF0000target|r castbar",
	},
	["TargetHeight"] = {
			["Name"] = "Set height of |cFFFF0000target|r castbar",
			["Desc"] = "Set height of |cFFFF0000target|r castbar",
	},
	["TCBIconSize"] = {
			["Name"] = "Set size of |cFFFF0000target|r castbaricon",
			["Desc"] = "Set size of |cFFFF0000target|r castbaricon",
	},
}

local General = {
	["InOut"] = {
			["Name"] = "Panel Border Style",
			["Desc"] = "Use the standard border on Tukui frames, or 1 pixel style if disabled",
	},
	["AutoScale"] = {
			["Name"] = "Auto Scale",
			["Desc"] = "Automatically detect the best scale for your resolution",
	},
	["UIScale"] = {
			["Name"] = "UI Scale",
			["Desc"] = "Set a custom UI scale",
	},
	["BackdropColor"] = {
			["Name"] = "Backdrop Color",
			["Desc"] = "Set the backdrop color for all Tukui frames",
	},
	["BorderColor"] = {
			["Name"] = "Border Color",
			["Desc"] = "Set the border color for all Tukui frames",
	},
	["HideShadows"] = {
			["Name"] = "Hide Shadows",
			["Desc"] = "Display or hide shadows on certain Tukui frames",
	},
}

local Invite = {
	["autoaccept"] = {
			["Name"] = "Enable autoaccept Party/Raidinvites",
			["Desc"] = "Enable autoaccept Party/Raidinvites",
	},
}

TukuiConfig.enUS["Misc"] = Misc
TukuiConfig.enUS["ClassBars"] = ClassBars
TukuiConfig.enUS["CastBars"] = CastBars
TukuiConfig.enUS["General"] = General
TukuiConfig.enUS["Invite"] = Invite