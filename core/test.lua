local T, C, L = Tukui:unpack()

SlashCmdList.TEST_EXTRABUTTON = function()
	if ExtraActionBarFrame:IsShown() then
		ExtraActionBarFrame:Hide()
	else
		ExtraActionBarFrame:Show()
		ExtraActionBarFrame:SetAlpha(1)
		ExtraActionButton1:Show()
		ExtraActionButton1:SetAlpha(1)
		ExtraActionButton1.icon:SetTexture("Interface\\Icons\\INV_Pet_DiseasedSquirrel")
		ExtraActionButton1.icon:Show()
		ExtraActionButton1.icon:SetAlpha(1)
	end
end
SLASH_TEST_EXTRABUTTON1 = "/xb"

SlashCmdList.TEST_Raid = function()
		local Frame = TukuiRaid

		Frame.unit = "player"
		Frame:Show()
		Frame.Hide = function() end
end
SLASH_TEST_Raid1 = "/tr"