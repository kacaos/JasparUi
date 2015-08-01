local T, C, L = Tukui:unpack()
local Panels = T["Panels"]

function JasparUI:AddNewPanels()
--------------------------------------------
-- Hide some Panels we dont need!
--------------------------------------------
local panelsToHide = {Panels.BottomLine, Panels.LeftVerticalLine, Panels.RightVerticalLine, Panels.CubeLeft, Panels.CubeRight}

for _, panels in pairs(panelsToHide) do
	panels:StripTextures()
end


--------------------------------------------
-- Move Chatbackground / Chattabs / Datatext
--------------------------------------------
	
-- Resize Left Datatext
Panels.DataTextLeft:ClearAllPoints()
Panels.DataTextLeft:Size(370, 15)

-- Resize Right Datatext
Panels.DataTextRight:ClearAllPoints()
Panels.DataTextRight:Size(370, 15)

if C.Chat.Background == true then
	
	-- Left ChatBG
	Panels.LeftChatBG:ClearAllPoints()
	Panels.LeftChatBG:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 5, 20)
	Panels.LeftChatBG:Size(370, 100)

	-- Left Chattab
	Panels.TabsBGLeft:StripTextures()

	-- Left DataText	
	Panels.DataTextLeft:SetPoint("TOP", Panels.LeftChatBG, "BOTTOM", 0, 1)

	-- Rigt ChatBG
	Panels.RightChatBG:ClearAllPoints()
	Panels.RightChatBG:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -5, 20)
	Panels.RightChatBG:Size(370, 100)

	-- Right Chattab
	Panels.TabsBGRight:StripTextures()

	-- Right DataText
	Panels.DataTextRight:SetPoint("TOP", Panels.RightChatBG, "BOTTOM", 0, 1)

else

	-- Left DataText	
	--Panels.DataTextLeft:SetClampedToScreen(false)
	Panels.DataTextLeft:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 5, 4)
	Panels.DataTextLeft:SetBackdropColor(0,0,0,0)
	
	-- Right DataText
	Panels.DataTextRight:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -5, 4)
	Panels.DataTextRight:SetBackdropColor(0,0,0,0)

end

----------------------------------------------
-- Move Petbar
----------------------------------------------
local PetSize = C.ActionBars.PetButtonSize
local Spacing = C.ActionBars.ButtonSpacing

Panels.PetActionBar:ClearAllPoints()
Panels.PetActionBar:Size(PetSize * 10 + (Spacing * 11), PetSize + (Spacing * 2))
Panels.PetActionBar:Point("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -55, 120)
end