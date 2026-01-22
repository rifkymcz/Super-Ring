-- Gabungan Script: Fly GUI V3 dan Super Ring Parts V8
-- Dipersembahkan oleh me_ozone, Quandale The Dinglish XII#3550, dan MczXcyber

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer

-- ==================== KONFIGURASI UTAMA UI ====================
local main = Instance.new("ScreenGui")
main.Name = "MegaToolsGUI"
main.Parent = LocalPlayer:WaitForChild("PlayerGui")
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false

-- Frame utama
local MainFrame = Instance.new("Frame")
MainFrame.Parent = main
MainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
MainFrame.BorderColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 2
MainFrame.Position = UDim2.new(0.1, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 350, 0, 400)
MainFrame.Active = true
MainFrame.Draggable = true

-- Membuat UI lebih menarik
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(60, 60, 60)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 40))
})
UIGradient.Rotation = 90
UIGradient.Parent = MainFrame

-- ==================== TAB SYSTEM ====================
local TabButtonsFrame = Instance.new("Frame")
TabButtonsFrame.Parent = MainFrame
TabButtonsFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TabButtonsFrame.BorderSizePixel = 0
TabButtonsFrame.Size = UDim2.new(1, 0, 0, 40)
TabButtonsFrame.Position = UDim2.new(0, 0, 0, 0)

local TabButtonsUICorner = Instance.new("UICorner")
TabButtonsUICorner.CornerRadius = UDim.new(0, 10)
TabButtonsUICorner.Parent = TabButtonsFrame

local FlyTabButton = Instance.new("TextButton")
FlyTabButton.Name = "FlyTab"
FlyTabButton.Parent = TabButtonsFrame
FlyTabButton.Size = UDim2.new(0.5, 0, 1, 0)
FlyTabButton.Position = UDim2.new(0, 0, 0, 0)
FlyTabButton.BackgroundColor3 = Color3.fromRGB(50, 120, 200)
FlyTabButton.Text = "FLY GUI"
FlyTabButton.TextColor3 = Color3.white
FlyTabButton.Font = Enum.Font.GothamBold
FlyTabButton.TextSize = 14

local RingTabButton = Instance.new("TextButton")
RingTabButton.Name = "RingTab"
RingTabButton.Parent = TabButtonsFrame
RingTabButton.Size = UDim2.new(0.5, 0, 1, 0)
RingTabButton.Position = UDim2.new(0.5, 0, 0, 0)
RingTabButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
RingTabButton.Text = "RING PARTS"
RingTabButton.TextColor3 = Color3.white
FlyTabButton.Font = Enum.Font.GothamBold
RingTabButton.TextSize = 14

-- ==================== FRAME UNTUK FLY GUI ====================
local FlyFrame = Instance.new("Frame")
FlyFrame.Parent = MainFrame
FlyFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
FlyFrame.BorderSizePixel = 0
FlyFrame.Size = UDim2.new(1, -20, 0, 340)
FlyFrame.Position = UDim2.new(0, 10, 0, 50)
FlyFrame.Visible = true

local RingFrame = Instance.new("Frame")
RingFrame.Parent = MainFrame
RingFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
RingFrame.BorderSizePixel = 0
RingFrame.Size = UDim2.new(1, -20, 0, 340)
RingFrame.Position = UDim2.new(0, 10, 0, 50)
RingFrame.Visible = false

-- ==================== KOMPONEN FLY GUI ====================
-- Title
local FlyTitle = Instance.new("TextLabel")
FlyTitle.Parent = FlyFrame
FlyTitle.Size = UDim2.new(1, 0, 0, 40)
FlyTitle.Position = UDim2.new(0, 0, 0, 10)
FlyTitle.Text = "FLY GUI V3"
FlyTitle.TextColor3 = Color3.fromRGB(163, 255, 137)
FlyTitle.BackgroundTransparency = 1
FlyTitle.Font = Enum.Font.GothamBold
FlyTitle.TextSize = 20

