-- Fight Button Script

local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local Charge = 0
local MaxCharge = 100
local ChargeRate = 1
local IsCharging = false

-- Function to handle punching
local function Punch()
    -- Punch logic here
    print("Punch!")
end

-- Function to handle grabbing
local function Grab()
    -- Grab logic here
    print("Grab!")
end

-- Function to update charge
local function UpdateCharge()
    while IsCharging do
        Charge = math.min(Charge + ChargeRate, MaxCharge)
        wait(1)
    end
end

-- Function to handle button press
local function OnButtonPress()
    if Charge < MaxCharge then
        IsCharging = true
        UpdateCharge()
    else
        Grab()
    end
end

-- Function to handle button release
local function OnButtonRelease()
    if IsCharging then
        IsCharging = false
        if Charge < MaxCharge then
            Punch()
        end
        Charge = 0
    end
end

-- Connect button events
Player:GetMouse().Button1Down:Connect(OnButtonPress)
Player:GetMouse().Button1Up:Connect(OnButtonRelease)
