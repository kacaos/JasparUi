local T, C, L = Tukui:unpack()
local Headers = T.Auras.Headers
local MiniMaps = _G["Minimap"]

function JasparUI:AddNewBuffs()
	-- Resize Buffs/Debuffs offsets
	for i = 1, 2 do
		if (i == 1) then
			Headers[i]:ClearAllPoints()
			Headers[i]:Point("TOPRIGHT", MiniMaps, "TOPLEFT", -3, 1)
			Headers[i]:SetAttribute("xOffset", -32)
		elseif (i == 2) then
			Headers[i]:ClearAllPoints()
			Headers[i]:Point("BOTTOMRIGHT", MiniMaps, "BOTTOMLEFT", -3, -1)
			Headers[i]:SetAttribute("xOffset", -32)
		end
	end

	-- Move Duration and Stacks of Buffs/Debuffs
	local hooks = {
		TukuiConsolidatedHeader,
		TukuiBuffHeader,
		TukuiDebuffHeader,
	}

	local OnAttributeChanged = function(self)
		for i = 1, self:GetNumChildren() do
			local child = select(i, self:GetChildren())

			if child.Duration then
				child.Duration:SetPoint("BOTTOM", 1, -10)
			end

			if child.Count then
				child.Count:SetPoint("TOP", 1, -1)
			end
		end
	end

	for _, frame in pairs(hooks) do
		frame:RegisterEvent("PLAYER_ENTERING_WORLD")
		frame:HookScript("OnAttributeChanged", OnAttributeChanged)
		frame:HookScript("OnEvent", OnAttributeChanged)
	end
end