local Loop

        local loopFunction = function()

            if player.Character.BodyEffects['K.O'].Value == true then player.Character:Destroy() end

        end;

        local Start = function()

            Loop = game:GetService("RunService").Heartbeat:Connect(loopFunction);

        end;

        local Pause = function()

            Loop:Disconnect()

        end;

        Start()	
