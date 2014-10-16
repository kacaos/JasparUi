local T, C, L = Tukui:unpack()
local Install = T["Install"]

hooksecurefunc(Install, "Step1", function()
	local editbox=ChatEdit_ChooseBoxForSend(DEFAULT_CHAT_FRAME);
	ChatEdit_ActivateChat(editbox);
	editbox:SetText("/tukui dt reset");
	ChatEdit_OnEnterPressed(editbox);
end)