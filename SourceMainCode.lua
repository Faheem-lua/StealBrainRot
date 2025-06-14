local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local isRunning = false
local cancelFlag = false

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "Steal Brainrot | Arbix X Pro"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 160, 0, 120)
mainFrame.Position = UDim2.new(0, 50, 0, 50)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 8)

local stroke = Instance.new("UIStroke")
stroke.Thickness = 1
stroke.Color = Color3.fromRGB(255, 255, 255)
stroke.Transparency = 0.2
stroke.Parent = mainFrame

local padding = Instance.new("UIPadding")
padding.PaddingTop = UDim.new(0, 6)
padding.PaddingLeft = UDim.new(0, 6)
padding.PaddingRight = UDim.new(0, 6)
padding.Parent = mainFrame

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 5)
layout.FillDirection = Enum.FillDirection.Vertical
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.Parent = mainFrame

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, 0, 0, 18)
statusLabel.BackgroundTransparency = 1
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 12
statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
statusLabel.Text = "Status: Ready"
statusLabel.TextXAlignment = Enum.TextXAlignment.Center
statusLabel.Parent = mainFrame

local stealButton = Instance.new("TextButton")
stealButton.Size = UDim2.new(1, 0, 0, 26)
stealButton.BackgroundColor3 = Color3.fromRGB(17, 144, 210)
stealButton.Font = Enum.Font.GothamBold
stealButton.TextSize = 12
stealButton.TextColor3 = Color3.new(1, 1, 1)
stealButton.Text = "Click to Steal"
stealButton.Parent = mainFrame
Instance.new("UICorner", stealButton).CornerRadius = UDim.new(0, 6)

local resetButton = Instance.new("TextButton")
resetButton.Size = UDim2.new(1, 0, 0, 22)
resetButton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
resetButton.Font = Enum.Font.GothamBold
resetButton.TextSize = 12
resetButton.TextColor3 = Color3.new(1, 1, 1)
resetButton.Text = "Refresh"
resetButton.Parent = mainFrame
Instance.new("UICorner", resetButton).CornerRadius = UDim.new(0, 6)

local creditLabel = Instance.new("TextLabel")
creditLabel.Size = UDim2.new(1, 0, 0, 14)
creditLabel.BackgroundTransparency = 1
creditLabel.Font = Enum.Font.GothamSemibold
creditLabel.TextSize = 11
creditLabel.TextColor3 = Color3.fromHSV(0, 1, 1)
creditLabel.Text = "Made by Faheem"
creditLabel.TextXAlignment = Enum.TextXAlignment.Center
creditLabel.Parent = mainFrame

task.spawn(function()
	local hue = 0
	while true do
		hue = (hue + 1) % 360
		creditLabel.TextColor3 = Color3.fromHSV(hue / 360, 1, 1)
		task.wait(0.05)
	end
end)

local function notify(title, text, duration)
	pcall(function()
		game.StarterGui:SetCore("SendNotification", {
			Title = Processing...,
			Text = Script | still processing the game...,
			Duration = duration or 4
		})
	end)
end

local function executeSteal()
	if isRunning then return end
	isRunning = true
	cancelFlag = false

	notify("Made by Touka", "Credits to original scripter", 3)
	notify("Showcaser by Faheem", "Thanks for showing this script!", 3)
	notify("Script", "Validation Game...\nSuccessfully Done.", 4)

	stealButton.Text = "Processing..."
	stealButton.AutoButtonColor = false
	stealButton.BackgroundTransparency = 0.5
	stealButton.Active = false
	resetButton.Active = true

	local char = player.Character or player.CharacterAdded:Wait()
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if not hrp then
		statusLabel.Text = "Error: HRP not found"
		goto Reset
	end

	for i = 1, 20 do
		if cancelFlag then
			statusLabel.Text = "Cancelled"
			goto Reset
		end
		statusLabel.Text = "Waiting: " .. tostring(math.floor((2 - (i - 1) * 0.1) * 10) / 10) .. "s"
		task.wait(0.1)
	end

	for i = 1, 20 do
		if cancelFlag then
			statusLabel.Text = "Cancelled"
			goto Reset
		end
		for _, obj in ipairs(workspace:GetDescendants()) do
			if obj:IsA("BasePart") and obj.Name == "DeliveryHitbox" then
				pcall(function()
					firetouchinterest(hrp, obj, 0)
					task.wait(0.13)
					firetouchinterest(hrp, obj, 1)
				end)
			end
		end
	end

	statusLabel.Text = "Success: Done"

	::Reset::
	isRunning = false
	stealButton.Text = "Click to Steal"
	stealButton.BackgroundTransparency = 0
	stealButton.AutoButtonColor = true
	stealButton.Active = true
end

stealButton.MouseButton1Click:Connect(executeSteal)
resetButton.MouseButton1Click:Connect(function()
	if isRunning then
		cancelFlag = true
	else
		statusLabel.Text = "Nothing to cancel"
	end
end)
