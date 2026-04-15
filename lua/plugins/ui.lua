vim.pack.add({
  'https://github.com/lukas-reineke/indent-blankline.nvim',
})

-- 1. Define Highlight Group Names
local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowTeal",
    "RainbowGreen",
    "RainbowOrange",
    "RainbowCyan",
}

-- 2. Register Hooks for Colors
local hooks = require("ibl.hooks")
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed",    { fg = "#f38ba8" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#f9e2af" })
    vim.api.nvim_set_hl(0, "RainbowBlue",   { fg = "#94e2d5" })
    vim.api.nvim_set_hl(0, "RainbowTeal",   { fg = "#a6e3a1" })
    vim.api.nvim_set_hl(0, "RainbowGreen",  { fg = "#cba6f7" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#fab387" })
    vim.api.nvim_set_hl(0, "RainbowCyan",   { fg = "#89b4fa" })
end)

-- 3. Setup IBL
require("ibl").setup({
    indent = {
        char = "│",
        tab_char = "│",
        highlight = highlight,
    },
    scope = {
        enabled = false, -- Disables the underline/bolding of the current scope
    },
})

-- Ensure space characters are handled (from your snippet)
vim.opt.listchars:append("space: ")


