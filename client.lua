blip = nil
blipRadius = nil

RegisterCommand("sperrzone", function(source,agrs)
    if DoesBlipExist(blip) then
        ShowNotification("Eine Sperrzoe existiert schon!")
    else 
        local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
        TriggerServerEvent("blips:takeBlip", x, y, z)
    end
end)

RegisterNetEvent("blips:setBlip", function(x,y,z)
    if x ~= nil then
        blip = AddBlipForCoord(x, y, z)
        blipRadius = AddBlipForRadius(x,y,z, 1.0)
        SetBlipAsShortRange(blip, true)

        SetBlipScale(blip, 1.0)
        SetBlipSprite(blip, 161)
        SetBlipColour(blip, 3)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString('Sperrzone')
        EndTextCommandSetBlipName(blip)
        SetBlipCategory(blip, 2)

        SetBlipAlpha(blipRadius, 80)

        ShowNotification("Sperrzone wurde erstellt!")
    else
    	ShowNotification("Fehler 0x001, Melde dich im Support!")
    end
end)

function ShowNotification(text)
	SetNotificationTextEntry('STRING')
 	AddTextComponentString(text)
	DrawNotification(false, true)
end