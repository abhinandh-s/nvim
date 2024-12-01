return {
  "tpope/vim-fugitive",
  lazy = true,
  cmd = { "Git", "G" },
  keys = {
    { "<leader>ga", ":Git add -A<CR>", desc = "Git add all changes" }, -- Keybinding for Git add -A
    { "<leader>gc", ":Git commit<CR>", desc = "Git commit" },
    { "<leader>gp", ":Git push<CR>", desc = "Git push" },
  },
}
