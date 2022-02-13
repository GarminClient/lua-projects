if not game.Players.LocalPlayer:IsInGroup(13578487) then

    coroutine.resume(coroutine.create(function()

       wait(10)

       game.StarterGui:SetCore("SendNotification", {

        Title = 'YOU are NOT in the group';

        Text = 'the script will still work but the group link has been copied to your clipboard';

        Duration = 10;

       })

       setclipboard('https://web.roblox.com/groups/13578487/CatWare#!/about')

    end))

  end

end)
