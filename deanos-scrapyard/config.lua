Config = {}

Config.ScrapTime = 10000

-- Scrap prop hashes
Config.ScrapModels = {
    10106915,
    -273279397,
    1120812170,
    322493792,
    591265130,
    -915224107,
    929870559,
    -896997463,
    -52638650,
    -1366478936,
    2090224559,
    -1748303324,
    -105334880
}

-- Scrap selling ped
Config.SellPed = {
    model = 's_m_m_dockwork_01',
    coords = vec4(2340.59, 3053.88, 48.15, 90.0)
}

-- Scrap rewards
Config.ScrapItems = {
    ['steel'] = {min = 3, max = 8, price = 15},
    ['rubber'] = {min = 2, max = 5, price = 10},
    ['metalscrap'] = {min = 5, max = 12, price = 12},
    ['iron'] = {min = 3, max = 7, price = 14},
    ['copper'] = {min = 2, max = 6, price = 2000},
    ['aluminum'] = {min = 3, max = 9, price = 18},
    ['plastic'] = {min = 2, max = 6, price = 8}
}