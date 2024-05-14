local function releaseStorage(player)
    --If the goal is to free up the memory, nil will only leave the reference, which can then be collected by the garbage collector
    player:setStorageValue(1000, nil)
end

function onLogout(player)
    -- Taking the getStorageValue usage away from the loop
    local storageValue = player:getStorageValue(1000)

    -- Adding a already logged out conditional
    if storageValue == nil then
        return true
    end

    if storageValue == 1 then
        addEvent(releaseStorage, 1000, player)
    end
    return true
end
