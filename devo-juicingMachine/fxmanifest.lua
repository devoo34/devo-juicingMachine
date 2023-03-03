fx_version "cerulean"

description "decaStore"
author "canrow"
version "1.0.0"
repository "https://discord.gg/uH4g9VnJbT"

lua54 "yes"

game "gta5"

ui_page "src/html/ui.html"

shared_script "Settings.lua"

client_script "cl.lua"

server_script "sv.lua"

files {
  "src/html/*.*",
  "src/Assets/Fonts/*.*",
  "src/Assets/Images/*.*"
}