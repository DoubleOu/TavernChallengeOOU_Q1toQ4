function printSmallGuildNames(memberCount)
    -- In this problem, the first thing that I wanted to change was how the query was being used. First, I move the string formatting up to the query variable.
    local selectGuildQuery = string.format("SELECT name FROM guilds WHERE max_members < %d;", memberCount)
    -- Now that memberCount is taken into account within the query, resultId should work
    local resultId = db.storeQuery(selectGuildQuery)
    
    -- Next, the output.  Instead of doing a whole for loop, repeat would get us there in a readable way
    if resultId then
        repeat
        -- This will keep reassigning and printing guild names until...
            local GuildName = result:getString("name")
            print(guildName)
        -- There are no longer any guilds that match the criteria
        until not result:next(resultId)
        -- then leave room for something new.
        result:free(resultId)
    -- And extra error handling
    else
        print("No guilds found!")
    end
   end