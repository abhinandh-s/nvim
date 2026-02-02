require "configs"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "plugins" },
	{ import = "plugins.lang" },
	{ import = "plugins.ui" },
--	{ import = "plugins.lang.lsp" }
}, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})


vim.opt.colorcolumn = "80"


vim.api.nvim_set_hl(0, "CursorLine", { bg = "#303446" })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#303446" })
