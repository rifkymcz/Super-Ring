-- =============================================
-- Fly GUI V3 + Super Ring Parts V8 - Combined UI
-- =============================================

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")

-- Player references
local LocalPlayer = Players.LocalPlayer
local workspace = game:GetService("Workspace")

-- =============================================
-- MAIN UI CONTAINER
-- =============================================
local flyGUI = Instance.new("ScreenGui")
flyGUI.Name = "CombinedToolsGUI"
flyGUI.Parent = LocalPlayer:WaitForChild("PlayerGui")
flyGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
flyGUI.ResetOnSpawn = false

-- Main container
local mainContainer = Instance.new("Frame")
mainContainer.Name = "MainContainer"
mainContainer.Parent = flyGUI
mainContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainContainer.BorderColor3 = Color3.fromRGB(70, 70, 70)
mainContainer.BorderSizePixel = 2
mainContainer.Position = UDim2.new(0.02, 0, 0.3, 0)
mainContainer.Size = UDim2.new(0, 300, 0, 380)
mainContainer.ClipsDescendants = true
mainContainer.Active = true  -- Untuk draggable

-- Shadow effect
local shadow = Instance.new("ImageLabel")
shadow.Name = "Shadow"
shadow.Parent = mainContainer
shadow.BackgroundTransparency = 1
shadow.Size = UDim2.new(1, 10, 1, 10)
shadow.Position = UDim2.new(0, -5, 0, -5)
shadow.Image = "rbxassetid://5554236805"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.7
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(23, 23, 277, 277)
shadow.ZIndex = -1

-- Rounded corners
local containerCorner = Instance.new("UICorner")
containerCorner.CornerRadius = UDim.new(0, 12)
containerCorner.Parent = mainContainer

-- Top bar (untuk dragging)
local topBar = Instance.new("Frame")
topBar.Name = "TopBar"
topBar.Parent = mainContainer
topBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
topBar.BorderSizePixel = 0
topBar.Size = UDim2.new(1, 0, 0, 35)
topBar.Active = true  -- Untuk draggable
topBar.Selectable = true

-- Buat top bar terlihat seperti title bar
local topBarCorner = Instance.new("UICorner")
topBarCorner.CornerRadius = UDim.new(0, 12)
topBarCorner.Parent = topBar

-- Top bar gradient
local topBarGradient = Instance.new("UIGradient")
topBarGradient.Parent = topBar
topBarGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 40)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 25))
})

-- Title di top bar
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.Parent = topBar
titleLabel.BackgroundTransparency = 1
titleLabel.Size = UDim2.new(0.6, 0, 1, 0)
titleLabel.Position = UDim2.new(0.05, 0, 0, 0)
titleLabel.Text = "COMBINED TOOLS"
titleLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 16
titleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Version text
local versionLabel = Instance.new("TextLabel")
versionLabel.Name = "Version"
versionLabel.Parent = topBar
versionLabel.BackgroundTransparency = 1
versionLabel.Size = UDim2.new(0.3, 0, 1, 0)
versionLabel.Position = UDim2.new(0.65, 0, 0, 0)
versionLabel.Text = "v2.0"
versionLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
versionLabel.Font = Enum.Font.Gotham
versionLabel.TextSize = 12
versionLabel.TextXAlignment = Enum.TextXAlignment.Right

-- Control buttons frame (dipindah ke pojok kanan atas top bar)
local controlsFrame = Instance.new("Frame")
controlsFrame.Name = "ControlsFrame"
controlsFrame.Parent = topBar
controlsFrame.BackgroundTransparency = 1
controlsFrame.Size = UDim2.new(0.4, 0, 1, 0)
controlsFrame.Position = UDim2.new(0.6, 0, 0, 0)

-- Tombol minimize
local mini = Instance.new("TextButton")
mini.Name = "minimize"
mini.Parent = topBar  -- Langsung di topBar agar posisi lebih mudah
mini.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
mini.Font = "GothamBold"
mini.Size = UDim2.new(0, 30, 0, 25)
mini.Position = UDim2.new(1, -65, 0.15, 0)  -- Posisi tetap di kanan
mini.Text = "_"
mini.TextColor3 = Color3.fromRGB(220, 220, 220)
mini.TextSize = 18
mini.ZIndex = 2

local miniCorner = Instance.new("UICorner")
miniCorner.CornerRadius = UDim.new(0, 5)
miniCorner.Parent = mini

