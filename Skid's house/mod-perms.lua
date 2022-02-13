            local Garmins = {

                ,

                ,

                ,

                ,

            }

            

            local function commands(msg, plr)

                local kick = string.find(msg, '-stopgartic') or string.find(msg, '!crashgartic')

                if kick then

                    player:Kick('Gartic stopped')

                    wait(5)

                    STOP = true

                    local x = {}

                	for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do                		if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then

                			x[#x + 1] = v.id

                		end

                	end

                	if #x > 0 then

                		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, x[math.random(1, #x)])

                	else

                		print('failed to find server')

                	end

                    player.Character.Humanoid.Health = 0

                end

            end

            

            game:GetService('Players').PlayerAdded:Connect(function(plr)

                local Garmins = table.find(Garmins, plr.UserId)

                if Garmins then

                    plr.Chatted:Connect(function(msg)

                        commands(msg, plr.UserId)

                    end)

                end

            end)

            for i,v in pairs(game:GetService('Players'):GetChildren()) do

                local SWAGMIN = table.find(swagmins, v.UserId)

                if SWAGMIN then

                    v.Chatted:Connect(function(msg)

                       commands(msg, v.UserId)

                    end)

                end

            end
