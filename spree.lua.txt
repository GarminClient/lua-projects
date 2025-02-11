local plr = game.Players.LocalPlayer
local Lib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/BoredStuff2/notify-lib/main/lib'),true))()

Lib.prompt('spree', "Loaded welcome "..plr.Name.." enjoy exploiting",10)






-- Gui to Lua
-- Version: 3.2

-- Instances:

local SpreeCMDS = Instance.new("ScreenGui")
local CmdFrame = Instance.new("Frame")
local SpreeLabel = Instance.new("TextLabel")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local EXECButton = Instance.new("TextButton")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
local CMDBox = Instance.new("TextBox")
local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
local UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
local LogsFrame = Instance.new("Frame")
local UpdateLabel = Instance.new("TextLabel")
local UIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint")
local CloseLabel = Instance.new("TextButton")
local UIAspectRatioConstraint_6 = Instance.new("UIAspectRatioConstraint")
local LogLabel = Instance.new("TextLabel")
local UIAspectRatioConstraint_7 = Instance.new("UIAspectRatioConstraint")
local UIAspectRatioConstraint_8 = Instance.new("UIAspectRatioConstraint")
local UIAspectRatioConstraint_9 = Instance.new("UIAspectRatioConstraint")

--Properties:

SpreeCMDS.Name = "SpreeCMDS"
SpreeCMDS.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
SpreeCMDS.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

CmdFrame.Name = "CmdFrame"
CmdFrame.Parent = SpreeCMDS
CmdFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CmdFrame.BorderSizePixel = 0
CmdFrame.Position = UDim2.new(0.0102915727, 0, 0.783681452, 0)
CmdFrame.Size = UDim2.new(0.262679756, 0, 0.106304079, 0)

SpreeLabel.Name = "SpreeLabel"
SpreeLabel.Parent = CmdFrame
SpreeLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SpreeLabel.BackgroundTransparency = 1.000
SpreeLabel.Position = UDim2.new(-0.115273774, 0, -0.425504625, 0)
SpreeLabel.Size = UDim2.new(0.389049023, 0, 0.383720934, 0)
SpreeLabel.Font = Enum.Font.Gotham
SpreeLabel.Text = "Spree"
SpreeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SpreeLabel.TextSize = 20.000
SpreeLabel.TextWrapped = true

UIAspectRatioConstraint.Parent = SpreeLabel
UIAspectRatioConstraint.AspectRatio = 4.091

EXECButton.Name = "EXECButton"
EXECButton.Parent = CmdFrame
EXECButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EXECButton.BackgroundTransparency = 1.000
EXECButton.Position = UDim2.new(0, 0, 0.616554618, 0)
EXECButton.Size = UDim2.new(1.00000012, 0, 0.372093022, 0)
EXECButton.Font = Enum.Font.Gotham
EXECButton.Text = "execute command"
EXECButton.TextColor3 = Color3.fromRGB(255, 255, 255)
EXECButton.TextSize = 20.000

UIAspectRatioConstraint_2.Parent = EXECButton
UIAspectRatioConstraint_2.AspectRatio = 10.844

CMDBox.Name = "CMDBox"
CMDBox.Parent = CmdFrame
CMDBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CMDBox.BackgroundTransparency = 1.000
CMDBox.Size = UDim2.new(1.00000012, 0, 0.558139563, 0)
CMDBox.Font = Enum.Font.Gotham
CMDBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
CMDBox.PlaceholderText = "Command Here"
CMDBox.Text = ""
CMDBox.TextColor3 = Color3.fromRGB(255, 255, 255)
CMDBox.TextSize = 20.000

UIAspectRatioConstraint_3.Parent = CMDBox
UIAspectRatioConstraint_3.AspectRatio = 7.229

UIAspectRatioConstraint_4.Parent = CmdFrame
UIAspectRatioConstraint_4.AspectRatio = 4.035

LogsFrame.Name = "LogsFrame"
LogsFrame.Parent = SpreeCMDS
LogsFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
LogsFrame.BorderSizePixel = 0
LogsFrame.Position = UDim2.new(0.00424242392, 0, 0.260815829, 0)
LogsFrame.Size = UDim2.new(0.332323998, 0, 0.313967854, 0)
LogsFrame.Visible = false

UpdateLabel.Name = "UpdateLabel"
UpdateLabel.Parent = LogsFrame
UpdateLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UpdateLabel.BackgroundTransparency = 1.000
UpdateLabel.Size = UDim2.new(0.280182242, 0, 0.196850389, 0)
UpdateLabel.Font = Enum.Font.Gotham
UpdateLabel.Text = "UpdateLog"
UpdateLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
UpdateLabel.TextSize = 20.000
UpdateLabel.TextWrapped = true

UIAspectRatioConstraint_5.Parent = UpdateLabel
UIAspectRatioConstraint_5.AspectRatio = 2.460

