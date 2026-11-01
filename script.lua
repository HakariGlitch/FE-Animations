--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

pcall(function()
	for _, v in pairs(PlayerGui:GetChildren()) do
		if v.Name == "LoadingScreen" or v.Name == "FEAnimations" or v.Name == "AntiKillsGUI" then
			v:Destroy()
		end
	end
end)

local loadingGui = Instance.new("ScreenGui", PlayerGui)
loadingGui.Name = "LoadingScreen"
loadingGui.ResetOnSpawn = false

local bg = Instance.new("Frame", loadingGui)
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bg.BorderSizePixel = 0

local title = Instance.new("TextLabel", bg)
title.Size = UDim2.new(1, 0, 0.1, 0)
title.Position = UDim2.new(0, 0, 0.05, 0)
title.BackgroundTransparency = 1
title.Text = "Created by Diecraft"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextScaled = true

local img = Instance.new("ImageLabel", bg)
img.Size = UDim2.new(0.35, 0, 0.6, 0)
img.Position = UDim2.new(0.325, 0, 0.2, 0)
img.BackgroundTransparency = 1

local percent = Instance.new("TextLabel", bg)
percent.Size = UDim2.new(0.3, 0, 0.05, 0)
percent.Position = UDim2.new(0.35, 0, 0.88, 0)
percent.BackgroundTransparency = 1
percent.TextColor3 = Color3.fromRGB(255, 255, 255)
percent.TextScaled = true
percent.Font = Enum.Font.GothamBold
percent.Text = "Loading... 0%"

local ok, userId = pcall(function()
	return Players:GetUserIdFromNameAsync("salmnusaod")
end)
if ok then
	local thumb, ready = Players:GetUserThumbnailAsync(userId, Enum.ThumbnailType.AvatarBust, Enum.ThumbnailSize.Size420x420)
	if ready then
		img.Image = thumb
	end
end

for i = 1, 100 do
	percent.Text = "Loading... " .. i .. "%"
	task.wait(0.02)
end
loadingGui:Destroy()

local gui = Instance.new("ScreenGui", PlayerGui)
gui.Name = "FEAnimations"
gui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 280, 0, 520)
mainFrame.Position = UDim2.new(0.35, 0, 0.2, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.BorderSizePixel = 0

local titleLabel = Instance.new("TextLabel", mainFrame)
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
titleLabel.Text = "FE Animations Panel"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextScaled = true

local function createButton(text, y)
	local btn = Instance.new("TextButton", mainFrame)
	btn.Size = UDim2.new(0.85, 0, 0, 40)
	btn.Position = UDim2.new(0.075, 0, y, 0)
	btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = Enum.Font.GothamBold
	btn.TextScaled = true
	btn.Text = text
	btn.BorderSizePixel = 0
	btn.MouseEnter:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(90, 90, 90) end)
	btn.MouseLeave:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60) end)
	return btn
end

local seraphicBtn = createButton("FE Seraphics Anim", 0.13)
local fighterBtn = createButton("FE Fighter R6", 0.26)
local mjBtn = createButton("Michael Anim", 0.39)
local audioBtn = createButton("FE Audio", 0.52)
local flyBtn = createButton("Invincible Fly", 0.65)
local antiBtn = createButton("Anti Kills Final", 0.78)
local ghostBtn = createButton("ghosthub no key", 0.845) -- changed label as requested
local closeBtn = createButton("Close Panel", 0.91)

seraphicBtn.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://pastefy.app/59mJGQGe/raw"))()
end)

fighterBtn.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Fe-ProjectR/FE-Files/refs/heads/main/Fe%20gale.lua"))("cool")
end)