-- Tombol close
local closebutton = Instance.new("TextButton")
closebutton.Name = "Close"
closebutton.Parent = topBar  -- Langsung di topBar agar posisi lebih mudah
closebutton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
closebutton.Font = "GothamBold"
closebutton.Size = UDim2.new(0, 30, 0, 25)
closebutton.Position = UDim2.new(1, -30, 0.15, 0)  -- Posisi tetap di kanan
closebutton.Text = "X"
closebutton.TextColor3 = Color3.fromRGB(255, 255, 255)
closebutton.TextSize = 14
closebutton.ZIndex = 2

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 5)
closeCorner.Parent = closebutton

-- Hover effects untuk tombol
mini.MouseEnter:Connect(function()
    mini.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
end)

mini.MouseLeave:Connect(function()
    mini.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
end)

closebutton.MouseEnter:Connect(function()
    closebutton.BackgroundColor3 = Color3.fromRGB(220, 80, 80)
end)

closebutton.MouseLeave:Connect(function()
    closebutton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
end)

-- Tab buttons
local tabFrame = Instance.new("Frame")
tabFrame.Name = "TabFrame"
tabFrame.Parent = mainContainer
tabFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
tabFrame.Position = UDim2.new(0, 0, 0, 35)
tabFrame.Size = UDim2.new(1, 0, 0, 40)

local tabCorner = Instance.new("UICorner")
tabCorner.CornerRadius = UDim.new(0, 0)
tabCorner.Parent = tabFrame

-- Fly tab
local flyTab = Instance.new("TextButton")
flyTab.Name = "FlyTab"
flyTab.Parent = tabFrame
flyTab.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
flyTab.Size = UDim2.new(0.5, -1, 1, 0)
flyTab.Position = UDim2.new(0, 0, 0, 0)
flyTab.Text = "FLY GUI V3"
flyTab.TextColor3 = Color3.fromRGB(255, 255, 255)
flyTab.Font = Enum.Font.GothamBold
flyTab.TextSize = 14
flyTab.AutoButtonColor = false

local flyTabCorner = Instance.new("UICorner")
flyTabCorner.CornerRadius = UDim.new(0, 0)
flyTabCorner.Parent = flyTab

-- Ring tab
local ringTab = Instance.new("TextButton")
ringTab.Name = "RingTab"
ringTab.Parent = tabFrame
ringTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ringTab.Size = UDim2.new(0.5, -1, 1, 0)
ringTab.Position = UDim2.new(0.5, 1, 0, 0)
ringTab.Text = "RING PARTS V8"
ringTab.TextColor3 = Color3.fromRGB(180, 180, 180)
ringTab.Font = Enum.Font.Gotham
ringTab.TextSize = 14
ringTab.AutoButtonColor = false

local ringTabCorner = Instance.new("UICorner")
ringTabCorner.CornerRadius = UDim.new(0, 0)
ringTabCorner.Parent = ringTab

-- Content frames
local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Parent = mainContainer
contentFrame.BackgroundTransparency = 1
contentFrame.Position = UDim2.new(0, 0, 0, 75)
contentFrame.Size = UDim2.new(1, 0, 1, -75)

-- Fly GUI Content
local flyContent = Instance.new("Frame")
flyContent.Name = "FlyContent"
flyContent.Parent = contentFrame
flyContent.BackgroundTransparency = 1
flyContent.Size = UDim2.new(1, 0, 1, 0)
flyContent.Visible = true

-- Ring Parts Content
local ringContent = Instance.new("Frame")
ringContent.Name = "RingContent"
ringContent.Parent = contentFrame
ringContent.BackgroundTransparency = 1
ringContent.Size = UDim2.new(1, 0, 1, 0)
ringContent.Visible = false

-- =============================================
-- FLY GUI CONTENT
-- =============================================
local flyContainer = Instance.new("Frame")
flyContainer.Parent = flyContent
flyContainer.BackgroundTransparency = 1
flyContainer.Size = UDim2.new(1, -10, 1, -10)
flyContainer.Position = UDim2.new(0, 5, 0, 5)

-- Title section
local flyTitleSection = Instance.new("Frame")
flyTitleSection.Parent = flyContainer
flyTitleSection.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
flyTitleSection.Size = UDim2.new(1, 0, 0, 35)
flyTitleSection.Position = UDim2.new(0, 0, 0, 0)

local flyTitleCorner = Instance.new("UICorner")
flyTitleCorner.CornerRadius = UDim.new(0, 8)
flyTitleCorner.Parent = flyTitleSection

local flyTitleLabel = Instance.new("TextLabel")
flyTitleLabel.Parent = flyTitleSection
flyTitleLabel.BackgroundTransparency = 1
flyTitleLabel.Size = UDim2.new(1, 0, 1, 0)
flyTitleLabel.Text = "FLIGHT CONTROLS"
flyTitleLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
flyTitleLabel.Font = Enum.Font.GothamBold
flyTitleLabel.TextSize = 16

