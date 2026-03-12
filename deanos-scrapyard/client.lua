local scrapCooldown = {}

-- SCRAP TARGETS
CreateThread(function()

    exports.ox_target:addModel(Config.ScrapModels, {
        {
            name = 'deanos_scrap',
            icon = 'fa-solid fa-screwdriver-wrench',
            label = 'Scrap Vehicle',
            distance = 2.5,
            onSelect = function(data)

                local entity = data.entity
                local key = tostring(entity)

                if scrapCooldown[key] then
                    lib.notify({
                        title = 'Scrapyard',
                        description = 'This wreck was recently scrapped.',
                        type = 'error'
                    })
                    return
                end

                local player = PlayerPedId()
                local coords = GetEntityCoords(player)

                -- Load particle effect
                RequestNamedPtfxAsset("core")
                while not HasNamedPtfxAssetLoaded("core") do
                    Wait(0)
                end

                UseParticleFxAssetNextCall("core")

                local sparks = StartParticleFxLoopedAtCoord(
                    "ent_dst_elec_fire_sp",
                    coords.x,
                    coords.y,
                    coords.z,
                    0.0,
                    0.0,
                    0.0,
                    1.0,
                    false,
                    false,
                    false,
                    false
                )

                if lib.progressBar({
                    duration = Config.ScrapTime,
                    label = 'Cutting vehicle...',
                    canCancel = true,
                    disable = {
                        move = true,
                        combat = true
                    },
                    anim = {
                        dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                        clip = "machinic_loop_mechandplayer"
                    }
                }) then

                    StopParticleFxLooped(sparks, 0)

                    TriggerServerEvent('deanos-scrapyrd:giveScrap')

                    scrapCooldown[key] = true

                    SetTimeout(600000, function()
                        scrapCooldown[key] = nil
                    end)

                else
                    StopParticleFxLooped(sparks, 0)
                end

            end
        }
    })

end)



-- SPAWN SCRAP BUYER PED
CreateThread(function()

    local model = joaat(Config.SellPed.model)
    local coords = Config.SellPed.coords

    RequestModel(model)

    while not HasModelLoaded(model) do
        Wait(100)
    end

    local ped = CreatePed(4, model, coords.x, coords.y, coords.z - 1.0, coords.w, false, true)

    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)

    exports.ox_target:addLocalEntity(ped, {
        {
            name = 'sell_scrap',
            icon = 'fa-solid fa-dollar-sign',
            label = 'Sell Scrap',
            distance = 2.0,
            onSelect = function()
                OpenScrapMenu()
            end
        }
    })

end)



-- SELL MENU
function OpenScrapMenu()

    local options = {}

    -- Sell all option
    options[#options+1] = {
        title = "Sell All Scrap",
        description = "Sell every scrap item in your inventory",
        icon = "fa-solid fa-money-bill",
        event = "deanos-scrapyrd:sellAll"
    }

    -- Individual items
    for item, data in pairs(Config.ScrapItems) do

        options[#options+1] = {
            title = item,
            description = "Sell price: $" .. data.price,
            icon = "fa-solid fa-recycle",
            event = "deanos-scrapyrd:sellItem",
            args = item
        }

    end

    lib.registerContext({
        id = 'scrap_sell_menu',
        title = 'Scrap Buyer',
        options = options
    })

    lib.showContext('scrap_sell_menu')

end



-- SELL EVENTS
RegisterNetEvent('deanos-scrapyrd:sellItem', function(item)
    TriggerServerEvent('deanos-scrapyrd:sellItem', item)
end)

RegisterNetEvent('deanos-scrapyrd:sellAll', function()
    TriggerServerEvent('deanos-scrapyrd:sellAll')
end)