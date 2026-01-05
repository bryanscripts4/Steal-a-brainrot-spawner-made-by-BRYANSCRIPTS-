-- [[ MADE BY BRYAN SCRIPTS ]] --
-- [[ YT: https://youtube.com/@bryanscripts ]] --
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local LoadingBarBG = Instance.new("Frame")
local LoadingBarFill = Instance.new("Frame")

ScreenGui.Parent = game:GetService("CoreGui")

MainFrame.Name = "BryanScriptsLoader"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.Position = UDim2.new(0.5, -125, 0.5, -50)
MainFrame.Size = UDim2.new(0, 250, 0, 100)
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)

TitleLabel.Parent = MainFrame
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 0, 0.2, 0)
TitleLabel.Size = UDim2.new(1, 0, 0, 30)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "YT: BRYAN SCRIPTS"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 18

LoadingBarBG.Parent = MainFrame
LoadingBarBG.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
LoadingBarBG.Position = UDim2.new(0.1, 0, 0.65, 0)
LoadingBarBG.Size = UDim2.new(0.8, 0, 0, 6)
Instance.new("UICorner", LoadingBarBG)

LoadingBarFill.Parent = LoadingBarBG
LoadingBarFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoadingBarFill.Size = UDim2.new(0, 0, 1, 0)
Instance.new("UICorner", LoadingBarFill)

LoadingBarFill:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Linear", 10)
task.wait(10)
ScreenGui:Destroy()
local MyYT = "https://youtube.com/@bryanscripts?si=ODUnb4zYzbx77IPY"
setclipboard(MyYT)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "made by bryan scripts",
    LoadingTitle = "Bryan Scripts | Loaded",
    LoadingSubtitle = "YouTube: @bryanscripts",
    ConfigurationSaving = { Enabled = false },
    KeySystem = false
})

-- // SERVICES //
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local netFolder = ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Net")
local rfBrainrot = netFolder:WaitForChild("RF/AdminService/SpawnBrainrot")
local rfBrainrotInBase = netFolder:FindFirstChild("RF/AdminService/SpawnBrainrotInBase")

-- // DATA //
local AllBrainrots = {"Reinito Sleighito", "La Ginger Sekolah", "La Secret Combinasion", "Spaghetti Tualetti", "La Casa Boo", "Los Spooky Combinasionas", "Meowl", "Strawberry Elephant", "La Vacca Saturno Saturnita", "Chimpanzini Spiderini", "Los Tralaleritos", "Las Tralaleritas", "Graipuss Medussi", "La Grande Combinasion", "Nuclearo Dinossauro", "Tortuginni Dragonfruitini", "Pot Hotspot", "Las Vaquitas Saturnitas", "Chicleteira Bicicleteira", "Coco Elefanto", "Girafa Celestre", "Gattatino Nyanino", "Matteo", "Tralalero Tralala", "Espresso Signora", "Odin Din Din Dun", "Statutino Libertino", "Trenostruzzo Turbo 3000", "Ballerino Lololo", "Trigoligre Frutonni", "Orcalero Orcala", "Los Crocodillitos", "Frigo Camelo", "Orangutini Ananassini", "Rhino Toasterino", "Bombardiro Crocodilo", "Bombombini Gusini", "Cavallo Virtuoso", "Gorillo Watermelondrillo", "Spioniro Golubiro", "Zibra Zubra Zibralini", "Tigrilini Watermelini", "Sigma Boy", "Sigma Girl", "Pi Pi Watermelon", "Burbaloni Loliloli", "Chimpanzini Bananini", "Ballerina Cappuccina", "Chef Crabracadabra", "Noobini Pizzanini", "Lirilì Larilà", "Tim Cheese", "Fluriflura", "Talpa Di Fero", "Svinina Bombardino", "Pipi Kiwi", "Pipi Corni", "Raccooni Jandelini", "BloxInformer"}
local AllTraits = {"None", "Strawberry", "Meowl", "Skibidi", "Fireworks", "Nyan", "Paint", "Fire", "Reindeer", "Zombie", "Sombrero", "Indonesia Flag", "Claws (Crab)", "R.I.P.", "Tie", "Wizard Hat", "Extinct", "Spider", "Rain", "Snowy", "Cometstruck"}
local AllMutations = {"None", "Gold", "Diamond", "Rainbow", "Bloodrot", "Candy", "Lava", "Galaxy", "Yin Yang", "Radioactive"}

-- // SELECTIONS //
local SelectedUnit = AllBrainrots[1]
local SelectedTraits = {"None"}
local SelectedMutations = {"None"}
local FastSpam = false

-- // TABS //
local MainTab = Window:CreateTab("Admin Spawner", 4483362458)

MainTab:CreateDropdown({
    Name = "Select Brainrot",
    Options = AllBrainrots,
    CurrentOption = {AllBrainrots[1]},
    Callback = function(Option) SelectedUnit = Option[1] end,
})

MainTab:CreateDropdown({
    Name = "Select Multiple Traits",
    Options = AllTraits,
    MultipleOptions = true,
    Callback = function(Options) SelectedTraits = Options end,
})

MainTab:CreateDropdown({
    Name = "Select Multiple Mutations",
    Options = AllMutations,
    MultipleOptions = true,
    Callback = function(Options) SelectedMutations = Options end,
})

MainTab:CreateSection("Spawning Controls")

-- THE FIX: Loops through every selected trait and mutation and fires the remote for each
local function ExecuteSpawn(method)
    local targetRemote = (method == "Base") and rfBrainrotInBase or rfBrainrot
    if not targetRemote then return end

    task.spawn(function()
        for _, trait in ipairs(SelectedTraits) do
            for _, mutation in ipairs(SelectedMutations) do
                local t = (trait == "None") and "" or trait
                local m = (mutation == "None") and "" or mutation
                
                -- Fires the remote
                targetRemote:InvokeServer(SelectedUnit, m, t)
            end
        end
    end)
end

MainTab:CreateButton({
    Name = "Spawn (Normal)",
    Callback = function() 
        ExecuteSpawn("Normal")
        Rayfield:Notify({Title = "Spawn Sequence Started", Content = "Spawning combinations of: "..SelectedUnit, Duration = 2})
    end,
})

MainTab:CreateButton({
    Name = "Spawn in Player Base",
    Callback = function() 
        ExecuteSpawn("Base")
    end,
})

MainTab:CreateToggle({
    Name = "ULTRA FAST SPAM",
    CurrentValue = false,
    Callback = function(Value)
        FastSpam = Value
        if FastSpam then
            task.spawn(function()
                while FastSpam do
                    ExecuteSpawn("Normal")
                    task.wait(0.01) -- Insane speed
                end
            end)
        end
    end,
})

local SocialTab = Window:CreateTab("YouTube", 4483362458)
SocialTab:CreateButton({
    Name = "Copy YouTube Link",
    Callback = function() setclipboard(MyYT) end,
})
