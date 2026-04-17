require "configs"

local o = vim.opt

o.number = true
o.relativenumber = true
o.mouse = 'a'
o.cursorline = true
o.undofile = false
o.swapfile = false
o.list = false
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true
o.breakindent = true
o.backspace = "indent,eol,start"
o.clipboard:append("unnamedplus")
o.scrolloff = 8

vim.g.mapleader = " "

vim.pack.add({
  'https://github.com/abhinandh-s/monet.nvim',
})

vim.cmd.colorscheme 'monet'

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

require "plugins"


-- local transparent = false
--
-- if transparent do
--   local hl_groups = {
--     "Normal", "NormalNC"
--   }
--
--   for _, group in ipairs(hl_groups) do
--     --  vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
--   end
-- end