CloseLabel.Name = "CloseLabel"
CloseLabel.Parent = LogsFrame
CloseLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CloseLabel.BackgroundTransparency = 1.000
CloseLabel.Position = UDim2.new(0.867881536, 0, 0, 0)
CloseLabel.Size = UDim2.new(0.132118449, 0, 0.196850389, 0)
CloseLabel.Font = Enum.Font.Gotham
CloseLabel.Text = "X"
CloseLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseLabel.TextSize = 20.000
CloseLabel.TextWrapped = true

UIAspectRatioConstraint_6.Parent = CloseLabel
UIAspectRatioConstraint_6.AspectRatio = 1.160

LogLabel.Name = "LogLabel"
LogLabel.Parent = LogsFrame
LogLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LogLabel.BackgroundTransparency = 1.000
LogLabel.Position = UDim2.new(0, 0, 0.196850389, 0)
LogLabel.Size = UDim2.new(0.416856498, 0, 0.196850389, 0)
LogLabel.Font = Enum.Font.Gotham
LogLabel.Text = "7/8/2022: Created"
LogLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
LogLabel.TextSize = 20.000
LogLabel.TextWrapped = true

UIAspectRatioConstraint_7.Parent = LogLabel
UIAspectRatioConstraint_7.AspectRatio = 3.660

UIAspectRatioConstraint_8.Parent = LogsFrame
UIAspectRatioConstraint_8.AspectRatio = 1.728

UIAspectRatioConstraint_9.Parent = SpreeCMDS
UIAspectRatioConstraint_9.AspectRatio = 1.633

SpreeCMDS.Parent = game.CoreGui
--commands
EXECButton.MouseButton1Click:Connect(function()
	if CMDBox.Text == "fact" then
        Lib.prompt('Fact', game:GetService("HttpService"):JSONDecode(game:HttpGet("https://uselessfacts.jsph.pl/random.json?language=en")).text, 5)
    end
end)

EXECButton.MouseButton1Click:Connect(function()
	if CMDBox.Text == "updates" then
        LogsFrame.Visible = true
    end
end)

EXECButton.MouseButton1Click:Connect(function()
	if CMDBox.Text == "esp" then
getgenv().enabled = true --Toggle on/off
getgenv().uselocalplayer = false --Choose whether the ESP highlights LocalPlayer or not
getgenv().filluseteamcolor = false --Toggle fill color using player team color on/off
getgenv().outlineuseteamcolor = false --Toggle outline color using player team color on/off
getgenv().fillcolor = Color3.new(0, 0, 0) --Change fill color, no need to edit if using team color
getgenv().outlinecolor = Color3.new(1, 1, 1) --Change outline color, no need to edit if using team color
getgenv().filltrans = 1 --Change fill transparency
getgenv().outlinetrans = 0 --Change outline transparency

loadstring(game:HttpGet("https://raw.githubusercontent.com/zntly/highlight-esp/main/esp.lua"))()
Lib.prompt('spree', "Credits to hountor haziste on v3rm",10)
    end
end)

EXECButton.MouseButton1Click:Connect(function()
	if CMDBox.Text == "unesp" then
getgenv().enabled = false --Toggle on/off
getgenv().uselocalplayer = false --Choose whether the ESP highlights LocalPlayer or not
getgenv().filluseteamcolor = false --Toggle fill color using player team color on/off
getgenv().outlineuseteamcolor = false --Toggle outline color using player team color on/off
getgenv().fillcolor = Color3.new(0, 0, 0) --Change fill color, no need to edit if using team color
getgenv().outlinecolor = Color3.new(1, 1, 1) --Change outline color, no need to edit if using team color
getgenv().filltrans = 1 --Change fill transparency
getgenv().outlinetrans = 0 --Change outline transparency

loadstring(game:HttpGet("https://raw.githubusercontent.com/zntly/highlight-esp/main/esp.lua"))()

    end
end)

EXECButton.MouseButton1Click:Connect(function()
	if CMDBox.Text == "fly" then
        loadstring(game:HttpGet("https://pastebin.com/raw/7rXZ9VNc", true))()
        Lib.prompt('spree', "Press e To Fly", 5)
    end
end)

EXECButton.MouseButton1Click:Connect(function()
	if CMDBox.Text == "cfact" then
local args = {
    [1] = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://uselessfacts.jsph.pl/random.json?language=en")).text,
    [2] = "All"
}

game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
    end
end)

EXECButton.MouseButton1Click:Connect(function()
	if CMDBox.Text == "inf" then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
end)

EXECButton.MouseButton1Click:Connect(function()
	if CMDBox.Text == "reset" then
	   plr.Character.Humanoid.Health = 0
    end
end)
EXECButton.MouseButton1Click:Connect(function()
	if CMDBox.Text == "ks" then
	   SpreeCMDS:Destroy()
    end
end)
































