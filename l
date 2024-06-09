local PlaceId = game.PlaceId

-- Function to load scripts from URLs
local function loadScript(url)
    local success, script = pcall(game.HttpGetAsync, game, url)
    if success then
        local loadSuccess, loadScript = pcall(loadstring, script)
        if loadSuccess then
            loadScript()
        else
            warn("Failed to load script from URL:", url)
        end
    else
        warn("Failed to fetch script from URL:", url)
    end
end

-- Coroutine to load scripts
local function loadScripts()
    local scriptsToLoad = {}

    if PlaceId == 2753915549 or PlaceId == 4442272183 or PlaceId == 7449423635 then
        table.insert(scriptsToLoad, "https://pastebin.com/raw/fuqe6kTx")
        if PlaceId == 7449423635 then
            table.insert(scriptsToLoad, "https://raw.githubusercontent.com/rakkx/script/main/v2")
        end
    end

    if PlaceId == 17017769292 or PlaceId == 17018663967 then
        table.insert(scriptsToLoad, "https://raw.githubusercontent.com/buang5516/buanghub/main/BUANGHUB.lua")
    end

    -- Load scripts concurrently
    for _, url in ipairs(scriptsToLoad) do
        spawn(function()
            loadScript(url)
        end)
    end
end

spawn(loadScripts)

-- Set FPS cap based on player name
spawn(function()
    local localPlayer = game:GetService("Players").LocalPlayer
    if localPlayer and localPlayer.Name == "BoBoyPiLaYMe" then
        setfpscap(15)
    else
        setfpscap(10)
    end
end)
