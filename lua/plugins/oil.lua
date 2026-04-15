vim.pack.add({
  'https://github.com/stevearc/oil.nvim',
  'https://github.com/nvim-mini/mini.icons',
})

require("oil").setup({
   columns = {
    "icon",
    -- "permissions",
    "size",
    "mtime",
  },
})

vim.keymap.set(
  "n",
  "-", 
  "<CMD>Oil<CR>",
  { desc = "Open parent directory" }
)
