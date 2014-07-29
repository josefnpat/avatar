#!/usr/bin/lua

palettes = require("palettes")

for name,data in pairs(palettes) do
  os.execute("./gen-svg.lua "..name)
  os.execute("./gen-png.lua 1 "..name)
end
