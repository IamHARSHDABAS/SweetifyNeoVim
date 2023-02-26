local sweetify = require("sweetify")
local configs = sweetify.configs()
local colors = sweetify.colors()

local bg = configs.lualine_bg_color or colors.black

local normal = {
   a = { fg = colors.black, bg = colors.purple, gui = 'bold' },
   b = { fg = colors.purple, bg = bg },
   c = { fg = colors.white, bg = bg },
}

local command = {
   a = { fg = colors.black, bg = colors.cyan, gui = 'bold' },
   b = { fg = colors.cyan, bg = bg },
}

local visual = {
   a = { fg = colors.black, bg = colors.white, gui = 'bold' },
   b = { fg = colors.white, bg = bg },
}

local inactive = {
   a = { fg = colors.white, bg = colors.selection, gui = 'bold' },
   b = { fg = colors.black, bg = colors.white },
}

local replace = {
   a = { fg = colors.black, bg = colors.yellow, gui = 'bold' },
   b = { fg = colors.yellow, bg = bg },
   c = { fg = colors.white, bg = bg },
}

local insert = {
   a = { fg = colors.black, bg = colors.green, gui = 'bold' },
   b = { fg = colors.green, bg = bg },
   c = { fg = colors.white, bg = bg },
}

return {
   normal = normal,
   command = command,
   visual = visual,
   inactive = inactive,
   replace = replace,
   insert = insert,
}
