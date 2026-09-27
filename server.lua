ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Buy Make Event
RegisterServerEvent('makes:buyMake')
AddEventHandler('makes:buyMake', function(makeName)
    local xPlayer = ESX.GetPlayerFromId(source)
    local make = nil

    -- Find the make in the config
    for _, m in ipairs(Config.Makes) do
        if m.name == makeName then
            make = m
            break
        end
    end

    if make then
        if xPlayer.getMoney() >= make.price then
            xPlayer.removeMoney(make.price)
            TriggerClientEvent('esx:showNotification', source, 'You bought ' .. make.label .. ' for $' .. make.price)
        else
            TriggerClientEvent('esx:showNotification', source, 'You do not have enough money to buy ' .. make.label)
        end
    else
        TriggerClientEvent('esx:showNotification', source, 'Invalid make')
    end
end)