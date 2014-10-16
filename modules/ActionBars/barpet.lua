T, C, L = Tukui:unpack()
local TukuiActionBars = T["ActionBars"]
local NUM_PET_ACTION_SLOTS = NUM_PET_ACTION_SLOTS

hooksecurefunc(TukuiActionBars, "CreatePetBar", function()
	local PetSize = C.ActionBars.PetButtonSize
	local Spacing = C.ActionBars.ButtonSpacing
	local PetActionBarFrame = PetActionBarFrame
	local PetActionBar_UpdateCooldowns = PetActionBar_UpdateCooldowns
	local Bar = T.Panels.PetActionBar

	PetActionBarFrame:UnregisterEvent("PET_BAR_SHOWGRID")
	PetActionBarFrame:UnregisterEvent("PET_BAR_HIDEGRID")
	PetActionBarFrame.showgrid = 1

	for i = 1, NUM_PET_ACTION_SLOTS do
		local Button = _G["PetActionButton"..i]
		Button:ClearAllPoints()
		Button:SetParent(Bar)
		Button:Size(PetSize)
		Button:Show()
		Button:SetFrameLevel(5)
		Button:SetFrameStrata("BACKGROUND")

		if (i == 1) then
			Button:SetPoint("TOPLEFT", Spacing, 0)
		else
			Button:SetPoint("LEFT", _G["PetActionButton"..(i - 1)], "RIGHT", Spacing, 0)
		end

		Bar:SetAttribute("addchild", Button)
		Bar["Button"..i] = Button
	end

	hooksecurefunc("PetActionBar_Update", TukuiActionBars.UpdatePetBar)

	TukuiActionBars:SkinPetButtons()

	RegisterStateDriver(Bar, "visibility", "[pet,nopetbattle,novehicleui,nooverridebar,nobonusbar:5] show; hide")

	Bar:RegisterEvent("PLAYER_CONTROL_LOST")
	Bar:RegisterEvent("PLAYER_CONTROL_GAINED")
	Bar:RegisterEvent("PLAYER_ENTERING_WORLD")
	Bar:RegisterEvent("PLAYER_FARSIGHT_FOCUS_CHANGED")
	Bar:RegisterEvent("PET_BAR_UPDATE")
	Bar:RegisterEvent("PET_BAR_UPDATE_USABLE")
	Bar:RegisterEvent("PET_BAR_UPDATE_COOLDOWN")
	Bar:RegisterEvent("PET_BAR_HIDE")
	Bar:RegisterEvent("UNIT_PET")
	Bar:RegisterEvent("UNIT_FLAGS")
	Bar:RegisterEvent("UNIT_AURA")
	Bar:SetScript("OnEvent", function(self, event, arg1)
		if (event == "PLAYER_ENTERING_WORLD") then

		elseif (event == "PET_BAR_UPDATE")
			or (event == "UNIT_PET" and arg1 == "player")
			or (event == "PLAYER_CONTROL_LOST")
			or (event == "PLAYER_CONTROL_GAINED")
			or (event == "PLAYER_FARSIGHT_FOCUS_CHANGED")
			or (event == "UNIT_FLAGS")
			or (arg1 == "pet" and (event == "UNIT_AURA")) then
				TukuiActionBars:UpdatePetBar()
		elseif event == "PET_BAR_UPDATE_COOLDOWN" then
			PetActionBar_UpdateCooldowns()
		else
			TukuiActionBars:SkinPetButtons()
		end
	end)
end)