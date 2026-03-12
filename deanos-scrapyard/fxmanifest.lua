fx_version 'cerulean'
game 'gta5'

name 'deanos-scrapyard'
author 'DeanoDevTeam'
description 'Scrap vehicles for materials'

shared_script 'config.lua'

client_scripts {
    '@ox_lib/init.lua',
    'client.lua'
}

server_scripts {
    '@ox_lib/init.lua',
    'server.lua'
}

dependencies {
    'ox_target',
    'ox_inventory',
    'ox_lib'
}