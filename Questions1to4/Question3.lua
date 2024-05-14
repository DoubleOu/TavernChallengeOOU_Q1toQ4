--[[ Quick aside, I didn't know what "sth" meant in this context.  
    All I got here was "do something with Player Party"  
    If it means something else, my apologies
    For my own sake, I changed the function name to removeMember
]]--

function removeMember(playerId, membername)
-- To keep it consistent scope wise, I'll make player local
    local player = Player(playerId)
    local party = player:getParty()

-- Pairs. It's like pointers for me. Took me a bit to understand
    for k,v in pairs(party:getMembers()) do
        if v == Player(membername) then
            party:removeMember(Player(membername))
            --lets add some error handling with booleans
            return true
        end
    end

-- and a false return if the party member isn't found
   print("Member is not found or is already removed from the party")
   return false
end
    