-- Kontrol atas/bawah
local UpButton = Instance.new("TextButton")
UpButton.Name = "up"
UpButton.Parent = FlyFrame
UpButton.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
UpButton.Size = UDim2.new(0.45, 0, 0, 40)
UpButton.Position = UDim2.new(0.025, 0, 0.2, 0)
UpButton.Font = Enum.Font.Gotham
UpButton.Text = "UP"
UpButton.TextColor3 = Color3.black
UpButton.TextSize = 16

local DownButton = Instance.new("TextButton")
DownButton.Name = "down"
DownButton.Parent = FlyFrame
DownButton.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
DownButton.Size = UDim2.new(0.45, 0, 0, 40)
DownButton.Position = UDim2.new(0.525, 0, 0.2, 0)
DownButton.Font = Enum.Font.Gotham
DownButton.Text = "DOWN"
DownButton.TextColor3 = Color3.black
DownButton.TextSize = 16

-- Kontrol kecepatan
local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Parent = FlyFrame
SpeedLabel.Size = UDim2.new(0.6, 0, 0, 40)
SpeedLabel.Position = UDim2.new(0.2, 0, 0.35, 0)
SpeedLabel.Text = "SPEED: 1"
SpeedLabel.Name = "speed"
SpeedLabel.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
SpeedLabel.TextColor3 = Color3.black
SpeedLabel.Font = Enum.Font.Gotham
SpeedLabel.TextSize = 16

local PlusButton = Instance.new("TextButton")
PlusButton.Name = "plus"
PlusButton.Parent = FlyFrame
PlusButton.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
PlusButton.Size = UDim2.new(0.15, 0, 0, 40)
PlusButton.Position = UDim2.new(0.025, 0, 0.35, 0)
PlusButton.Font = Enum.Font.GothamBold
PlusButton.Text = "+"
PlusButton.TextColor3 = Color3.black
PlusButton.TextSize = 20

local MinusButton = Instance.new("TextButton")
MinusButton.Name = "mine"
MinusButton.Parent = FlyFrame
MinusButton.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
MinusButton.Size = UDim2.new(0.15, 0, 0, 40)
MinusButton.Position = UDim2.new(0.825, 0, 0.35, 0)
MinusButton.Font = Enum.Font.GothamBold
MinusButton.Text = "-"
MinusButton.TextColor3 = Color3.black
MinusButton.TextSize = 20

-- Tombol Fly On/Off
local FlyToggleButton = Instance.new("TextButton")
FlyToggleButton.Name = "onof"
FlyToggleButton.Parent = FlyFrame
FlyToggleButton.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
FlyToggleButton.Size = UDim2.new(0.6, 0, 0, 50)
FlyToggleButton.Position = UDim2.new(0.2, 0, 0.55, 0)
FlyToggleButton.Font = Enum.Font.GothamBold
FlyToggleButton.Text = "FLY (OFF)"
FlyToggleButton.TextColor3 = Color3.black
FlyToggleButton.TextSize = 18

-- Kredit
local FlyCredits = Instance.new("TextLabel")
FlyCredits.Parent = FlyFrame
FlyCredits.Size = UDim2.new(1, 0, 0, 30)
FlyCredits.Position = UDim2.new(0, 0, 0.85, 0)
FlyCredits.Text = "By me_ozone & Quandale The Dinglish XII"
FlyCredits.TextColor3 = Color3.fromRGB(200, 200, 200)
FlyCredits.BackgroundTransparency = 1
FlyCredits.Font = Enum.Font.Gotham
FlyCredits.TextSize = 12

-- ==================== KOMPONEN RING PARTS ====================
-- Title
local RingTitle = Instance.new("TextLabel")
RingTitle.Parent = RingFrame
RingTitle.Size = UDim2.new(1, 0, 0, 40)
RingTitle.Position = UDim2.new(0, 0, 0, 10)
RingTitle.Text = "SUPER RING PARTS V8"
RingTitle.TextColor3 = Color3.fromRGB(0, 255, 150)
RingTitle.BackgroundTransparency = 1
RingTitle.Font = Enum.Font.GothamBold
RingTitle.TextSize = 18

