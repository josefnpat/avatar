#!/usr/bin/lua

local palettes = {
  remix = {
    note        = "Romance Bloody Romance: Remixes & B-Sides",
    colors = {
      body        = "#f3b390",
      body_edge   = "#000000",
      background  = "#5fbfde",
      lines_dark  = "#e94496",
      lines_light = "#f1cce0",
    }
  },
  lp = {
    note = "You're a Woman, I'm a Machine",
    colors = {
      body        = "#ffffff",
      body_edge   = "#000000",
      background  = "#f0a4be",
      lines_dark  = "#f0a4be",
      lines_light = "#f0a4be",
    }
  },
  ep = {
    note = "Heads Up",
    colors = {
      body        = "#ffffff",
      body_edge   = "#000000",
      background  = "#ef8812",
      lines_dark  = "#ef8812",
      lines_light = "#ef8812",
    }
  },
  single2 = {
    note = "Blood on Our Hands",
    colors = {
      body        = "#ffffff",
      body_edge   = "#000000",
      background  = "#bb241d",
      lines_dark  = "#bb241d",
      lines_light = "#bb241d",
    }
  },
  single3 = {
    note = "Black History Month",
    colors = {
      body        = "#ffffff",
      body_edge   = "#383838",
      background  = "#383838",
      lines_dark  = "#383838",
      lines_light = "#383838",
    }
  }
}

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
  os.execute("cp avatar.svg avatar.src")
  for name,color in pairs(palettes[palette_name].colors) do
    os.execute("sed -i 's/"..color.."/%%"..name.."%%/' avatar.src")
  end
else
  print("rendering palette `"..palette_name.."`")
  --os.execute("cp avatar.svg avatar.svg.backup")
  os.execute("cp avatar.src avatar.svg")
  for name,color in pairs(palettes[palette_name].colors) do
    os.execute("sed -i 's/%%"..name.."%%/"..color.."/' avatar.svg")
  end
end
