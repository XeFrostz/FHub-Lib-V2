-- ty alex
-- loading Frxser Library
local FrxserLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/XeFrostz/FHub-Lib-V2/refs/heads/main/lib.lua"))()

-- Create main window
local Window = FrxserLibrary:CreateWindow({
    Name = "Frxser Library Example", --Title
    Subtitle = "All Elements Demo", -- Subtitle smaller than title
    Version = "you could say premium verison or just v.1.2", -- version of your script(i didnt make it number only tho)
    LoadingTitle = "Frxser UI Library", -- self explanatory
    LoadingSubtitle = "loading...", -- also self explanatory
    Theme = "Default", -- Default, Midnight, Ocean, Emerald, Light, Dark
    AnimationSpeed = 0.2, -- general animation speed for everything                
    RippleEnabled = true, -- wether ripple/pulse should be on or not  default = true           
    RippleSpeed = 0.35,-- how fast the ripple/pulse is                  
    CornerRadius = 12,            
    ElementCornerRadius = 10, -- how round things should be                 
    BlurEnabled = true, -- true = blur when window is maximized false = completely off --default = true
    ConfigurationSaving = {
        Enabled = true, --true = saving everything toggles, dropdwons, slider value, etc.
        FolderName = "FrxserLibExample", --foldername of config
        FileName = "Config" -- filename of config
    },
    ToggleKey = Enum.KeyCode.RightShift --right shift ui toggle
})


local Tab1 = Window:CreateTab({ --Create Tab with name and icon(lucide icons soon)
    Name = "Toggles",
    Icon = "🔘"
})

local Section1 = Tab1:CreateSection("Toggle Examples") --create section for the tab

Section1:CreateToggle({
    Name = "Simple Toggle", -- name
    Flag = "Toggle1", -- basically a tag for the config, please avoid duplicates
    CurrentValue = false, --default value
    Callback = function(value) -- what it does when on
        print("Toggle 1:", value)
    end
})

Section1:CreateToggle({
    Name = "Default ON Toggle", -- same thing
    Flag = "Toggle2",
    CurrentValue = true,
    Callback = function(value)
        print("Toggle 2:", value)
    end
})
--Im tired explaining the rest is from Chatgpt
-- Tab: Sliders
local Tab2 = Window:CreateTab({
    Name = "Sliders",
    Icon = "🎚️"
})

local Section2 = Tab2:CreateSection("Slider Examples")

Section2:CreateSlider({
    Name = "Basic Slider",
    Flag = "Slider1",
    Range = {0, 100},
    Increment = 1,
    CurrentValue = 50,
    Callback = function(value)
        print("Slider 1:", value)
    end
})

Section2:CreateSlider({
    Name = "Speed Slider",
    Flag = "Slider2",
    Range = {16, 500},
    Increment = 5,
    CurrentValue = 16,
    Suffix = " speed",
    Callback = function(value)
        print("Slider 2:", value)
    end
})

-- Tab: Dropdowns
local Tab3 = Window:CreateTab({
    Name = "Dropdowns",
    Icon = "📋"
})

local Section3 = Tab3:CreateSection("Dropdown Examples")

Section3:CreateDropdown({
    Name = "Single Select",
    Flag = "Dropdown1",
    Options = {"Option A", "Option B", "Option C"},
    CurrentOption = "Option A",
    Callback = function(option)
        print("Selected:", option)
    end
})

Section3:CreateDropdown({
    Name = "Multi Select",
    Flag = "Dropdown2",
    Options = {"Red", "Green", "Blue", "Yellow"},
    CurrentOption = {"Red"},
    MultiSelect = true,
    Callback = function(options)
        print("Selected:", table.concat(options, ", "))
    end
})

-- Tab: Buttons
local Tab4 = Window:CreateTab({
    Name = "Buttons",
    Icon = "🔲"
})

local Section4 = Tab4:CreateSection("Button Examples")

