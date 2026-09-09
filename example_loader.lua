local URL = "https://raw.githubusercontent.com/wrightzaveon-coder/gnjj/refs/heads/main/vfvfv"

local chunk = assert(loadstring(game:HttpGet(URL)))
local library = assert(chunk())

local window = library:window({
    name = "My Hub",
    suffix = "",
    gameInfo = "Universal",
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

local MainTab, SettingsTab = window:tab({
    name = "Main",
    tabs = {"General", "Settings"},
    icon = "rbxassetid://6034767608"
})

local leftColumn = MainTab:column({size = 0.5})
local rightColumn = MainTab:column({size = 0.5})

local general = leftColumn:section({
    name = "General",
    size = 1,
    default = true,
    icon = "rbxassetid://6022668898"
})

general:label({
    name = "Welcome to My Hub",
    wrapped = true,
    info = "Your first working window."
})

general:toggle({
    name = "Enabled",
    flag = "enabled",
    type = "toggle",
    default = false,
    callback = function(state)
        print("Enabled:", state)
    end
})

general:slider({
    name = "Power",
    flag = "power",
    min = 0,
    max = 100,
    default = 50,
    suffix = "%",
    callback = function(value)
        print("Power:", value)
    end
})

general:dropdown({
    name = "Mode",
    flag = "mode",
    items = {"Legit", "Aggressive", "Custom"},
    default = "Legit",
    multi = false,
    callback = function(value)
        print("Mode:", value)
    end
})

general:button({
    name = "Test Notification",
    callback = function()
        library.notifications:create_notification({
            name = "My Hub",
            info = "The button was pressed.",
            lifetime = 3
        })
    end
})

local settings = rightColumn:section({
    name = "Settings",
    side = "right",
    size = 1,
    default = true
})

settings:textbox({
    name = "Username",
    flag = "username",
    placeholder = "Enter your username",
    callback = function(text)
        print("Username:", text)
    end
})

settings:keybind({
    name = "Menu Key",
    flag = "menu_key",
    key = Enum.KeyCode.Insert,
    mode = "Toggle",
    default = false,
    callback = function(active)
        print("Menu key active:", active)
    end
})

settings:colorpicker({
    name = "Accent Color",
    color = Color3.fromRGB(255, 0, 0),
    callback = function(color, alpha)
        print("Accent changed:", color, alpha)
    end
})