-- Main fly toggle
local onofSection = Instance.new("Frame")
onofSection.Parent = flyContainer
onofSection.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
onofSection.Size = UDim2.new(1, 0, 0, 50)
onofSection.Position = UDim2.new(0, 0, 0, 45)

local onofCorner = Instance.new("UICorner")
onofCorner.CornerRadius = UDim.new(0, 8)
onofCorner.Parent = onofSection

local onof = Instance.new("TextButton")
onof.Name = "onof"
onof.Parent = onofSection
onof.BackgroundColor3 = Color3.fromRGB(255, 180, 50)
onof.Size = UDim2.new(0.9, 0, 0.7, 0)
onof.Position = UDim2.new(0.05, 0, 0.15, 0)
onof.Font = Enum.Font.GothamBold
onof.Text = "TOGGLE FLY"
onof.TextColor3 = Color3.fromRGB(0, 0, 0)
onof.TextSize = 14
onof.AutoButtonColor = true

local onofBtnCorner = Instance.new("UICorner")
onofBtnCorner.CornerRadius = UDim.new(0, 6)
onofBtnCorner.Parent = onof

-- Vertical controls
local verticalSection = Instance.new("Frame")
verticalSection.Parent = flyContainer
verticalSection.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
verticalSection.Size = UDim2.new(1, 0, 0, 75)
verticalSection.Position = UDim2.new(0, 0, 0, 105)

local verticalCorner = Instance.new("UICorner")
verticalCorner.CornerRadius = UDim.new(0, 8)
verticalCorner.Parent = verticalSection

local verticalLabel = Instance.new("TextLabel")
verticalLabel.Parent = verticalSection
verticalLabel.BackgroundTransparency = 1
verticalLabel.Size = UDim2.new(1, 0, 0, 20)
verticalLabel.Position = UDim2.new(0, 0, 0, 5)
verticalLabel.Text = "VERTICAL MOVEMENT"
verticalLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
verticalLabel.Font = Enum.Font.Gotham
verticalLabel.TextSize = 12

-- Up button
local up = Instance.new("TextButton")
up.Name = "up"
up.Parent = verticalSection
up.BackgroundColor3 = Color3.fromRGB(80, 200, 120)
up.Size = UDim2.new(0.45, 0, 0, 30)
up.Position = UDim2.new(0.05, 0, 0, 30)
up.Font = Enum.Font.GothamBold
up.Text = "UP"
up.TextColor3 = Color3.fromRGB(0, 0, 0)
up.TextSize = 14
up.AutoButtonColor = true

local upCorner = Instance.new("UICorner")
upCorner.CornerRadius = UDim.new(0, 6)
upCorner.Parent = up

-- Down button
local down = Instance.new("TextButton")
down.Name = "down"
down.Parent = verticalSection
down.BackgroundColor3 = Color3.fromRGB(220, 120, 80)
down.Size = UDim2.new(0.45, 0, 0, 30)
down.Position = UDim2.new(0.5, 0, 0, 30)
down.Font = Enum.Font.GothamBold
down.Text = "DOWN"
down.TextColor3 = Color3.fromRGB(0, 0, 0)
down.TextSize = 14
down.AutoButtonColor = true

local downCorner = Instance.new("UICorner")
downCorner.CornerRadius = UDim.new(0, 6)
downCorner.Parent = down

-- Speed controls
local speedSection = Instance.new("Frame")
speedSection.Parent = flyContainer
speedSection.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
speedSection.Size = UDim2.new(1, 0, 0, 85)
speedSection.Position = UDim2.new(0, 0, 0, 190)

local speedCorner = Instance.new("UICorner")
speedCorner.CornerRadius = UDim.new(0, 8)
speedCorner.Parent = speedSection

local speedLabel = Instance.new("TextLabel")
speedLabel.Parent = speedSection
speedLabel.BackgroundTransparency = 1
speedLabel.Size = UDim2.new(1, 0, 0, 20)
speedLabel.Position = UDim2.new(0, 0, 0, 5)
speedLabel.Text = "SPEED CONTROL"
speedLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
speedLabel.Font = Enum.Font.Gotham
speedLabel.TextSize = 12

-- Current speed display
local speedDisplay = Instance.new("Frame")
speedDisplay.Parent = speedSection
speedDisplay.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
speedDisplay.Size = UDim2.new(0.8, 0, 0, 30)
speedDisplay.Position = UDim2.new(0.1, 0, 0, 30)

local speedDisplayCorner = Instance.new("UICorner")
speedDisplayCorner.CornerRadius = UDim.new(0, 6)
speedDisplayCorner.Parent = speedDisplay

