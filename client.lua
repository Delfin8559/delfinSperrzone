local isNearCoords = false

Citizen.CreateThread(function()
    while true do

        playerPos = GetEntityCoords(PlayerPedID())

        isNearCoords = false
        for k, v in pairs(Config.Locations) do
            local distance = Vdist(playerPos, v[1], v[2], v[3])

            if distance <= 1.5 then
                isNearCoords = true
            end
        end

        Citizen.Wait(350)
    end
end)

Citizen.CreateThread(function()
    while true do

        if isNearCoords then
            showInfobar("Test!")
        end
        
        Citizen.Wait(1)
    end
end)


function showInfobar(msg)
    CurrentActionMsg  = msg
    SetTextComponentFormat('STRING')
    AddTextComponentString(CurrentActionMsg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end