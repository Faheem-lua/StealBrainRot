local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local loaderGui = Instance.new("ScreenGui")
loaderGui.Name = "LoaderGUI"
loaderGui.ResetOnSpawn = false
loaderGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
loaderGui.Parent = playerGui

local loaderFrame = Instance.new("Frame")
loaderFrame.Size = UDim2.new(1, 0, 1, 0)
loaderFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
loaderFrame.Parent = loaderGui

local loaderLabel = Instance.new("TextLabel")
loaderLabel.AnchorPoint = Vector2.new(0.5, 0.5)
loaderLabel.Position = UDim2.new(0.5, 0, 0.38, 0)
loaderLabel.Size = UDim2.new(0, 300, 0, 50)
loaderLabel.BackgroundTransparency = 1
loaderLabel.Font = Enum.Font.GothamBlack
loaderLabel.TextSize = 26
loaderLabel.Text = "MADE BY FAHEEM"
loaderLabel.TextColor3 = Color3.fromHSV(0, 1, 1)
loaderLabel.Parent = loaderFrame

local loadingText = Instance.new("TextLabel")
loadingText.AnchorPoint = Vector2.new(0.5, 0)
loadingText.Position = UDim2.new(0.5, 0, 0.48, 0)
loadingText.Size = UDim2.new(0, 300, 0, 30)
loadingText.BackgroundTransparency = 1
loadingText.Font = Enum.Font.Gotham
loadingText.TextSize = 14
loadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingText.Text = "Initializing..."
loadingText.Parent = loaderFrame

local progressBarBG = Instance.new("Frame")
progressBarBG.AnchorPoint = Vector2.new(0.5, 0)
progressBarBG.Position = UDim2.new(0.5, 0, 0.56, 0)
progressBarBG.Size = UDim2.new(0, 300, 0, 10)
progressBarBG.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
progressBarBG.BorderSizePixel = 0
progressBarBG.Parent = loaderFrame

local progressBar = Instance.new("Frame")
progressBar.Size = UDim2.new(0, 0, 1, 0)
progressBar.BackgroundColor3 = Color3.fromRGB(17, 144, 210)
progressBar.BorderSizePixel = 0
progressBar.Parent = progressBarBG

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://9122531370"
sound.Volume = 2
sound.PlayOnRemove = true
sound.Parent = loaderGui

local startButton = Instance.new("TextButton")
startButton.Size = UDim2.new(0, 160, 0, 30)
startButton.Position = UDim2.new(0.5, -80, 0.65, 0)
startButton.AnchorPoint = Vector2.new(0.5, 0)
startButton.Text = "Click to Begin"
startButton.Font = Enum.Font.GothamBold
startButton.TextSize = 14
startButton.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
startButton.TextColor3 = Color3.new(1, 1, 1)
startButton.Visible = false
Instance.new("UICorner", startButton).CornerRadius = UDim.new(0, 6)
startButton.Parent = loaderFrame

task.spawn(function()
	local hue = 0
	while loaderGui do
		hue = (hue + 1) % 360
		loaderLabel.TextColor3 = Color3.fromHSV(hue / 360, 1, 1)
		task.wait(0.05)
	end
end)

task.spawn(function()
	local stages = {
		"Loading UI...",
		"Checking environment...",
		"Injecting visuals...",
		"Validating script...",
		"Finishing touches..."
	}
	for i = 1, 100 do
		progressBar.Size = UDim2.new(i/100, 0, 1, 0)
		local stageIndex = math.floor(i / 20) + 1
		if stages[stageIndex] then
			loadingText.Text = stages[stageIndex]
		end
		task.wait(0.035)
	end
	loadingText.Text = "Completed."
	startButton.Visible = true
end)

local function fadeOut()
	for i = 1, 20 do
		loaderFrame.BackgroundTransparency = i * 0.05
		loaderLabel.TextTransparency = i * 0.05
		loadingText.TextTransparency = i * 0.05
		progressBar.BackgroundTransparency = i * 0.05
		progressBarBG.BackgroundTransparency = i * 0.05
		startButton.TextTransparency = i * 0.05
		startButton.BackgroundTransparency = i * 0.05
		task.wait(0.03)
	end
	sound:Destroy()
	loaderGui:Destroy()

loadstring([[
		local Notification = Instance.new("Hint", game.CoreGui or game.Workspace)
		Notification.Text = "Made by Touka"
		task.wait(2)
		Notification.Text = "Showcaser by Faheem"
		task.wait(2)
		Notification.Text = "Script | Validation Game...\nSuccessfully Done."
		task.wait(3)
		Notification:Destroy()

		 loadstring(game:HttpGet("https://raw.githubusercontent.com/Faheem-lua/StealBrainRot/refs/heads/main/SourceMainCode.lua"))()
		print("Main GUI loaded.")
	]])()
end

startButton.MouseButton1Click:Connect(fadeOut)
