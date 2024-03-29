blip = nil

RegisterCommand("sperrzone", function(source,agrs)
    if DoesBlipExist(blip) then
        -- Blip Existiert Nachricht
    else 
        local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
        TriggerServerEvent(blips:takeBlip)
    end
end)

RegisterNetEvent("blips:setBlip", function(x,y,z)
    if x ~= nil then
        blip = AddBlipForCoords(blipCoords.x, blipCoords.y, blipCoords.z)
        SetBlipAsShortRange(blip, true)

        SetBlipScale(blip, 1.0)
        SetBlipSprite(blip, 161)
        SetBlipColour(blip, 21)
        SetBlipAlpha(blip, 255)
        AddTextEntry("SPERRZONE", blipName)
        EndTextCommandSetBlipName(blip)
        SetBlipCategory(blip, 2)
    else
       -- fehler 0x001, contact admin
    end
end)