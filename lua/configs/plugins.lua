local palette = require('colors')

vim.pack.add({
  "https://github.com/folke/tokyonight.nvim",
})

local transparent = false -- set to true if you would like to enable transparency

local bg_search = palette.mocha.red

require("tokyonight").setup({
  style = "night",
  transparent = transparent,
  styles = {
    sidebars = transparent and "transparent" or "dark",
    floats = transparent and "transparent" or "dark",
  },
  on_colors = function(colors)
    colors.bg_search = bg_search
  end,
})

vim.cmd("colorscheme tokyonight")
