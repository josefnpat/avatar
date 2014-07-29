#!/usr/bin/lua

local scale=1
if arg and arg[1] then
  scale = arg[1]
end

local prefix=""
if arg and arg[2] then
  prefix = arg[2]
end

local width=1600*scale
local height=2400*scale

-- Main
os.execute("inkscape -z -e "..prefix.."-avatar.png"..
  " -w "..width..
  " -h "..height..
  " "..prefix.."-avatar.svg")

-- split
os.execute("convert "..prefix.."-avatar.png -crop "..
  width.."x"..(height/2)..
  " "..prefix.."-avatar-split.png")

-- square
os.execute("convert "..prefix.."-avatar-split-0.png -crop "..
  (height/2).."x"..(height/2).."+"..(width-height/2)..
  " "..prefix.."-avatar-square.png")