-- Toggle Button
local RingToggleButton = Instance.new("TextButton")
RingToggleButton.Parent = RingFrame
RingToggleButton.Size = UDim2.new(0.8, 0, 0, 50)
RingToggleButton.Position = UDim2.new(0.1, 0, 0.2, 0)
RingToggleButton.Text = "RING PARTS (OFF)"
RingToggleButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
RingToggleButton.TextColor3 = Color3.white
RingToggleButton.Font = Enum.Font.GothamBold
RingToggleButton.TextSize = 16

-- Kontrol Radius
local RadiusLabel = Instance.new("TextLabel")
RadiusLabel.Parent = RingFrame
RadiusLabel.Size = UDim2.new(0.5, 0, 0, 40)
RadiusLabel.Position = UDim2.new(0.25, 0, 0.45, 0)
RadiusLabel.Text = "RADIUS: 50"
RadiusLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
RadiusLabel.TextColor3 = Color3.black
RadiusLabel.Font = Enum.Font.Gotham
RadiusLabel.TextSize = 16

local DecreaseRadiusButton = Instance.new("TextButton")
DecreaseRadiusButton.Parent = RingFrame
DecreaseRadiusButton.Size = UDim2.new(0.2, 0, 0, 40)
DecreaseRadiusButton.Position = UDim2.new(0.05, 0, 0.45, 0)
DecreaseRadiusButton.Text = "<"
DecreaseRadiusButton.BackgroundColor3 = Color3.fromRGB(255, 150, 50)
DecreaseRadiusButton.TextColor3 = Color3.black
DecreaseRadiusButton.Font = Enum.Font.GothamBold
DecreaseRadiusButton.TextSize = 20

local IncreaseRadiusButton = Instance.new("TextButton")
IncreaseRadiusButton.Parent = RingFrame
IncreaseRadiusButton.Size = UDim2.new(0.2, 0, 0, 40)
IncreaseRadiusButton.Position = UDim2.new(0.75, 0, 0.45, 0)
IncreaseRadiusButton.Text = ">"
IncreaseRadiusButton.BackgroundColor3 = Color3.fromRGB(255, 150, 50)
IncreaseRadiusButton.TextColor3 = Color3.black
IncreaseRadiusButton.Font = Enum.Font.GothamBold
IncreaseRadiusButton.TextSize = 20

-- Kredit
local RingCredits = Instance.new("TextLabel")
RingCredits.Parent = RingFrame
RingCredits.Size = UDim2.new(1, 0, 0, 30)
RingCredits.Position = UDim2.new(0, 0, 0.85, 0)
RingCredits.Text = "By MczXcyber | Modified"
RingCredits.TextColor3 = Color3.fromRGB(200, 200, 200)
RingCredits.BackgroundTransparency = 1
RingCredits.Font = Enum.Font.Gotham
RingCredits.TextSize = 12

-- ==================== TOMBOL MINIMIZE DAN CLOSE ====================
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "Close"
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(225, 50, 50)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.white
CloseButton.TextSize = 18
CloseButton.Position = UDim2.new(1, -35, 0, 5)

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "Minimize"
MinimizeButton.Parent = MainFrame
MinimizeButton.BackgroundColor3 = Color3.fromRGB(80, 180, 80)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Text = "_"
MinimizeButton.TextColor3 = Color3.white
MinimizeButton.TextSize = 18
MinimizeButton.Position = UDim2.new(1, -70, 0, 5)

-- ==================== LOGIKA TAB SYSTEM ====================
FlyTabButton.MouseButton1Click:Connect(function()
    FlyFrame.Visible = true
    RingFrame.Visible = false
    FlyTabButton.BackgroundColor3 = Color3.fromRGB(50, 120, 200)
    RingTabButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
end)