mjBtn.MouseButton1Click:Connect(function()
	local tool = Instance.new("Tool")
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Name = "MichaelAnim"
	tool.Parent = LocalPlayer.Backpack

	local animTrack
	local gyro
	local pos

	tool.Equipped:Connect(function()
		local char = LocalPlayer.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		local hum = char and char:FindFirstChildOfClass("Humanoid")
		if hrp and hum then
			hum.WalkSpeed = 2
			hum.AutoRotate = false

			gyro = Instance.new("BodyGyro")
			gyro.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
			gyro.P = 1e5
			gyro.CFrame = hrp.CFrame * CFrame.Angles(math.rad(-35), 0, 0)
			gyro.Name = "MJ_Lean"
			gyro.Parent = hrp

			pos = Instance.new("BodyPosition")
			pos.MaxForce = Vector3.new(1e5, 1e5, 1e5)
			pos.P = 5e4
			pos.Position = hrp.Position
			pos.Name = "MJ_Fix"
			pos.Parent = hrp

			local anim = Instance.new("Animation")
			anim.AnimationId = "rbxassetid://242307417"
			animTrack = hum:LoadAnimation(anim)
			animTrack:Play()
		end
	end)

	tool.Unequipped:Connect(function()
		local char = LocalPlayer.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		local hum = char and char:FindFirstChildOfClass("Humanoid")
		if hum then
			hum.WalkSpeed = 16
			hum.AutoRotate = true
		end
		if animTrack then animTrack:Stop() animTrack = nil end
		if gyro then gyro:Destroy() gyro = nil end
		if pos then pos:Destroy() pos = nil end
	end)
end)

audioBtn.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/nmalka01/nmalka01/refs/heads/main/Brookhaven_audio"))()
end)

flyBtn.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://gist.githubusercontent.com/JungleScripts/775c6366d91d39fe2633c5805a1d0c23/raw/c8de949402393510a27bcf4482c957b6c3bed2c2/gistfile1.txt"))()
end)

antiBtn.MouseButton1Click:Connect(function()
	local gui2 = Instance.new("ScreenGui", PlayerGui)
	gui2.Name = "AntiKillsGUI"
	local frame = Instance.new("Frame", gui2)
	frame.Size = UDim2.new(0, 300, 0, 200)
	frame.Position = UDim2.new(0.35, 0, 0.35, 0)
	frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	frame.BorderSizePixel = 0

	local label = Instance.new("TextLabel", frame)
	label.Size = UDim2.new(1, 0, 0.2, 0)
	label.BackgroundTransparency = 1
	label.Text = "Anti Kills Control"
	label.Font = Enum.Font.GothamBold
	label.TextScaled = true
	label.TextColor3 = Color3.new(1, 1, 1)

	local on = Instance.new("TextButton", frame)
	on.Size = UDim2.new(0.8, 0, 0.3, 0)
	on.Position = UDim2.new(0.1, 0, 0.35, 0)
	on.Text = "Anti Kills ON"
	on.Font = Enum.Font.GothamBold
	on.TextScaled = true
	on.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
	on.TextColor3 = Color3.fromRGB(255, 255, 255)
	on.BorderSizePixel = 0

	local off = Instance.new("TextButton", frame)
	off.Size = UDim2.new(0.8, 0, 0.3, 0)
	off.Position = UDim2.new(0.1, 0, 0.7, 0)
	off.Text = "Anti Kills OFF"
	off.Font = Enum.Font.GothamBold
	off.TextScaled = true
	off.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
	off.TextColor3 = Color3.fromRGB(255, 255, 255)
	off.BorderSizePixel = 0

	local enabled = false
	on.MouseButton1Click:Connect(function()
		enabled = true
		while enabled do
			local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			if hum and hum.Health < hum.MaxHealth then
				hum.Health = hum.MaxHealth
			end
			task.wait(0.1)
		end
	end)
	off.MouseButton1Click:Connect(function()
		enabled = false
	end)
end)

ghostBtn.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Ghost-Hub-27383"))()
end)

closeBtn.MouseButton1Click:Connect(function()
	gui:Destroy()
end)
