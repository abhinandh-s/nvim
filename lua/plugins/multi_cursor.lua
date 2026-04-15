vim.pack.add({
  'https://github.com/brenton-leighton/multiple-cursors.nvim',
})

-- 1. Setup Highlights (Teal/Crust palette)
vim.api.nvim_set_hl(0, "MultipleCursorsCursor", { bg = "#94e2d5", fg = "#1e1e2e" })
vim.api.nvim_set_hl(0, "MultipleCursorsVisual", { bg = "#94e2d5", fg = "#1e1e2e" })

-- 2. Initialize Plugin
require("multiple-cursors").setup({})

-- 3. Define Keymaps
local map = vim.keymap.set

-- Normal and Visual modes
map({"n", "x"}, "<C-j>", "<Cmd>MultipleCursorsAddDown<CR>", { desc = "Add cursor and move down" })
map({"n", "x"}, "<C-k>", "<Cmd>MultipleCursorsAddUp<CR>", { desc = "Add cursor and move up" })

-- Normal, Insert, and Visual modes
map({"n", "i", "x"}, "<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", { desc = "Add cursor and move up" })
map({"n", "i", "x"}, "<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", { desc = "Add cursor and move down" })



