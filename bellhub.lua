-- BellHub v3 by ChatGPT x sem

-- Auto Teleport Apex Hunt + Anti Admin + GUI Notif



local Players = game:GetService("Players")

local Workspace = game:GetService("Workspace")

local CoreGui = game:GetService("CoreGui")

local lp = Players.LocalPlayer

local hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") or lp.CharacterAdded:Wait():WaitForChild("HumanoidRootPart")



-- GUI BellHub

local gui = Instance.new("ScreenGui", CoreGui)

gui.Name = "BellHub_GUI"

local frame = Instance.new("Frame", gui)

frame.Size = UDim2.new(0, 250, 0, 60)

frame.Position = UDim2.new(0.5, -125, 0, 30)

frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)

frame.BackgroundTransparency = 0.2

frame.BorderSizePixel = 0

frame.AnchorPoint = Vector2.new(0.5, 0)

local title = Instance.new("TextLabel", frame)

title.Size = UDim2.new(1, 0, 0.5, 0)

title.Text = "🔔 BellHub - Apex Auto TP"

title.Font = Enum.Font.GothamBold

title.TextSize = 14

title.TextColor3 = Color3.fromRGB(255, 255, 0)

title.BackgroundTransparency = 1

local status = Instance.new("TextLabel", frame)

status.Size = UDim2.new(1, 0, 0.5, 0)

status.Position = UDim2.new(0, 0, 0.5, 0)

status.Text = "⏳ Menunggu Apex..."

status.Font = Enum.Font.Gotham

status.TextSize = 13

status.TextColor3 = Color3.fromRGB(200, 255, 200)

status.BackgroundTransparency = 1



-- Proteksi

local blacklist = {"mod", "admin", "staff", "dev"}

Players.PlayerAdded:Connect(function(plr)

    for _, v in pairs(blacklist) do

        local n = plr.Name:lower()

        local d = plr.DisplayName:lower()

        if n:find(v) or d:find(v) then

            status.Text = "❌ Admin terdeteksi!"

            wait(1)

            script:Destroy()

            lp:Kick("Admin terdeteksi. BellHub menutup.")

        end

    end

end)



-- Apex Detector

local bossList = {"Apex Leviathan", "Magician Narwhal"}

local guiPlayer = lp:WaitForChild("PlayerGui")



guiPlayer.ChildAdded:Connect(function(c)

    if c:IsA("ScreenGui") and c.Name:lower():find("apex") then

        status.Text = "🔥 Apex Terdeteksi!"

        for _, v in ipairs(Workspace:GetDescendants()) do

            if v:IsA("Model") and table.find(bossList, v.Name) and v:FindFirstChild("HumanoidRootPart") then

                hrp.CFrame = v.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)

                status.Text = "✅ Teleport ke: " .. v.Name

                return

            end

        end

        status.Text = "❌ Boss belum muncul"

    end

end)
