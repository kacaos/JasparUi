T, C, L = Tukui:unpack()
local TukuiUnitFrames = T["UnitFrames"]
local Font = T.GetFont(C["UnitFrames"].Font)

hooksecurefunc(TukuiUnitFrames, "Pet", function(Pet)
	--------------------------------------------------
	-- General
	--------------------------------------------------
	Pet:SetBackdrop( nil )
	Pet:SetBackdropColor( 0, 0, 0 )
	Pet.Shadow:Kill()
	Pet.Panel:Kill()

	--------------------------------------------------
	--Health
	--------------------------------------------------
	Pet.Health:Size( 80, 15 )
	Pet.Health:CreateBackdrop("Default")
	Pet.Health.bg:SetVertexColor(.5, .5, .5)

	--------------------------------------------------
	-- Name
	--------------------------------------------------
	Pet.Name:ClearAllPoints()
	Pet.Name:SetParent(Pet.Health)
	Pet.Name:Point("CENTER", Pet.Health, "CENTER", 0, 0)
	Pet:Tag(Pet.Name, "[Tukui:GetNameColor][Tukui:NameMedium]")

	--------------------------------------------------
	--Power
	--------------------------------------------------
	Pet.Power:Kill()

end)