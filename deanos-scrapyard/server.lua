RegisterNetEvent('deanos-scrapyrd:giveScrap', function()

    local src = source

    for item, data in pairs(Config.ScrapItems) do

        if math.random(1,100) <= 80 then

            local amount = math.random(data.min, data.max)

            exports.ox_inventory:AddItem(src, item, amount)

        end

    end

end)



RegisterNetEvent('deanos-scrapyrd:sellItem', function(item)

    local src = source
    local itemData = Config.ScrapItems[item]

    if not itemData then return end

    local count = exports.ox_inventory:GetItemCount(src, item)

    if count <= 0 then

        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Scrapyard',
            description = 'You have no '..item..' to sell.',
            type = 'error'
        })

        return

    end

    local total = count * itemData.price

    exports.ox_inventory:RemoveItem(src, item, count)
    exports.ox_inventory:AddItem(src, 'money', total)

    TriggerClientEvent('ox_lib:notify', src, {
        title = 'Scrapyard',
        description = 'Sold '..count..' '..item..' for $'..total,
        type = 'success'
    })

end)



RegisterNetEvent('deanos-scrapyrd:sellAll', function()

    local src = source
    local total = 0
    local soldSomething = false

    for item, data in pairs(Config.ScrapItems) do

        local count = exports.ox_inventory:GetItemCount(src, item)

        if count > 0 then

            exports.ox_inventory:RemoveItem(src, item, count)

            total = total + (count * data.price)
            soldSomething = true

        end

    end

    if soldSomething then

        exports.ox_inventory:AddItem(src, 'money', total)

        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Scrapyard',
            description = 'Sold all scrap for $'..total,
            type = 'success'
        })

    else

        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Scrapyard',
            description = 'You have no scrap to sell.',
            type = 'error'
        })

    end

end)