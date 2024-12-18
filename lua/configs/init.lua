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

-- Set scrolloff to 8 lines
o.scrolloff = 8

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


vim.lsp.inlay_hint.enable(true)

--[[

colorscheme tokyonight

" There are also colorschemes for the different styles.

colorscheme tokyonight-night
colorscheme tokyonight-storm
colorscheme tokyonight-day
colorscheme tokyonight-moon

]]--

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

require('configs.term')
require('configs.remap')
require('configs.test')
