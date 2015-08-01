local T, C, L = Tukui:unpack()
local TukuiDT = T["DataTexts"]

hooksecurefunc(TukuiDT, "Enable", function()
	if C.DataTexts.ClassColor == true then
		local color = RAID_CLASS_COLORS[select(2,UnitClass("player"))]
		TukuiDT.NameColor = T.RGBToHex(color.r, color.g, color.b)
		TukuiDT.ValueColor = T.RGBToHex(color.r, color.g, color.b)
	else
		TukuiDT.NameColor = T.RGBToHex(unpack(C["DataTexts"].NameColor))
		TukuiDT.ValueColor = T.RGBToHex(unpack(C["DataTexts"].ValueColor))
	end
end)

hooksecurefunc(TukuiDT, "AddDefaults", function()
	TukuiData[GetRealmName()][UnitName("Player")].Texts = {}
	
	TukuiData[GetRealmName()][UnitName("Player")].Texts[L.DataText.Guild] = {true, 1}
	TukuiData[GetRealmName()][UnitName("Player")].Texts[L.DataText.Durability] = {true, 2}
	TukuiData[GetRealmName()][UnitName("Player")].Texts[L.DataText.Friends] = {true, 3}
	TukuiData[GetRealmName()][UnitName("Player")].Texts[L.DataText.FPSAndMS] = {true, 4}
	TukuiData[GetRealmName()][UnitName("Player")].Texts[L.DataText.Memory] = {true, 5}
	TukuiData[GetRealmName()][UnitName("Player")].Texts[L.DataText.Gold] = {true, 6}
	TukuiData[GetRealmName()][UnitName("Player")].Texts[L.DataText.Power] = {false, 8}
	TukuiData[GetRealmName()][UnitName("Player")].Texts[L.DataText.Time] = {true, 7}
end)

local RemoveData = function(self)
	if self.Data then
		self.Data.Position = 0
		self.Data:Disable()
	end
	
	self.Data = nil
end

local SetData = function(self, object)
	-- Disable the old data text in use
	if self.Data then
		RemoveData(self)
	end
	
	local Panels = T["Panels"]
	
	-- Set the new data text
	self.Data = object
	self.Data:Enable()
	self.Data.Text:Point("RIGHT", self, 0, 0)
	self.Data.Text:Point("LEFT", self, 0, 0)
	self.Data.Text:Point("TOP", self, 0, 1)
	self.Data.Text:Point("BOTTOM", self, 0, 1)
	self.Data.Position = self.Num
	self.Data:SetAllPoints(self.Data.Text)

	if (Panels.DataTextLeft and self.Data.Position >= 1 and self.Data.Position <= 3) then
		self.Data:SetParent(Panels.DataTextLeft)
	elseif (Panels.DataTextRight and self.Data.Position >= 4 and self.Data.Position <= 6) then
		self.Data:SetParent(Panels.DataTextRight)
	elseif (Panels.MinimapDataTextOne and self.Data.Position == 7) then
		self.Data:SetParent(Panels.MinimapDataTextOne)
	end
end

hooksecurefunc(TukuiDT, "CreateAnchors", function(self)
	local Panels = T["Panels"]
	DataTextLeft = Panels.DataTextLeft
	DataTextRight = Panels.DataTextRight
	MinimapDataTextOne = Panels.MinimapDataTextOne
	MinimapDataTextTwo = Panels.MinimapDataTextTwo
	
	if (MinimapDataTextOne and MinimapDataTextTwo) then
		self.NumAnchors = self.NumAnchors + 1
	end
	
	for i = 1, self.NumAnchors do
		local Frame = CreateFrame("Button", nil, UIParent)
		Frame:Size((DataTextLeft:GetWidth() / 3) - 1, DataTextLeft:GetHeight() - 10)
		Frame:SetFrameLevel(DataTextLeft:GetFrameLevel() + 1)
		Frame:SetFrameStrata("HIGH")
		Frame:EnableMouse(false)
		Frame.SetData = SetData
		Frame.RemoveData = RemoveData
		Frame.Num = i
		
		Frame.Tex = Frame:CreateTexture()
		Frame.Tex:SetAllPoints()
		Frame.Tex:SetTexture(0.2, 1, 0.2, 0)
		
		self.Anchors[i] = Frame
		
		if (i == 1) then
			Frame:Point("LEFT", DataTextLeft, 1, 0)
		elseif (i == 4) then
			Frame:Point("LEFT", DataTextRight, 1, 0)
		elseif (i == 7) then
			Frame:Point("CENTER", MinimapDataTextOne, 0, 0)
			Frame:Size(MinimapDataTextOne:GetWidth() - 2, MinimapDataTextOne:GetHeight() - 2)
		else
			Frame:Point("LEFT", self.Anchors[i-1], "RIGHT", 1, 0)
		end
	end
end)