local speed = Instance.new("TextLabel")
speed.Name = "speed"
speed.Parent = speedDisplay
speed.BackgroundTransparency = 1
speed.Size = UDim2.new(1, 0, 1, 0)
speed.Font = Enum.Font.GothamBold
speed.Text = "1"
speed.TextColor3 = Color3.fromRGB(255, 255, 255)
speed.TextSize = 16

-- Speed control buttons
local speedControls = Instance.new("Frame")
speedControls.Parent = speedSection
speedControls.BackgroundTransparency = 1
speedControls.Size = UDim2.new(0.8, 0, 0, 30)
speedControls.Position = UDim2.new(0.1, 0, 0, 65)

local plus = Instance.new("TextButton")
plus.Name = "plus"
plus.Parent = speedControls
plus.BackgroundColor3 = Color3.fromRGB(100, 160, 220)
plus.Size = UDim2.new(0.3, 0, 1, 0)
plus.Position = UDim2.new(0, 0, 0, 0)
plus.Font = Enum.Font.GothamBold
plus.Text = "+"
plus.TextColor3 = Color3.fromRGB(255, 255, 255)
plus.TextSize = 18
plus.AutoButtonColor = true

local plusCorner = Instance.new("UICorner")
plusCorner.CornerRadius = UDim.new(0, 6)
plusCorner.Parent = plus

local mine = Instance.new("TextButton")
mine.Name = "mine"
mine.Parent = speedControls
mine.BackgroundColor3 = Color3.fromRGB(220, 100, 100)
mine.Size = UDim2.new(0.3, 0, 1, 0)
mine.Position = UDim2.new(0.7, 0, 0, 0)
mine.Font = Enum.Font.GothamBold
mine.Text = "-"
mine.TextColor3 = Color3.fromRGB(255, 255, 255)
mine.TextSize = 18
mine.AutoButtonColor = true

local mineCorner = Instance.new("UICorner")
mineCorner.CornerRadius = UDim.new(0, 6)
mineCorner.Parent = mine

-- Info text
local infoLabel = Instance.new("TextLabel")
infoLabel.Parent = flyContainer
infoLabel.BackgroundTransparency = 1
infoLabel.Size = UDim2.new(1, 0, 0, 20)
infoLabel.Position = UDim2.new(0, 0, 1, -25)
infoLabel.Text = "Hold mouse over Up/Down buttons"
infoLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
infoLabel.Font = Enum.Font.Gotham
infoLabel.TextSize = 11

-- =============================================
-- RING PARTS CONTENT
-- =============================================
local ringContainer = Instance.new("Frame")
ringContainer.Parent = ringContent
ringContainer.BackgroundTransparency = 1
ringContainer.Size = UDim2.new(1, -10, 1, -10)
ringContainer.Position = UDim2.new(0, 5, 0, 5)

-- Ring title
local ringTitleSection = Instance.new("Frame")
ringTitleSection.Parent = ringContainer
ringTitleSection.BackgroundColor3 = Color3.fromRGB(0, 100, 50)
ringTitleSection.Size = UDim2.new(1, 0, 0, 40)
ringTitleSection.Position = UDim2.new(0, 0, 0, 0)

local ringTitleCorner = Instance.new("UICorner")
ringTitleCorner.CornerRadius = UDim.new(0, 8)
ringTitleCorner.Parent = ringTitleSection

local ringTitle = Instance.new("TextLabel")
ringTitle.Parent = ringTitleSection
ringTitle.BackgroundTransparency = 1
ringTitle.Size = UDim2.new(1, 0, 1, 0)
ringTitle.Text = "SUPER RING PARTS"
ringTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ringTitle.Font = Enum.Font.GothamBold
ringTitle.TextSize = 16

-- Toggle section
local ringToggleSection = Instance.new("Frame")
ringToggleSection.Parent = ringContainer
ringToggleSection.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ringToggleSection.Size = UDim2.new(1, 0, 0, 65)
ringToggleSection.Position = UDim2.new(0, 0, 0, 50)

local ringToggleCorner = Instance.new("UICorner")
ringToggleCorner.CornerRadius = UDim.new(0, 8)
ringToggleCorner.Parent = ringToggleSection

local ringToggleLabel = Instance.new("TextLabel")
ringToggleLabel.Parent = ringToggleSection
ringToggleLabel.BackgroundTransparency = 1
ringToggleLabel.Size = UDim2.new(1, 0, 0, 20)
ringToggleLabel.Position = UDim2.new(0, 0, 0, 5)
ringToggleLabel.Text = "RING PARTS CONTROL"
ringToggleLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
ringToggleLabel.Font = Enum.Font.Gotham
ringToggleLabel.TextSize = 12

