RegisterServerEvent("blips:takeBlip", function(x, y, z)
    TriggerClientEvent("blips:setBlip", -1, x,y,z)
end)
