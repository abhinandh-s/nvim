return {
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowTeal",
        "RainbowGreen",
        "RainbowOrange",
        "RainbowCyan",
      }

      local hooks = require("ibl.hooks")
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#f38ba8" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#f9e2af" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#94e2d5" })
        vim.api.nvim_set_hl(0, "RainbowTeal", { fg = "#a6e3a1" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#cba6f7" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#fab387" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#89b4fa" })
      end)

      local ibl = require("ibl")
      ibl.setup({
        indent = {
          char = "│",
          tab_char = "│",
          highlight = highlight,
        },
        scope = {
          enabled = false,
        },
        vim.opt.listchars:append("space: "),
      })
    end,
  },
}
