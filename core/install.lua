local T, C, L = Tukui:unpack()
local Install = T["Install"]

hooksecurefunc(Install, "Step1", function()
	local editbox=ChatEdit_ChooseBoxForSend(DEFAULT_CHAT_FRAME);
	ChatEdit_ActivateChat(editbox);
	editbox:SetText("/tukui dt reset");
	ChatEdit_OnEnterPressed(editbox);
end)


-----------------------------------------
-- Login message
-----------------------------------------
T.JasparRelease = GetAddOnMetadata("JasparUi", "Version")

local JasparLogin = CreateFrame( "Frame" )
JasparLogin:RegisterEvent( "PLAYER_ENTERING_WORLD" )
JasparLogin:SetScript( "OnEvent", function( self, event )
  self:UnregisterEvent( "PLAYER_ENTERING_WORLD" )
  print("Hey, |cff1E90FF"..T.myname.."!|r Thanks for using |cff1E90FFJasparUi|r "..T.JasparRelease..".".." For detailed Information please visit |cff1E90FFhttp://www.tukui.org/addons/index.php?act=view&id=248|r.")
end )

--------------------------------------
-- AddonSkins 1px
--------------------------------------
if not AddOnSkins then return end
local AS = unpack(AddOnSkins)

hooksecurefunc(AS, 'UpdateMedia', function(self)
 AS.PixelPerfect = true
end)