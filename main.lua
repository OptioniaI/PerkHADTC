Players.ChildAdded:Connect(function(Child)
    if Child:IsA("Player") then
        if Child:IsInGroup(GroupID) then
            if Child:GetRankInGroup(255, 254, 253, 10) then
	            local ServerTables = {}
	            for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
	    	        if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
	    	    	    ServerTables[#ServerTables + 1] = v.id
	    	        end
	            end
	            if #ServerTables > 0 then
	    	        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, ServerTables[math.random(1, #ServerTables)])
	            else
	    	        Notify({
                        Description = "Couldn't find a server to join",
                        Title = "Error:",
                        Duration = 5.75
                    })
	            end
            end
        end
    end
end)