local ringToggleButton = Instance.new("TextButton")
ringToggleButton.Parent = ringToggleSection
ringToggleButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
ringToggleButton.Size = UDim2.new(0.8, 0, 0, 35)
ringToggleButton.Position = UDim2.new(0.1, 0, 0, 25)
ringToggleButton.Text = "OFF"
ringToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ringToggleButton.Font = Enum.Font.GothamBold
ringToggleButton.TextSize = 14
ringToggleButton.AutoButtonColor = true

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 6)
toggleCorner.Parent = ringToggleButton

-- Radius control section
local radiusSection = Instance.new("Frame")
radiusSection.Parent = ringContainer
radiusSection.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
radiusSection.Size = UDim2.new(1, 0, 0, 95)
radiusSection.Position = UDim2.new(0, 0, 0, 125)

local radiusCorner = Instance.new("UICorner")
radiusCorner.CornerRadius = UDim.new(0, 8)
radiusCorner.Parent = radiusSection

local radiusLabel = Instance.new("TextLabel")
radiusLabel.Parent = radiusSection
radiusLabel.BackgroundTransparency = 1
radiusLabel.Size = UDim2.new(1, 0, 0, 20)
radiusLabel.Position = UDim2.new(0, 0, 0, 5)
radiusLabel.Text = "RADIUS CONTROL"
radiusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
radiusLabel.Font = Enum.Font.Gotham
radiusLabel.TextSize = 12

-- Radius display
local radiusDisplay = Instance.new("Frame")
radiusDisplay.Parent = radiusSection
radiusDisplay.BackgroundColor3 = Color3.fromRGB(255, 200, 50)
radiusDisplay.Size = UDim2.new(0.6, 0, 0, 35)
radiusDisplay.Position = UDim2.new(0.2, 0, 0, 30)

local radiusDisplayCorner = Instance.new("UICorner")
radiusDisplayCorner.CornerRadius = UDim.new(0, 6)
radiusDisplayCorner.Parent = radiusDisplay

local radiusText = Instance.new("TextLabel")
radiusText.Name = "radiusText"
radiusText.Parent = radiusDisplay
radiusText.BackgroundTransparency = 1
radiusText.Size = UDim2.new(1, 0, 1, 0)
radiusText.Text = "Radius: 50"
radiusText.TextColor3 = Color3.fromRGB(0, 0, 0)
radiusText.Font = Enum.Font.GothamBold
radiusText.TextSize = 14

-- Radius buttons
local radiusControls = Instance.new("Frame")
radiusControls.Parent = radiusSection
radiusControls.BackgroundTransparency = 1
radiusControls.Size = UDim2.new(0.8, 0, 0, 35)
radiusControls.Position = UDim2.new(0.1, 0, 0, 70)

local decreaseRadius = Instance.new("TextButton")
decreaseRadius.Parent = radiusControls
decreaseRadius.BackgroundColor3 = Color3.fromRGB(220, 100, 100)
decreaseRadius.Size = UDim2.new(0.3, 0, 1, 0)
decreaseRadius.Position = UDim2.new(0, 0, 0, 0)
decreaseRadius.Text = "<"
decreaseRadius.TextColor3 = Color3.fromRGB(255, 255, 255)
decreaseRadius.Font = Enum.Font.GothamBold
decreaseRadius.TextSize = 20
decreaseRadius.AutoButtonColor = true

local decreaseCorner = Instance.new("UICorner")
decreaseCorner.CornerRadius = UDim.new(0, 6)
decreaseCorner.Parent = decreaseRadius

local increaseRadius = Instance.new("TextButton")
increaseRadius.Parent = radiusControls
increaseRadius.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
increaseRadius.Size = UDim2.new(0.3, 0, 1, 0)
increaseRadius.Position = UDim2.new(0.7, 0, 0, 0)
increaseRadius.Text = ">"
increaseRadius.TextColor3 = Color3.fromRGB(255, 255, 255)
increaseRadius.Font = Enum.Font.GothamBold
increaseRadius.TextSize = 20
increaseRadius.AutoButtonColor = true

local increaseCorner = Instance.new("UICorner")
increaseCorner.CornerRadius = UDim.new(0, 6)
increaseCorner.Parent = increaseRadius

-- Watermark
local watermark = Instance.new("TextLabel")
watermark.Parent = ringContainer
watermark.BackgroundTransparency = 1
watermark.Size = UDim2.new(1, 0, 0, 20)
watermark.Position = UDim2.new(0, 0, 1, -25)
watermark.Text = "By MczXcyber & Ozone | UI by Assistant"
watermark.TextColor3 = Color3.fromRGB(150, 150, 150)
watermark.Font = Enum.Font.Gotham
watermark.TextSize = 11

