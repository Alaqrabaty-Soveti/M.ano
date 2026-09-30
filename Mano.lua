local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "7arbiAndAntiKickGui"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local function createLabel(text)
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(0, 300, 0, 50)
	label.Position = UDim2.new(0.5, -150, 0.5, -25)
	label.BackgroundTransparency = 1
	label.Text = text
	label.TextColor3 = Color3.new(1, 1, 1)
	label.TextScaled = true
	label.Font = Enum.Font.SourceSansBold
	label.TextTransparency = 1
	label.Parent = gui
	return label
end

local function showLabel(label)
	TweenService:Create(label, TweenInfo.new(1), {TextTransparency = 0}):Play()
end

local function hideLabel(label)
	TweenService:Create(label, TweenInfo.new(1), {TextTransparency = 1}):Play()
	task.wait(1)
	label:Destroy()
end

-- Sequence
task.wait(3)

local label1 = createLabel("7arbi")
showLabel(label1)
