-- made by Homolife discord.gg/encrypt
-- input the operator [roblox id] in side of the mods "local mods {}" put it inside, example:
-- local mods = {1341,13141,} like that ;)

loadstring(game:HttpGet("https://raw.githubusercontent.com/LPrandom/lua-projects/master/antiafk.lua"))()
local player = game.Players.LocalPlayer
local admsg = ".gg/encrypt"
local isamod = false
local prefix = "-"
local mods = {}

if table.find(mods,player.UserId) then
	isamod = true
	game.StarterGui:SetCore("SendNotification",{
		Title = "Operator";
		Text = "Operator commands granted.";
		Duration = 5;
	})
end

local cashaura = false
local cashauraplr = nil
local adtoggle = false
local droptoggle = false
local function cmds(msg,plr)
	if isamod == false or table.find(mods,plr) then
		Mod = game.Players:GetPlayerByUserId(plr)
		isamod = table.find(mods,player.UserId)
		if msg == ".bring" then
			if not isamod then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Mod.Character.HumanoidRootPart.CFrame
			end
		end
		if msg == ".drop" then
			if not isamod then
				droptoggle = true
				local Autoloop
				local autoloopfun = function()
					local amttodrp = 10000
					if player.DataFolder.Currency.Value > 10000 then
						amttodrp = 10000
					else
						amttodrp = player.DataFolder.Currency.Value
					end
					game.ReplicatedStorage.MainEvent:FireServer("DropMoney",amttodrp)
				end;
				local Begin = function()
					Autoloop = game:GetService("RunService").Heartbeat:Connect(autoloopfun);
				end;
				local Stop = function()
					Autoloop:Disconnect()
				end;
				Begin()	
				repeat wait() until droptoggle == false
				Stop()
			end
		end
		if msg == ".undrop" then
			if not isamod then
				droptoggle = false
			end
		end
		if msg == ".crash" then
			if not isamod then
				game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("alright, leave the game!", 'All')
				wait(5)
				loadstring(game:HttpGet("https://raw.githubusercontent.com/LPrandom/lua-projects/master/dahoodcrasher.lua"))()
			end
		end
		if msg == ".woof" then
			if not isamod then
				local oldplc = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
				wait()
				function god()
					attack = player.Character:FindFirstChild("BodyEffects").Attacking
					if attack then
						attack:Destroy()
					end
				end
				player.CharacterAdded:Connect(function()
					wait(1)
					god()
					wait()
					player.Character.HumanoidRootPart.CFrame = oldplc
				end)
				player.Character.Humanoid.Health = 0
			end
		end
		if msg == ".refresh" then
			if not isamod then
				game.Players.LocalPlayer.Character.Humanoid.Health = 0
			end
		end
		if msg == ".ad" then
			if not isamod then
				adtoggle = true
				repeat
					game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(admsg, 'All')
					wait(1)
				until adtoggle == false
			end
		end
		if msg == ".unad" then
			if not isamod then
				adtoggle = false
			end
		end
		if msg == ".freeze" then
			if not isamod then
				player.Character.HumanoidRootPart.Anchored = true
			end
		end
		if msg == ".unfreeze" then
			if not isamod then
				player.Character.HumanoidRootPart.Anchored = false
			end
		end
		if msg == ".wal" then
            if not isamod then
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Wallet") then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Wallet"))
                end
            end
        end
        if msg == ".dewal" then
            if not isamod then
                if game.Players.LocalPlayer.Character:FindFirstChild("Wallet") then
                    game.Players.LocalPlayer.Character.Humanoid:UnequipTools(game.Players.LocalPlayer.Character:FindFirstChild("Wallet"))
                end
            end
        end
		if string.find(string.split(msg)[1],'.setup') then
			if not isamod then
				local targetarea = Mod.Character.HumanoidRootPart.CFrame
				local pickone = {'1','2'}
				local splitted = string.split(msg,' ')
				if splitted[2] ~= nil then
					if splitted[2] == "normal" then
						if pickone[math.random(#pickone)] == "1" then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(math.random(targetarea.X,targetarea.X+10),targetarea.Y,math.random(targetarea.Z,targetarea.Z+10))
							wait(0.4)
							player.Character.HumanoidRootPart.Anchored = true
						end
						if pickone[math.random(#pickone)] == "2" then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(math.random(targetarea.X-10,targetarea.X),targetarea.Y,math.random(targetarea.Z-10,targetarea.Z))
							wait(0.4)
							player.Character.HumanoidRootPart.Anchored = true
						end
					end
					if splitted[2] == "high" then
						if pickone[math.random(#pickone)] == "1" then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(math.random(targetarea.X,targetarea.X+10),targetarea.Y+18,math.random(targetarea.Z,targetarea.Z+10))
							wait(0.4)
							player.Character.HumanoidRootPart.Anchored = true
						end
						if pickone[math.random(#pickone)] == "2" then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(math.random(targetarea.X-10,targetarea.X),targetarea.Y+18,math.random(targetarea.Z-10,targetarea.Z))
							wait(0.4)
							player.Character.HumanoidRootPart.Anchored = true
						end
					end
 				end
			end
		end
		if msg == ".unsetup" then
			if not isamond then
				player.Character.HumanoidRootPart.Anchored = false
				wait()
				player.Character.HumanoidRootPart.CFrame = Mod.Character.HumanoidRootPart.CFrame
			end
		end
		if msg == ".checkcash" then
			if not isamond then
				local amt = 0
				for i,v in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
					if v.Name == "MoneyDrop" then
						local cur = string.split(v.BillboardGui.TextLabel.Text,"$")[2]
						if string.match(cur,',') then
							amt = amt + cur:gsub("%,","")
						else
							amt = amt + cur
						end
						print(string.split(v.BillboardGui.TextLabel.Text,'$')[2])
					end
				end
				function fornum(amt)
					amt = tostring(amt)
					return amt:reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
				end
				game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("$"..fornum(amt), 'All')
			end
		end
		if msg == ".unpickup" then
            if not isamod then
                cashaura = false
            end
        end
        if string.find(string.split(msg)[1],prefix.."pickup") then
            if not isamod then
                local splittedlel = string.split(msg,' ')
                if splittedlel[2] ~= nil then
                    local txt = splittedlel[2]
                    print(txt)
                    for i,v in pairs(game.Players:GetChildren()) do
                        if (string.sub(string.lower(v.Name),1,string.len(txt))) == string.lower(txt) then
                            cashauraplr = v.Name
                            game.Players[cashauraplr].Character.HumanoidRootPart.CFrame = Mod.Character.HumanoidRootPart.CFrame
							if player.Name == cashauraplr then
								cashaura = true
								local Autoloop
								local autoloopfun = function()
									for i,v in pairs(game:GetService('Workspace')['Ignored']['Drop']:GetChildren()) do
										if v:IsA('Part') then
											if (v.Position - player.Character.HumanoidRootPart.Position).Magnitude <= 14 then
												fireclickdetector(v:FindFirstChild('ClickDetector'))
											end
										end
									end
								end;
								local Begin = function()
									Autoloop = game:GetService("RunService").Heartbeat:Connect(autoloopfun);
								end;
								local Stop = function()
									Autoloop:Disconnect()
								end;
								Begin()	
								repeat wait() until cashaura == false
								Stop()
							end
                            return
                        end  
                    end
                end
            end
        end
	end
end

for i,v in pairs(game:GetService('Players'):GetChildren()) do
	if table.find(mods,v.UserId) then
		v.Chatted:Connect(function(msg)
			cmds(msg,v.UserId)
		end)
	end
end

game.Players.PlayerAdded:Connect(function(plr)
	if table.find(mods,plr.UserId) then
		plr.Chatted:Connect(function(msg)
			cmds(msg,plr.UserId)
		end)
	end
end)

local function gfx_lowered()
    local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for i,v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") and decalsyeeted then 
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then 
            v.Lifetime = NumberRange.new(0)
        end
    end
end
--gfx_lowered()

game.StarterGui:SetCore("SendNotification",{
	Title = "Controll Script!";
	Text = "Excuted";
	Duration = 10;
})