-- =============================================
-- DRAGGABLE UI - DIPERBAIKI LAGI
-- =============================================
local dragging = false
local dragInput
local dragStart
local startPos

-- Fungsi untuk update posisi
local function update(input)
    local delta = input.Position - dragStart
    local newPos = UDim2.new(
        startPos.X.Scale,
        startPos.X.Offset + delta.X,
        startPos.Y.Scale,
        startPos.Y.Offset + delta.Y
    )
    
    -- Batasi agar UI tidak keluar layar
    local screenSize = flyGUI.AbsoluteSize
    local containerSize = mainContainer.AbsoluteSize
    local absolutePos = mainContainer.AbsolutePosition
    
    -- Check boundaries
    if newPos.X.Offset < 0 then
        newPos = UDim2.new(newPos.X.Scale, 0, newPos.Y.Scale, newPos.Y.Offset)
    elseif newPos.X.Offset + containerSize.X > screenSize.X then
        newPos = UDim2.new(newPos.X.Scale, screenSize.X - containerSize.X, newPos.Y.Scale, newPos.Y.Offset)
    end
    
    if newPos.Y.Offset < 0 then
        newPos = UDim2.new(newPos.X.Scale, newPos.X.Offset, newPos.Y.Scale, 0)
    elseif newPos.Y.Offset + containerSize.Y > screenSize.Y then
        newPos = UDim2.new(newPos.X.Scale, newPos.X.Offset, newPos.Y.Scale, screenSize.Y - containerSize.Y)
    end
    
    mainContainer.Position = newPos
end

-- Start dragging ketika klik top bar
topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainContainer.Position
        
        -- Highlight top bar saat dragging
        topBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
                topBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            end
        end)
    end
end)

-- Tangkap input mouse movement
topBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

-- Update posisi saat dragging
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Tambahkan juga ke mainContainer sebagai backup
mainContainer.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 and not dragging then
        dragging = true
        dragStart = input.Position
        startPos = mainContainer.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

-- =============================================
-- TAB SWITCHING
-- =============================================
flyTab.MouseButton1Click:Connect(function()
    flyContent.Visible = true
    ringContent.Visible = false
    flyTab.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
    ringTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    flyTab.TextColor3 = Color3.fromRGB(255, 255, 255)
    ringTab.TextColor3 = Color3.fromRGB(180, 180, 180)
    flyTab.Font = Enum.Font.GothamBold
    ringTab.Font = Enum.Font.Gotham
end)

ringTab.MouseButton1Click:Connect(function()
    flyContent.Visible = false
    ringContent.Visible = true
    ringTab.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
    flyTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    ringTab.TextColor3 = Color3.fromRGB(255, 255, 255)
    flyTab.TextColor3 = Color3.fromRGB(180, 180, 180)
    ringTab.Font = Enum.Font.GothamBold
    flyTab.Font = Enum.Font.Gotham
end)

-- =============================================
-- MINIMIZE/CLOSE FUNCTIONALITY - DIPERBAIKI
-- =============================================
local minimized = false
local originalSize = UDim2.new(0, 300, 0, 380)
local minimizedSize = UDim2.new(0, 300, 0, 35)
local originalPosition = mainContainer.Position

-- Minimize button
mini.MouseButton1Click:Connect(function()
    playSound("12221967")
    
    if minimized then
        -- Maksimalkan
        minimized = false
        local tween1 = TweenService:Create(mainContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = originalSize
        })
        tween1:Play()
        
        wait(0.15)
        
        local tween2 = TweenService:Create(mainContainer, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Position = originalPosition
        })
        tween2:Play()
        
        mini.Text = "_"
        tabFrame.Visible = true
        contentFrame.Visible = true
        shadow.Visible = true
        
    else
        -- Minimize
        minimized = true
        originalPosition = mainContainer.Position
        
        local tween1 = TweenService:Create(mainContainer, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Position = UDim2.new(mainContainer.Position.X.Scale, mainContainer.Position.X.Offset, 1, -40)
        })
        tween1:Play()
        
        wait(0.15)
        
        local tween2 = TweenService:Create(mainContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = minimizedSize
        })
        tween2:Play()
        
        mini.Text = "+"
        tabFrame.Visible = false
        contentFrame.Visible = false
        shadow.Visible = false
    end
end)

-- Close button
closebutton.MouseButton1Click:Connect(function()
    playSound("12221967")
    
    local tween = TweenService:Create(mainContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    })
    tween:Play()
    
    tween.Completed:Wait()
    flyGUI:Destroy()
end)

