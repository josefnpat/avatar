#!/usr/bin/lua

local scale=1
if arg and arg[1] then
  scale = arg[1]
end

local width=1600*scale
local height=2400*scale

-- Main
os.execute("inkscape -z -e avatar.png -w "..width.." -h "..height.." avatar.svg")

-- split
os.execute("convert avatar.png -crop "..width.."x"..(height/2).." avatar-split.png")

-- square
os.execute("convert avatar-split-0.png -crop "..(height/2).."x"..(height/2).."+"..(width-height/2).." avatar-square.png")
