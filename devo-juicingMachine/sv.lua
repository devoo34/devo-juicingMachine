local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback("devo-juicingMachine:money", function(source, cb, Money) 
local Player = QBCore.Functions.GetPlayer(source)
        if Player.Functions.RemoveMoney("Cash", Money) then
            cb(true)
        else
            cb(false)
        end
    end)

    RegisterServerEvent('devo-juicingMachine:giveitem', function(item)
        local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.AddItem(item, 1)
    end)