RingTabButton.MouseButton1Click:Connect(function()
    FlyFrame.Visible = false
    RingFrame.Visible = true
    FlyTabButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    RingTabButton.BackgroundColor3 = Color3.fromRGB(50, 120, 200)
end)

-- ==================== FUNGSI MINIMIZE/CLOSE ====================
local minimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        MainFrame:TweenSize(UDim2.new(0, 350, 0, 40), "Out", "Quad", 0.3, true)
        MinimizeButton.Text = "+"
        FlyFrame.Visible = false
        RingFrame.Visible = false
    else
        MainFrame:TweenSize(UDim2.new(0, 350, 0, 400), "Out", "Quad", 0.3, true)
        MinimizeButton.Text = "_"
        FlyFrame.Visible = true
        RingFrame.Visible = false
    end
end)

CloseButton.MouseButton1Click:Connect(function()
    main:Destroy()
end)

-- ==================== NOTIFIKASI AWAL ====================
wait(1)
StarterGui:SetCore("SendNotification", { 
    Title = "MEGA TOOLS LOADED",
    Text = "Fly GUI V3 + Super Ring Parts V8",
    Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150",
    Duration = 5
})

-- ==================== VARIABEL GLOBAL ====================
local speeds = 1
local nowe = false
local ringPartsEnabled = false
local radius = 50
local height = 100
local rotationSpeed = 0.5
local attractionStrength = 1000

-- ==================== FUNGSIONALITAS FLY GUI ====================
local speaker = game:GetService("Players").LocalPlayer
local tpwalking = false

FlyToggleButton.MouseButton1Down:connect(function()
    if nowe == true then
        nowe = false
        FlyToggleButton.Text = "FLY (OFF)"
        FlyToggleButton.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
        
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
        FlyToggleButton.Text = "FLY (ON)"
        FlyToggleButton.BackgroundColor3 = Color3.fromRGB(50, 255, 50)

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
                speed = speed+.5+(speed/maxspeed)
                if speed > maxspeed then
                    speed = maxspeed
                end
            elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                speed = speed-1
                if speed < 0 then
                    speed = 0
                end
            end
            
            if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
            elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
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
                speed = speed+.5+(speed/maxspeed)
                if speed > maxspeed then
                    speed = maxspeed
                end
            elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                speed = speed-1
                if speed < 0 then
                    speed = 0
                end
            end
            
            if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
            elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
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

-- Kontrol atas/bawah
local tis
UpButton.MouseButton1Down:connect(function()
    tis = UpButton.MouseEnter:connect(function()
        while tis do
            wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
        end
    end)
end)

UpButton.MouseLeave:connect(function()
    if tis then
        tis:Disconnect()
        tis = nil
    end
end)

local dis
DownButton.MouseButton1Down:connect(function()
    dis = DownButton.MouseEnter:connect(function()
        while dis do
            wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)
        end
    end)
end)

DownButton.MouseLeave:connect(function()
    if dis then
        dis:Disconnect()
        dis = nil
    end
end)

