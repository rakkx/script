repeat wait() until game:IsLoaded()
local PlaceId = game.PlaceId
if PlaceId == 2753915549 or PlaceId == 4442272183 or PlaceId == 7449423635 then
	loadstring(game:HttpGet("https://pastebin.com/raw/fuqe6kTx"))()
	if PlaceId == 7449423635 then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/rakkx/script/main/v2"))()
	end
elseif PlaceId == 17017769292 or PlaceId == 17018663967 then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/buang5516/buanghub/main/BUANGHUB.lua"))()
	if game:GetService("Players").LocalPlayer.Name == "BoBoyPiLaYMe" then
			setfpscap(15)
		else
			setfpscap(10)
	end
end
