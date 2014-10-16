local AddOnName, Engine = ...
local T, C, L = Tukui:unpack()

Engine = CreateFrame('Frame')
Engine['Title'] = select(2, GetAddOnInfo(AddOnName))
Engine['Version'] = GetAddOnMetadata(AddOnName, 'Version')

JasparUI = Engine

Engine:RegisterEvent('PLAYER_LOGIN')
Engine:SetScript('OnEvent', function(self, event, addon)
	self:AddNewPanels()
	self:AddNewBuffs()
	self:AddThreatAltBar()
	self:AddRBReminder()
end)