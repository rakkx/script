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

-- Function to hide name tag and GUIs above player's head
local function HidePlayerHeadGUI(player)
    -- Check if player exists and their character is valid
    if player and player.Character then
        -- Loop through each part of the character
        for _, part in ipairs(player.Character:GetDescendants()) do
            -- Check if part is a BillboardGui or SurfaceGui
            if part:IsA("BillboardGui") or part:IsA("SurfaceGui") then
                -- Hide the GUI
                part.Enabled = false
            end
        end
    end
end

-- Function to hide player's character
local function HidePlayerCharacter(player)
    -- Check if player exists and their character is valid
    if player and player.Character then
        -- Loop through each part of the character
        for _, part in ipairs(player.Character:GetDescendants()) do
            -- Hide the part
            if part:IsA("BasePart") then
                part.Transparency = 1
            end
        end
    end
end

local function all()
    -- Connect to PlayerAdded event for hiding GUIs and characters
    local function OnPlayerAdded(player)
        HidePlayerHeadGUI(player)
        HidePlayerCharacter(player)
    end

    game.Players.PlayerAdded:Connect(OnPlayerAdded)

    -- Loop through existing players and hide their head GUIs and characters
    for _, player in ipairs(game.Players:GetPlayers()) do
        HidePlayerHeadGUI(player)
        HidePlayerCharacter(player)
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
    if PlaceId == 17017769292 or PlaceId == 17018663967 then
        local localPlayer = game:GetService("Players").LocalPlayer
        if localPlayer and localPlayer.Name == "BoBoyPiLaYMe" then
            setfpscap(15)
			if PlaceId == 17018663967 then
				spawn(all)
			end
        else
            setfpscap(10)
        end
    end
end)
