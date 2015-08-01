local T, C, L = Tukui:unpack()
local TukuiChat = T.Chat
local Panels = T["Panels"]
local Noop = function() end

hooksecurefunc(TukuiChat, "StyleFrame", function(self, frame)
	local Frame = frame
	local FrameName = frame:GetName()
	local TabText = _G[FrameName.."TabText"]
	
	if C.Chat.TabTextClassColor == true then
		local color = RAID_CLASS_COLORS[select(2,UnitClass("player"))]
		TabText:SetTextColor(color.r, color.g, color.b)
	else
		TabText:SetTextColor(unpack(C.Chat.TabText))
	end
	TabText.SetTextColor = Noop
end)

hooksecurefunc(TukuiChat, "SetDefaultChatFramesPositions", function()
	if (not TukuiData[GetRealmName()][UnitName("Player")].Chat) then
			TukuiData[GetRealmName()][UnitName("Player")].Chat = {}
	end

	local Width = 365

	for i = 1, NUM_CHAT_WINDOWS do
		local Frame = _G["ChatFrame"..i]
		local ID = Frame:GetID()
			
		-- Set default chat frame position
		if (ID == 1) then
    		Frame:ClearAllPoints()
            Frame:SetPoint("BOTTOMLEFT", Panels.DataTextLeft, "BOTTOMLEFT", 8, 26)
		elseif (C.Chat.LootFrame and ID == 4) then
			if (not Frame.isDocked) then
				Frame:ClearAllPoints()
				Frame:SetPoint("BOTTOMRIGHT", Panels.DataTextRight, "BOTTOMRIGHT", -8, 26)
			end
		end
		
		if (ID == 1) then
			FCF_SetWindowName(Frame, "General")
		end
		
		if (ID == 2) then 
			FCF_SetWindowName(Frame, "Log")
		end
		
		if (ID == 3) then
			FCF_SetWindowName(Frame, "Whisper")
		end
		
		if (ID == 4) then
			FCF_SetWindowName(Frame, "Loot")
		end
		
		if (not Frame.isLocked) then
			FCF_SetLocked(Frame, 1)
		end
		
		local Anchor1, Parent, Anchor2, X, Y = Frame:GetPoint()
		TukuiData[GetRealmName()][UnitName("Player")].Chat["Frame" .. i] = {Anchor1, Anchor2, X, Y, Width, 87}
	end
end)

local Toast = BNToastFrame
local ToastCloseButton = BNToastFrameCloseButton
hooksecurefunc(TukuiChat, "SkinToastFrame", function()
	Toast:SetTemplate()
	Toast:CreateShadow()
	ToastCloseButton:SkinCloseButton()
	Toast:ClearAllPoints()
	
	if C.Chat.Background then
		local Backdrop = T["Panels"].LeftChatBG
		
		Toast:Point("BOTTOMLEFT", Backdrop, "TOPLEFT", 5, 6)
	else
		Toast:Point("BOTTOMLEFT", ChatFrame1, "TOPLEFT", 5, 6)
	end
end)

-------------------------------------------------
-- Hyperlink
-------------------------------------------------
local orig1, orig2 = {}, {}
local GameTooltip = GameTooltip

local linktypes = {item = true, enchant = true, spell = true, quest = true, unit = true, talent = true, achievement = true, glyph = true, instancelock = true}


local function OnHyperlinkEnter(frame, link, ...)
	local linktype = link:match("^([^:]+)")
	if linktype and linktypes[linktype] then
		GameTooltip:SetOwner(frame, "ANCHOR_TOPLEFT", -4, 25)
		GameTooltip:SetHyperlink(link)
		GameTooltip:Show()
	end

	if orig1[frame] then return orig1[frame](frame, link, ...) end
end

local function OnHyperlinkLeave(frame, ...)
	GameTooltip:Hide()
	if orig2[frame] then return orig2[frame](frame, ...) end
end


local _G = getfenv(0)
for i=1, NUM_CHAT_WINDOWS do
	local frame = _G["ChatFrame"..i]
	orig1[frame] = frame:GetScript("OnHyperlinkEnter")
	frame:SetScript("OnHyperlinkEnter", OnHyperlinkEnter)

	orig2[frame] = frame:GetScript("OnHyperlinkLeave")
	frame:SetScript("OnHyperlinkLeave", OnHyperlinkLeave)
end

--------------------------------------------------------------------------------
--	Play sound when your name is called in chat -- credit Hydra
--------------------------------------------------------------------------------

if C.Chat.Namealert == true then
	local chatFind = CreateFrame("Frame")
	chatFind:RegisterEvent("CHAT_MSG_GUILD")
	chatFind:RegisterEvent("CHAT_MSG_BATTLEGROUND")
	chatFind:RegisterEvent("CHAT_MSG_BATTLEGROUND_LEADER")
	chatFind:RegisterEvent("CHAT_MSG_OFFICER")
	chatFind:RegisterEvent("CHAT_MSG_PARTY")
	chatFind:RegisterEvent("CHAT_MSG_PARTY_LEADER")
	chatFind:RegisterEvent("CHAT_MSG_RAID")
	chatFind:RegisterEvent("CHAT_MSG_RAID_LEADER")
	chatFind:RegisterEvent("CHAT_MSG_SAY")
	chatFind:RegisterEvent("CHAT_MSG_CHANNEL")

	chatFind:SetScript("OnEvent", function(event, msg, sender)
	sender = strlower(sender)
			
		if C.Chat.Namealert == true then
			if strfind(sender, strlower(UnitName("player"))) then
				PlaySoundFile(C.Medias.namealert)
				return
			end
		end
	end)
end