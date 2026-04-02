local colors = {
  blue       = "#89b4fa",
  mauve      = "#cba6f7",
  pink       = "#f5c2e7",
  red        = "#f38ba8",
  cherry_red = "#e52e71",
}

local highlights = {
  ["markdownH1"]          = { fg = colors.cherry_red, bold = true },
  ["markdownH2"]          = { fg = colors.cherry_red, bold = true },
  ["markdownH3"]          = { fg = colors.cherry_red, bold = true },
  ["markdownH4"]          = { fg = colors.cherry_red, bold = true },
  ["markdownH5"]          = { fg = colors.cherry_red, bold = true },
  ["markdownH6"]          = { fg = colors.cherry_red, bold = true },
  ["markdownH1Delimiter"] = { fg = colors.cherry_red, bold = true },
  ["markdownH2Delimiter"] = { fg = colors.cherry_red, bold = true },
  ["markdownH3Delimiter"] = { fg = colors.cherry_red, bold = true },
  ["markdownH4Delimiter"] = { fg = colors.cherry_red, bold = true },
  ["markdownH5Delimiter"] = { fg = colors.cherry_red, bold = true },
  ["markdownH6Delimiter"] = { fg = colors.cherry_red, bold = true },
  ["@markup.link.label"]  = { fg = colors.mauve },
  ["@markup.italic"]      = { fg = colors.pink, italic = true },
  ["@markup.strong"]      = { fg = colors.red, bold = true },
}

for group, settings in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, settings)
end

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
