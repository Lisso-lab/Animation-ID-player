-- I know this UI sucks...

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
local Main = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local IDinput = Instance.new("TextBox")
local UICorner_2 = Instance.new("UICorner")
local IDhere = Instance.new("TextButton")
local ModeTweenCFrameLerp = Instance.new("TextButton")
local ModeInput = Instance.new("TextBox")
local UICorner_3 = Instance.new("UICorner")
local Speed = Instance.new("TextButton")
local PlayButton = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local SpeedInput = Instance.new("TextBox")
local UICorner_5 = Instance.new("UICorner")

ScreenGui.Name = 'Animation ID Player'
ScreenGui.Parent = game.CoreGui

TextLabel.AnchorPoint = Vector2.new(0, 0.5)
TextLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.534934461, 0, 0.370528102, 0)
TextLabel.Size = UDim2.new(0, 206, 0, 32)
TextLabel.ZIndex = 2
TextLabel.Font = Enum.Font.Ubuntu
TextLabel.Text = "Animation ID player"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 18.000
TextLabel.Parent = ScreenGui

Main.Name = "Main"
Main.AnchorPoint = Vector2.new(0, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Main.Position = UDim2.new(-0.000584870868, 0, 4.13782978, 0)
Main.Size = UDim2.new(0, 206, 0, 265)
Main.Parent = TextLabel

UICorner.Parent = Main

IDinput.Name = "ID input"
IDinput.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
IDinput.BorderSizePixel = 0
IDinput.Position = UDim2.new(0.0291262139, 0, 0.273958951, 0)
IDinput.Size = UDim2.new(0, 193, 0, 24)
IDinput.ZIndex = 2
IDinput.Font = Enum.Font.SourceSans
IDinput.PlaceholderText = "ID here"
IDinput.Text = "4846912064"
IDinput.TextColor3 = Color3.fromRGB(255, 255, 255)
IDinput.TextSize = 14.000
IDinput.Parent = Main

UICorner_2.CornerRadius = UDim.new(0, 3)
UICorner_2.Parent = IDinput

IDhere.Name = "ID here:"
IDhere.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
IDhere.BackgroundTransparency = 1.000
IDhere.Position = UDim2.new(0.0268791709, 0, 0.198967218, 0)
IDhere.Size = UDim2.new(0, 57, 0, 20)
IDhere.Font = Enum.Font.Ubuntu
IDhere.Text = "ID here:"
IDhere.TextColor3 = Color3.fromRGB(255, 255, 255)
IDhere.TextSize = 15.000
IDhere.Parent = Main

ModeTweenCFrameLerp.Name = "Mode: (Tween,CFrame,Lerp)"
ModeTweenCFrameLerp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ModeTweenCFrameLerp.BackgroundTransparency = 1.000
ModeTweenCFrameLerp.Position = UDim2.new(0.0221456885, 0, 0.396591127, 0)
ModeTweenCFrameLerp.Size = UDim2.new(0, 186, 0, 25)
ModeTweenCFrameLerp.Font = Enum.Font.Ubuntu
ModeTweenCFrameLerp.Text = "Mode: (Tween,CFrame,Lerp)"
ModeTweenCFrameLerp.TextColor3 = Color3.fromRGB(255, 255, 255)
ModeTweenCFrameLerp.TextSize = 15.000
ModeTweenCFrameLerp.Parent = Main

ModeInput.Name = "Mode Input"
ModeInput.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ModeInput.BorderSizePixel = 0
ModeInput.Position = UDim2.new(0.0291262139, 0, 0.489179492, 0)
ModeInput.Size = UDim2.new(0, 193, 0, 24)
ModeInput.ZIndex = 2
ModeInput.Font = Enum.Font.SourceSans
ModeInput.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
ModeInput.PlaceholderText = "Mode here"
ModeInput.Text = "Tween"
ModeInput.TextColor3 = Color3.fromRGB(255, 255, 255)
ModeInput.TextSize = 14.000
ModeInput.Parent = Main

UICorner_3.CornerRadius = UDim.new(0, 3)
UICorner_3.Parent = ModeInput

Speed.Name = "Speed:"
Speed.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Speed.BackgroundTransparency = 1.000
Speed.Position = UDim2.new(0.0268791709, 0, 0.602740765, 0)
Speed.Size = UDim2.new(0, 57, 0, 20)
Speed.Font = Enum.Font.Ubuntu
Speed.Text = "Speed: "
Speed.TextColor3 = Color3.fromRGB(255, 255, 255)
Speed.TextSize = 15.000
Speed.Parent = Main

PlayButton.Name = "Play Button"
PlayButton.AnchorPoint = Vector2.new(0, 0.5)
PlayButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
PlayButton.Position = UDim2.new(0.0291262139, 0, 0.901886821, 0)
PlayButton.Size = UDim2.new(0, 193, 0, 40)
PlayButton.Font = Enum.Font.SourceSans
PlayButton.Text = "Play"
PlayButton.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayButton.TextSize = 30.000
PlayButton.Parent = Main

UICorner_4.Parent = PlayButton

SpeedInput.Name = "Speed Input"
SpeedInput.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
SpeedInput.BorderSizePixel = 0
SpeedInput.Position = UDim2.new(0.0291262139, 0, 0.677732527, 0)
SpeedInput.Size = UDim2.new(0, 193, 0, 24)
SpeedInput.ZIndex = 2
SpeedInput.Font = Enum.Font.SourceSans
SpeedInput.PlaceholderText = "0.03"
SpeedInput.Text = "0.03"
SpeedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedInput.TextSize = 14.000
SpeedInput.Parent = Main

UICorner_5.CornerRadius = UDim.new(0, 3)
UICorner_5.Parent = SpeedInput

return TextLabel,IDinput,ModeInput,SpeedInput,PlayButton
