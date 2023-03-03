local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    Wait(500)
    SendNUIMessage({
        msg = "Data",
        Shop = Settings.Shop
    })
end)

RegisterNetEvent('devo-juicingMachine:cl:Open', function() 
    Open()
end)

function Open()
    SetNuiFocus(true, true)
    SendNUIMessage({
        msg = "Open"
    })
    RenderScriptCams(true, true, 1, true, true)
    DisplayHud(false)
    DisplayRadar(false)
end

function Close()
    SetNuiFocus(false, false)
    SendNUIMessage({
        msg = "Close"
    })
    if LastCar ~= nil then
        DeleteVehicle(LastCar)
    end
    RenderScriptCams(false)
    DestroyAllCams(true)
    SetFocusEntity(GetPlayerPed(PlayerId())) 
    DisplayHud(true)
    DisplayRadar(true)
end

RegisterNUICallback ("Close2", function ()
    Close()
end)

RegisterNUICallback("Buy", function(data)
    QBCore.Functions.TriggerCallback("devo-juicingMachine:money", function(result)
        if result then
            items = data.Item
            items = data.Item
            for i = 1, 1 do
                item = items[i]
                TriggerServerEvent("devo-juicingMachine:giveitem", items)
                QBCore.Functions.Notify("Afiyet olsun !", 'success', 2000)
                Close()
            end
        
        else QBCore.Functions.Notify("You Don't Have Enough Money", 'error', 7500) Close() end
    end, data.Price)
end)

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 250
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 0, 0, 0, 75)
end