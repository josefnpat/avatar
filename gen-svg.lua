#!/usr/bin/lua

palettes = require("palettes")

reverse = arg[2] == "reverse"
if arg and arg[1] and palettes[arg[1]] then
  palette_name = arg[1]
else
  print("Invalid palette. Please choose one of the following:")
    print("\t[name]\t\t[note]")
  for i,v in pairs(palettes) do
    print("\t"..i.."\t\t"..v.note)
  end
  print("")
  print("Use `"..arg[0].." [palette] reverse` to reverse the colors from svg to src")
  return
end

if reverse then
  print("rendering palette `"..palette_name.."` in reverse.")
  --os.execute("cp avatar.src avatar.src.backup")
  os.execute("cp "..palette_name.."-avatar.svg avatar.src")
  for name,color in pairs(palettes[palette_name].colors) do
    os.execute("sed -i 's/"..color.."/%%"..name.."%%/' avatar.src")
  end
else
  print("rendering palette `"..palette_name.."`")
  --os.execute("cp avatar.svg avatar.svg.backup")
  os.execute("cp avatar.src "..palette_name.."-avatar.svg")
  for name,color in pairs(palettes[palette_name].colors) do
    os.execute("sed -i 's/%%"..name.."%%/"..color.."/' "..palette_name.."-avatar.svg")
  end
end
