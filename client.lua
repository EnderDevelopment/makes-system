ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    -- Register NUI Callback
    RegisterNUICallback('buyMake', function(data, cb)
        TriggerServerEvent('makes:buyMake', data.makeName)
        cb('ok')
    end)

    -- Open Makes Menu
    function OpenMakesMenu()
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'openMakesMenu',
            makes = Config.Makes
        })
    end

    -- Register Command
    RegisterCommand('makes', function()
        OpenMakesMenu()
    end, false)

    -- Register Key Mapping
    RegisterKeyMapping('makes', 'Open Makes Menu', 'keyboard', 'F7')
end)