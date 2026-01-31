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

-- vim.g.do_filetype_lua = 1
-- vim.g.did_load_filetypes = 1

vim.lsp.inlay_hint.enable(true)

vim.diagnostic.config({
  -- Use the default configuration
  -- virtual_lines = true

  -- Alternatively, customize specific options
  virtual_lines = {
    --  -- Only show virtual line diagnostics for the current cursor line
    current_line = true,
  },
})

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


local on_attach = require("configs.global").global.on_attach

vim.lsp.enable({ 
  "lua_ls",
  "gfm_analyzer", 
  "emmet_language_server", 
  "tailwindcss",
  "deno_ls",
 -- "nixd",
});

vim.lsp.config("*", {
  on_attach = on_attach()
})
