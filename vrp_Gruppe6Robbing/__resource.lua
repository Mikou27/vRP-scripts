--[[Original script [vrp_Gruppe6Robbing] by NENE(mikou)]]--
---https://forum.fivem.net/t/release-vrp-gruppe6robbing-gruppe6-armored-truck-robbing/290234

resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

version '1.5.0'

client_scripts {
"@vrp/client/Tunnel.lua",
"@vrp/client/Proxy.lua",
"client/main.lua",
"cfg/cl_cfg.lua"
}


server_scripts {
"@vrp/lib/utils.lua",
"server/main.lua",
"cfg/sv_cfg.lua"
}