-- Kontrol kecepatan
PlusButton.MouseButton1Down:connect(function()
    speeds = speeds + 1
    SpeedLabel.Text = "SPEED: " .. speeds
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

MinusButton.MouseButton1Down:connect(function()
    if speeds == 1 then
        SpeedLabel.Text = "MIN SPEED: 1"
        wait(1)
        SpeedLabel.Text = "SPEED: " .. speeds
    else
        speeds = speeds - 1
        SpeedLabel.Text = "SPEED: " .. speeds
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

-- ==================== FUNGSIONALITAS RING PARTS ====================
-- Setup untuk Ring Parts
local Workspace = game:GetService("Workspace")
local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

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

local function ForcePart(v)
    if v:IsA("Part") and not v.Anchored and not v.Parent:FindFirstChild("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then
        for _, x in next, v:GetChildren() do
            if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
                x:Destroy()
            end
        end
        if v:FindFirstChild("Attachment") then
            v:FindFirstChild("Attachment"):Destroy()
        end
        if v:FindFirstChild("AlignPosition") then
            v:FindFirstChild("AlignPosition"):Destroy()
        end
        if v:FindFirstChild("Torque") then
            v:FindFirstChild("Torque"):Destroy()
        end
        v.CanCollide = false
        local Torque = Instance.new("Torque", v)
        Torque.Torque = Vector3.new(100000, 100000, 100000)
        local AlignPosition = Instance.new("AlignPosition", v)
        local Attachment2 = Instance.new("Attachment", v)
        Torque.Attachment0 = Attachment2
        AlignPosition.MaxForce = 99999999999999999
        AlignPosition.MaxVelocity = math.huge
        AlignPosition.Responsiveness = 200
        AlignPosition.Attachment0 = Attachment2
        AlignPosition.Attachment1 = Attachment1
    end
end

local parts = {}
local function addPart(part)
    if part:IsA("BasePart") and not part.Anchored and part:IsDescendantOf(Workspace) then
        if part.Parent == LocalPlayer.Character or part:IsDescendantOf(LocalPlayer.Character) then
            return false
        end

        part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
        part.CanCollide = false
        if not table.find(parts, part) then
            table.insert(parts, part)
        end
        return true
    end
    return false
end

local function removePart(part)
    local index = table.find(parts, part)
    if index then
        table.remove(parts, index)
    end
end

for _, part in pairs(Workspace:GetDescendants()) do
    addPart(part)
end

Workspace.DescendantAdded:Connect(addPart)
Workspace.DescendantRemoving:Connect(removePart)

-- Loop utama Ring Parts
RunService.Heartbeat:Connect(function()
    if not ringPartsEnabled then return end
    
    local humanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart then
        local tornadoCenter = humanoidRootPart.Position
        for _, part in pairs(parts) do
            if part.Parent and not part.Anchored then
                local pos = part.Position
                local distance = (Vector3.new(pos.X, tornadoCenter.Y, pos.Z) - tornadoCenter).Magnitude
                local angle = math.atan2(pos.Z - tornadoCenter.Z, pos.X - tornadoCenter.X)
                local newAngle = angle + math.rad(rotationSpeed)
                local targetPos = Vector3.new(
                    tornadoCenter.X + math.cos(newAngle) * math.min(radius, distance),
                    tornadoCenter.Y + (height * (math.abs(math.sin((pos.Y - tornadoCenter.Y) / height)))),
                    tornadoCenter.Z + math.sin(newAngle) * math.min(radius, distance)
                )
                local directionToTarget = (targetPos - part.Position).unit
                part.Velocity = directionToTarget * attractionStrength
            end
        end
    end
end)

-- Kontrol Ring Parts
RingToggleButton.MouseButton1Click:Connect(function()
    ringPartsEnabled = not ringPartsEnabled
    if ringPartsEnabled then
        RingToggleButton.Text = "RING PARTS (ON)"
        RingToggleButton.BackgroundColor3 = Color3.fromRGB(50, 255, 50)
    else
        RingToggleButton.Text = "RING PARTS (OFF)"
        RingToggleButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
    end
end)

DecreaseRadiusButton.MouseButton1Click:Connect(function()
    radius = math.max(0, radius - 5)
    RadiusLabel.Text = "RADIUS: " .. radius
end)

IncreaseRadiusButton.MouseButton1Click:Connect(function()
    radius = math.min(10000, radius + 5)
    RadiusLabel.Text = "RADIUS: " .. radius
end)

-- ==================== FUNGSI TAMBAHAN ====================
-- Reset saat karakter respawn
game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
    wait(0.7)
    game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
    game.Players.LocalPlayer.Character.Animate.Disabled = false
end)

print("Mega Tools GUI Loaded Successfully!")
print("Fly GUI V3 + Super Ring Parts V8")
print("Credits: me_ozone, Quandale The Dinglish XII, MczXcyber")