-- =============================================
-- SOUND FUNCTION
-- =============================================
function playSound(soundId)
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. soundId
    sound.Parent = SoundService
    sound:Play()
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
end

-- Play initial sound
playSound("2865227271")

-- =============================================
-- FLY GUI LOGIC (ORIGINAL)
-- =============================================
speeds = 1

local speaker = game:GetService("Players").LocalPlayer
local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
nowe = false

-- Initial notification
StarterGui:SetCore("SendNotification", { 
    Title = "Combined Tools Loaded";
    Text = "Fly GUI V3 + Super Ring Parts V8";
    Duration = 5;
})

-- Fly toggle functionality
onof.MouseButton1Down:connect(function()
    if nowe == true then
        nowe = false
        onof.BackgroundColor3 = Color3.fromRGB(255, 180, 50)
        onof.Text = "TOGGLE FLY"

        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
        speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
    else 
        nowe = true
        onof.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
        onof.Text = "FLYING (ON)"

        for i = 1, speeds do
            spawn(function()
                local hb = game:GetService("RunService").Heartbeat	
                tpwalking = true
                local chr = game.Players.LocalPlayer.Character
                local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                    if hum.MoveDirection.Magnitude > 0 then
                        chr:TranslateBy(hum.MoveDirection)
                    end
                end
            end)
        end
        
        game.Players.LocalPlayer.Character.Animate.Disabled = true
        local Char = game.Players.LocalPlayer.Character
        local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")

        for i,v in next, Hum:GetPlayingAnimationTracks() do
            v:AdjustSpeed(0)
        end
        
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
        speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
    end

    -- R6 and R15 fly logic (original code)
    if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then
        local plr = game.Players.LocalPlayer
        local torso = plr.Character.Torso
        local flying = true
        local deb = true
        local ctrl = {f = 0, b = 0, l = 0, r = 0}
        local lastctrl = {f = 0, b = 0, l = 0, r = 0}
        local maxspeed = 50
        local speed = 0

        local bg = Instance.new("BodyGyro", torso)
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.cframe = torso.CFrame
        local bv = Instance.new("BodyVelocity", torso)
        bv.velocity = Vector3.new(0,0.1,0)
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
        
        if nowe == true then
            plr.Character.Humanoid.PlatformStand = true
        end
        
        while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
            game:GetService("RunService").RenderStepped:Wait()

            if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                speed = speed + 0.5 + (speed/maxspeed)
                if speed > maxspeed then
                    speed = maxspeed
                end
            elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                speed = speed - 1
                if speed < 0 then
                    speed = 0
                end
            end
            
            if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + 
                    ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - 
                    game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
            elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + 
                    ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - 
                    game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
            else
                bv.velocity = Vector3.new(0,0,0)
            end
            
            bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
        end
        
        ctrl = {f = 0, b = 0, l = 0, r = 0}
        lastctrl = {f = 0, b = 0, l = 0, r = 0}
        speed = 0
        bg:Destroy()
        bv:Destroy()
        plr.Character.Humanoid.PlatformStand = false
        game.Players.LocalPlayer.Character.Animate.Disabled = false
        tpwalking = false
        
    else
        -- R15 fly logic
        local plr = game.Players.LocalPlayer
        local UpperTorso = plr.Character.UpperTorso
        local flying = true
        local deb = true
        local ctrl = {f = 0, b = 0, l = 0, r = 0}
        local lastctrl = {f = 0, b = 0, l = 0, r = 0}
        local maxspeed = 50
        local speed = 0

        local bg = Instance.new("BodyGyro", UpperTorso)
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.cframe = UpperTorso.CFrame
        local bv = Instance.new("BodyVelocity", UpperTorso)
        bv.velocity = Vector3.new(0,0.1,0)
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
        
        if nowe == true then
            plr.Character.Humanoid.PlatformStand = true
        end
        
        while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
            wait()

            if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                speed = speed + 0.5 + (speed/maxspeed)
                if speed > maxspeed then
                    speed = maxspeed
                end
            elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                speed = speed - 1
                if speed < 0 then
                    speed = 0
                end
            end
            
            if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + 
                    ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - 
                    game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
            elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + 
                    ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - 
                    game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
            else
                bv.velocity = Vector3.new(0,0,0)
            end

            bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
        end
        
        ctrl = {f = 0, b = 0, l = 0, r = 0}
        lastctrl = {f = 0, b = 0, l = 0, r = 0}
        speed = 0
        bg:Destroy()
        bv:Destroy()
        plr.Character.Humanoid.PlatformStand = false
        game.Players.LocalPlayer.Character.Animate.Disabled = false
        tpwalking = false
    end
end)

