ESX = exports["es_extended"]:getSharedObject()
local PlayerData = {}

blip = nil
blipRadius = nil

Citizen.CreateThread(function()
    while true do
        PlayerData = ESX.GetPlayerData()
        Citizen.Wait(1000)
    end
end)

RegisterCommand("sperrzone", function(source,args)
    if blip ~= nil or blipRadius ~= nil then
        TriggerServerEvent("blips:takeBlip")
        ShowNotification("Sperrzone wurde gelöscht")
    elseif PlayerData.job ~= nil and PlayerData.job.name == 'police' then
        local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
        TriggerServerEvent("blips:takeBlip", x, y, z)
    else 
        ShowNotification("Du musst beim PD eingestellt sein!")
    end
end)

RegisterNetEvent("blips:setBlip")
AddEventHandler("blips:setBlip", function(x,y,z)
    if x ~= nil then
        if blip == nil then
        	blip = AddBlipForCoord(x, y, z)
        	blipRadius = AddBlipForRadius(x,y,z, 150.0)
        	SetBlipAsShortRange(blip, true)
        	SetBlipScale(blip, 1.0)
        	SetBlipSprite(blip, 161)
        	SetBlipColour(blip, 3)
       	 	BeginTextCommandSetBlipName('STRING')
       	 	AddTextComponentString('Sperrzone')
        	EndTextCommandSetBlipName(blip)
        	SetBlipCategory(blip, 2)
        	SetBlipFlashes(blipRadius, true)
        	SetBlipFlashInterval(blipRadius, 400)
        	SetBlipAlpha(blipRadius, 80)
        	SetBlipColour(blipRadius, 3)
        	ShowNotification("Sperrzone wurde erstellt!")
        end
    else
            RemoveBlip(blip)
            RemoveBlip(blipRadius)
            blipRadius = nil
            blip = nil
    end
end)

function ShowNotification(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, true)
end