Section4:CreateButton({
    Name = "Simple Button",
    Callback = function()
        print("Button clicked!")
    end
})

Section4:CreateButton({
    Name = "Show Notification",
    Callback = function()
        Window:Notify({
            Title = "Success",
            Content = "Button was clicked!",
            Duration = 3,
            Type = "Success"
        })
    end
})

Section4:CreateButton({
    Name = "Show Dialog",
    Callback = function()
        Window:Dialog({
            Title = "Confirmation",
            Content = "Are you sure?",
            Buttons = {
                {
                    Title = "Cancel",
                    Callback = function()
                        print("Cancelled")
                    end
                },
                {
                    Title = "Confirm",
                    Primary = true,
                    Callback = function()
                        print("Confirmed")
                    end
                }
            }
        })
    end
})

-- Tab: Inputs
local Tab5 = Window:CreateTab({
    Name = "Inputs",
    Icon = "⌨️"
})

local Section5 = Tab5:CreateSection("Input Examples")

Section5:CreateInput({
    Name = "Text Input",
    Flag = "Input1",
    PlaceholderText = "Enter text...",
    Callback = function(text)
        print("Input:", text)
    end
})

Section5:CreateKeybind({
    Name = "Keybind",
    Flag = "Keybind1",
    CurrentKeybind = "Q",
    Callback = function()
        print("Keybind pressed!")
    end
})

-- Tab: Colors
local Tab6 = Window:CreateTab({
    Name = "Colors",
    Icon = "🎨"
})

local Section6 = Tab6:CreateSection("Color Picker Examples")

Section6:CreateColorPicker({
    Name = "Color Picker",
    Flag = "ColorPicker1",
    Color = Color3.fromRGB(255, 0, 0),
    Callback = function(color)
        print("Color:", color)
    end
})

-- Tab: Text
local Tab7 = Window:CreateTab({
    Name = "Text",
    Icon = "📝"
})

local Section7 = Tab7:CreateSection("Text Examples")

Section7:CreateLabel("This is a simple label")

Section7:CreateParagraph({
    Title = "Paragraph Title",
    Content = "This is a paragraph with multiple lines.\nIt can contain lots of information.\nVery useful for instructions!"
})

-- Tab: Themes
local Tab8 = Window:CreateTab({
    Name = "Themes",
    Icon = "🎭"
})

local Section8 = Tab8:CreateSection("Theme Selector")

Section8:CreateDropdown({
    Name = "Select Theme",
    Flag = "Theme",
    Options = Window:GetThemes(),
    CurrentOption = Window:GetTheme(),
    Callback = function(theme)
        Window:SetTheme(theme)
    end
})

-- Tab: Notifications
local Tab9 = Window:CreateTab({
    Name = "Notifications",
    Icon = "🔔"
})

local Section9 = Tab9:CreateSection("Notification Types")

Section9:CreateButton({
    Name = "Info Notification",
    Callback = function()
        Window:Notify({
            Title = "Information",
            Content = "This is an info notification",
            Duration = 3,
            Type = "Info"
        })
    end
})

Section9:CreateButton({
    Name = "Success Notification",
    Callback = function()
        Window:Notify({
            Title = "Success",
            Content = "Operation completed!",
            Duration = 3,
            Type = "Success"
        })
    end
})

Section9:CreateButton({
    Name = "Warning Notification",
    Callback = function()
        Window:Notify({
            Title = "Warning",
            Content = "This is a warning!",
            Duration = 3,
            Type = "Warning"
        })
    end
})

Section9:CreateButton({
    Name = "Error Notification",
    Callback = function()
        Window:Notify({
            Title = "Error",
            Content = "Something went wrong!",
            Duration = 3,
            Type = "Error"
        })
    end
})

-- Welcome notification
Window:Notify({
    Title = "Frxser Library Loaded",
    Content = "All UI elements demonstrated!",
    Duration = 5,
    Type = "Success"
})
