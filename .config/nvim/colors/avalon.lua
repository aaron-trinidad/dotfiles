local colors_name = "avalon"
vim.g.colors_name = colors_name

vim.g.zenbones_transparent_background = true

local lush = require("lush")
local hsluv = lush.hsluv
local util = require("zenbones.util")

local bg = vim.o.background

-- Paleta Avalon (oscura y mística)
local palette = util.palette_extend({
  bg = hsluv("#1c1c1c"), -- fondo
  fg = hsluv("#F0EAD6"), -- texto principal
  rose = hsluv("#A5BCC7"), -- statement
  leaf = hsluv("#82A37F"), -- constant
  wood = hsluv("#d6dfe4"), -- strings
  water = hsluv("#E0D8C7"), -- special
  blossom = hsluv("#bc95b3"), -- type
  sky = hsluv("#95BECF"), -- function
  comment = hsluv("#727169"), -- comment
}, bg)

-- Genera los grupos básicos con la paleta
local generator = require("zenbones.specs")
local base_specs = generator.generate(palette, bg, generator.get_global_config(colors_name, bg))

-- Opcional: puedes modificar algunos grupos aquí
local specs = lush.extends({ base_specs }).with(function()
  return {
    Comment({ fg = palette.comment, gui = "italic" }),
    Statement({ fg = palette.rose }),
    Function({ fg = palette.sky, gui = "italic" }),
    Type({ fg = palette.blossom }),
    String({ fg = palette.wood }),
    Constant({ fg = palette.leaf }),
    Special({ fg = palette.water }),
  }
end)

-- Aplica el esquema
lush(specs)

-- Colores del modo terminal
require("zenbones.term").apply_colors(palette)

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "MsgArea", { bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { bg = "none" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
-- vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
