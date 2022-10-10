getgenv().Key = Enum.KeyCode.Q
getgenv().Prediction = 0.1307
    getgenv().AirshotFunccc = false
    getgenv().Tracer = true
    getgenv().Partz = "LowerTorso" -- LowerTorso, HumanoidRootPart,Head,UpperTorso

    
        local CC = game:GetService"Workspace".CurrentCamera
    local LocalMouse = game.Players.LocalPlayer:GetMouse()
        local Locking = false
        local cc = game:GetService("Workspace").CurrentCamera
        local gs = game:GetService("GuiService")
        local ggi = gs.GetGuiInset
        local lp = game:GetService("Players").LocalPlayer
        local mouse = lp:GetMouse()



local Tracer = Drawing.new("Image")


Tracer.Data = game:HttpGet("https://media.newyorker.com/photos/59095bb86552fa0be682d9d0/master/pass/Monkey-Selfie.jpg")
Tracer.ZIndex = 99999
Tracer.Size = Vector2.new(110,110)


    function x(tt,tx,cc)
    game.StarterGui:SetCore("SendNotification", {
        Title = tt;
        Text = tx;
        Duration = cc;
    })
end

x("RUIN.NIG", "Loaded", 3)


    if getgenv().flashyes == true then
                       x("RUIN.NIG", "Already Loaded", 5)
        return
    end
    getgenv().flashyes = true
    
        local UserInputService = game:GetService("UserInputService")

    UserInputService.InputBegan:Connect(function(keygo,ok)
           if (not ok) then
           if (keygo.KeyCode == getgenv().Key) then
               Locking = not Locking
               if Locking then
               Plr =  getClosestPlayerToCursor()
                x("RUIN.NIG", ""..Plr.Character.Humanoid.DisplayName, 3)
elseif not Locking then
    if Plr then Plr = nil
                       x("RUIN.NIG", "Unlocked", 3)
     
         
end
end
end
end
end)
    function getClosestPlayerToCursor()
        local closestPlayer
        local shortestDistance = 137

        for i, v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("LowerTorso") then
                local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
                local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(LocalMouse.X, LocalMouse.Y)).magnitude
                if magnitude < shortestDistance then
                    closestPlayer = v
                    shortestDistance = magnitude
                end
            end
        end
        return closestPlayer
    end



    
    

    local rawmetatable = getrawmetatable(game)
    local old = rawmetatable.__namecall
    setreadonly(rawmetatable, false)
    rawmetatable.__namecall = newcclosure(function(...)
        local args = {...}
        if Plr ~= nil  and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
            args[3] = Plr.Character[getgenv().Partz].Position+(Plr.Character[getgenv().Partz].Velocity*Prediction)
            return old(unpack(args))
        end
        return old(...)
    end)


game:GetService("RunService").RenderStepped:connect(function()    
if getgenv().AirshotFunccc == true then

            if Plr ~= nil and Plr.Character.Humanoid.Jump == true and Plr.Character.Humanoid.FloorMaterial == Enum.Material.Air then
                getgenv().Partz = "RightFoot"
            else
                Plr.Character:WaitForChild("Humanoid").StateChanged:Connect(function(old,new)
                    if new == Enum.HumanoidStateType.Freefall then
                    getgenv().Partz = "RightFoot"
                    else
                        getgenv().Partz = "LowerTorso"
                    end
                end)
            end
        end 


        if getgenv().Tracer == true and Locking then
            local Vector, OnScreen = cc:worldToViewportPoint(Plr.Character[getgenv().Partz].Position)
            Tracer.Visible = true
   Tracer.Position = Vector2.new(Vector.X, Vector.Y)
     else
            Tracer.Visible = false
        end
    

    end)