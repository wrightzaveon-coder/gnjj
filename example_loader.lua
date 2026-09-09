local URL = "https://raw.githubusercontent.com/wrightzaveon-coder/gnjj/refs/heads/main/vfvfv"

local chunk = assert(loadstring(game:HttpGet(URL)))
local library = assert(chunk())

local window = library:window({
    name = "",
    suffix = "",
    -- Upload your image to Roblox as an image/decal, then replace this ID.
    icon = "rbxassetid://YOUR_IMAGE_ID",
    iconSize = UDim2.fromOffset(44, 44),
    gameInfo = "",
    -- Upload the Philly Streetz 2 image to Roblox and replace this ID.
    gameInfoImage = "rbxassetid://YOUR_GAME_IMAGE_ID",
    gameInfoImageSize = UDim2.fromOffset(140, 24),
    size = UDim2.fromOffset(700, 565)
})

-- The current library expects a cache container before tabs are created.
library.cache = library:create("Frame", {
    Parent = library.items,
    Name = "LibraryCache",
    Visible = false,
    BackgroundTransparency = 1,
    Size = UDim2.fromOffset(0, 0)
})

local tabIcon = "rbxassetid://6034767608"
local sectionIcon = "rbxassetid://6022668898"

local function addTab(name)
    return window:tab({
        name = name,
        tabs = {name},
        icon = tabIcon
    })
end

local function addToggle(section, name, flag, default)
    section:toggle({
        name = name,
        flag = flag,
        type = "toggle",
        default = default or false,
        callback = function(state)
            print(flag, state)
        end
    })
end

local function addSlider(section, name, flag, min, max, default, suffix)
    section:slider({
        name = name,
        flag = flag,
        min = min,
        max = max,
        default = default,
        suffix = suffix or "",
        callback = function(value)
            print(flag, value)
        end
    })
end

-- Main
local MainTab = addTab("Main")
local localPlayer = MainTab:column({size = 0.5}):section({
    name = "Local Player",
    size = 1,
    default = true,
    icon = sectionIcon
})

addToggle(localPlayer, "Infinite Stamina", "infinite_stamina", true)
addToggle(localPlayer, "Infinite Hunger", "infinite_hunger", true)
addToggle(localPlayer, "Uses Food From Inventory", "uses_food", false)
addToggle(localPlayer, "Instant Interaction", "instant_interaction", false)
addToggle(localPlayer, "Infinite Jump", "infinite_jump", false)
addToggle(localPlayer, "No Combat", "no_combat", false)
addToggle(localPlayer, "No Knockout", "no_knockout", false)
addToggle(localPlayer, "Anti Handcuff", "anti_handcuff", false)
addToggle(localPlayer, "Anti Ragdoll", "anti_ragdoll", false)
addToggle(localPlayer, "No Fall Damage", "no_fall_damage", false)
addToggle(localPlayer, "No Camera Shake", "no_camera_shake", false)
addToggle(localPlayer, "No Screen Rain", "no_screen_rain", false)

local playerAdjustments = MainTab:column({size = 0.5}):section({
    name = "Player Adjustments",
    side = "right",
    size = 1,
    default = true,
    icon = sectionIcon
})

addToggle(playerAdjustments, "No Clip", "no_clip", false)
addToggle(playerAdjustments, "Walkspeed", "walkspeed_enabled", false)
addSlider(playerAdjustments, "Change Walkspeed", "walkspeed", 0, 200, 16)
addToggle(playerAdjustments, "Enable Fly", "fly_enabled", false)
addSlider(playerAdjustments, "Change Fly Speed", "fly_speed", 0, 200, 50)
addToggle(playerAdjustments, "Spinbot", "spinbot", false)
addSlider(playerAdjustments, "Spinbot Speed", "spinbot_speed", 0, 100, 35)

-- Extra sidebar categories
local money = addTab("Money")
local moneySection = money:column({size = 1}):section({
    name = "Money",
    size = 1,
    default = true,
    icon = sectionIcon
})
addToggle(moneySection, "Auto Collect", "auto_collect", false)
addToggle(moneySection, "Auto Sell", "auto_sell", false)
addSlider(moneySection, "Collection Speed", "collection_speed", 1, 100, 25)

local misc = addTab("Misc")
local miscSection = misc:column({size = 1}):section({
    name = "Miscellaneous",
    size = 1,
    default = true,
    icon = sectionIcon
})
addToggle(miscSection, "Auto Farm", "auto_farm", false)
addToggle(miscSection, "Anti AFK", "anti_afk", false)
addToggle(miscSection, "Hide Notifications", "hide_notifications", false)

local vehicle = addTab("Vehicle")
local vehicleSection = vehicle:column({size = 1}):section({
    name = "Vehicle",
    size = 1,
    default = true,
    icon = sectionIcon
})
addToggle(vehicleSection, "Vehicle Fly", "vehicle_fly", false)
addToggle(vehicleSection, "Infinite Fuel", "infinite_fuel", false)
addSlider(vehicleSection, "Vehicle Speed", "vehicle_speed", 0, 200, 50)

local aimlock = addTab("Aimlock")
local aimlockSection = aimlock:column({size = 1}):section({
    name = "Aimlock",
    size = 1,
    default = true,
    icon = sectionIcon
})
addToggle(aimlockSection, "Enabled", "aimlock_enabled", false)
addToggle(aimlockSection, "Team Check", "aimlock_team_check", true)
aimlockSection:dropdown({
    name = "Aim Part",
    flag = "aim_part",
    items = {"Head", "Torso", "Random"},
    default = "Head",
    multi = false
})
addSlider(aimlockSection, "Smoothness", "aimlock_smoothness", 0, 100, 50, "%")

local silentAim = addTab("Silent Aim")
local silentSection = silentAim:column({size = 1}):section({
    name = "Silent Aim",
    size = 1,
    default = true,
    icon = sectionIcon
})
addToggle(silentSection, "Enabled", "silent_aim_enabled", false)
addToggle(silentSection, "Wall Check", "silent_wall_check", true)
addSlider(silentSection, "Field Of View", "silent_fov", 0, 180, 90, "°")

local visuals = addTab("Visuals")
local visualsSection = visuals:column({size = 1}):section({
    name = "Visuals",
    size = 1,
    default = true,
    icon = sectionIcon
})
addToggle(visualsSection, "ESP", "esp", false)
addToggle(visualsSection, "Names", "esp_names", true)
addToggle(visualsSection, "Distance", "esp_distance", true)
addToggle(visualsSection, "Boxes", "esp_boxes", false)

-- Settings separator and Configs page
window:seperator({name = "Settings"})

local configs = window:tab({
    name = "Configs",
    tabs = {"Configs"},
    icon = "rbxassetid://6022668898"
})

local settings = configs:column({size = 1}):section({
    name = "Settings",
    size = 1,
    default = true,
    icon = sectionIcon
})

settings:textbox({
    name = "Username",
    flag = "username",
    placeholder = "Enter your username"
})

settings:keybind({
    name = "Menu Key",
    flag = "menu_key",
    key = Enum.KeyCode.Insert,
    mode = "Toggle",
    default = false
})

settings:colorpicker({
    name = "Accent Color",
    color = Color3.fromRGB(80, 200, 120)
})