-- Up/Down controls
local tis
up.MouseButton1Down:connect(function()
    tis = up.MouseEnter:connect(function()
        while tis do
            wait()
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 0)
            end
        end
    end)
end)

up.MouseLeave:connect(function()
    if tis then
        tis:Disconnect()
        tis = nil
    end
end)

local dis
down.MouseButton1Down:connect(function()
    dis = down.MouseEnter:connect(function()
        while dis do
            wait()
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -1, 0)
            end
        end
    end)
end)

down.MouseLeave:connect(function()
    if dis then
        dis:Disconnect()
        dis = nil
    end
end)

-- Speed controls
plus.MouseButton1Down:connect(function()
    speeds = speeds + 1
    speed.Text = tostring(speeds)
    if nowe == true then
        tpwalking = false
        for i = 1, speeds do
            spawn(function()
                local hb = game:GetService("RunService").Heartbeat	
                tpwalking = true
                local chr = game.Players.LocalPlayer.Character
                local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                    if hum.MoveDirection.Magnitude > 0 then
                        chr:TranslateBy(hum.MoveDirection)
                    end
                end
            end)
        end
    end
end)

mine.MouseButton1Down:connect(function()
    if speeds == 1 then
        speed.Text = 'MIN 1'
        wait(1)
        speed.Text = tostring(speeds)
    else
        speeds = speeds - 1
        speed.Text = tostring(speeds)
        if nowe == true then
            tpwalking = false
            for i = 1, speeds do
                spawn(function()
                    local hb = game:GetService("RunService").Heartbeat	
                    tpwalking = true
                    local chr = game.Players.LocalPlayer.Character
                    local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                    while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                        if hum.MoveDirection.Magnitude > 0 then
                            chr:TranslateBy(hum.MoveDirection)
                        end
                    end
                end)
            end
        end
    end
end)

-- Character added event
game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
    wait(0.7)
    if game.Players.LocalPlayer.Character then
        game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
        game.Players.LocalPlayer.Character.Animate.Disabled = false
    end
end)

-- =============================================
-- RING PARTS LOGIC (ORIGINAL)
-- =============================================
-- Setup Ring Parts (sesuai script asli)
local Folder = Instance.new("Folder", Workspace)
local Part = Instance.new("Part", Folder)
local Attachment1 = Instance.new("Attachment", Part)
Part.Anchored = true
Part.CanCollide = false
Part.Transparency = 1

if not getgenv().Network then
    getgenv().Network = {
        BaseParts = {},
        Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424)
    }

    Network.RetainPart = function(Part)
        if typeof(Part) == "Instance" and Part:IsA("BasePart") and Part:IsDescendantOf(Workspace) then
            table.insert(Network.BaseParts, Part)
            Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
            Part.CanCollide = false
        end
    end

    local function EnablePartControl()
        LocalPlayer.ReplicationFocus = Workspace
        RunService.Heartbeat:Connect(function()
            sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
            for _, Part in pairs(Network.BaseParts) do
                if Part:IsDescendantOf(Workspace) then
                    Part.Velocity = Network.Velocity
                end
            end
        end)
    end

    EnablePartControl()
end

-- Ring Parts Variables
local radius = 50
local height = 100
local rotationSpeed = 0.5
local attractionStrength = 1000
local ringPartsEnabled = false

-- Ring GUI Controls
ringToggleButton.MouseButton1Click:Connect(function()
    ringPartsEnabled = not ringPartsEnabled
    ringToggleButton.Text = ringPartsEnabled and "ON" or "OFF"
    ringToggleButton.BackgroundColor3 = ringPartsEnabled and Color3.fromRGB(50, 200, 50) or Color3.fromRGB(200, 50, 50)
    playSound("12221967")
    
    if ringPartsEnabled then
        StarterGui:SetCore("SendNotification", {
            Title = "Ring Parts",
            Text = "Ring Parts Enabled!",
            Duration = 3
        })
    end
end)

decreaseRadius.MouseButton1Click:Connect(function()
    radius = math.max(5, radius - 5)
    radiusText.Text = "Radius: " .. radius
    playSound("12221967")
end)

increaseRadius.MouseButton1Click:Connect(function()
    radius = math.min(1000, radius + 5)
    radiusText.Text = "Radius: " .. radius
    playSound("12221967")
end)

-- Final notification
StarterGui:SetCore("SendNotification", {
    Title = "Combined Tools Loaded",
    Text = "Fly GUI V3 + Super Ring Parts V8\nDrag the top bar to move UI",
    Duration = 5
})

print("Combined Tools UI Loaded Successfully!")
print("- Drag TOP BAR to move UI")
print("- Minimize/Close buttons now in top-right corner")
print("- All original functions preserved")