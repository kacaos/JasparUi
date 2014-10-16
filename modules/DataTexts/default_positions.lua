local T, C, L = Tukui:unpack()
local TukuiDT = T["DataTexts"]

hooksecurefunc(TukuiDT, "AddDefaults", function()
	TukuiDataPerChar.Texts = {}
	
	TukuiDataPerChar.Texts[L.DataText.Guild] = {true, 1}
	TukuiDataPerChar.Texts[L.DataText.Durability] = {true, 2}
	TukuiDataPerChar.Texts[L.DataText.Friends] = {true, 3}
	TukuiDataPerChar.Texts[L.DataText.FPSAndMS] = {true, 4}
	TukuiDataPerChar.Texts[L.DataText.Memory] = {true, 5}
	TukuiDataPerChar.Texts[L.DataText.Gold] = {true, 6}
	TukuiDataPerChar.Texts[L.DataText.Power] = {false, 8}
	TukuiDataPerChar.Texts[L.DataText.Time] = {true, 7}
end)