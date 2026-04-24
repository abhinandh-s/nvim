local version = "v1.6.0"

vim.pack.add({
  {
    src = 'https://github.com/saghen/blink.cmp',
    version = version,
  },
  -- dependencies
  'https://github.com/rafamadriz/friendly-snippets',
  'https://github.com/abhinandh-s/typst-snippets',
  'https://github.com/neovim/nvim-lspconfig',
})

local typst_info = vim.pack.get({ 'typst-snippets' })[1]
local upstream_path = typst_info and typst_info.path or ""
local dev_path = '/home/abhi/projects/typst-snippets'
local global = require('global')

local path_to_use = (global.dir_exists(dev_path)) and dev_path or upstream_path
   

---@module 'blink.cmp'
---@type blink.cmp.Config
require('blink.cmp').setup({

  keymap = {
    preset = 'default',
    ['<CR>'] = { 'accept', 'fallback' },
  },
  completion = {
    menu = {
      auto_show = true,
      draw = {
        columns = {
          { "label",     "label_description", gap = 1 },
          { "kind_icon", "kind" }
        },
      }
    },
    documentation = { auto_show = true, auto_show_delay_ms = 500 },
    ghost_text = { enabled = true },
  },

  snippets = { preset = 'default' },
  sources = {
    providers = {
      snippets = {
        opts = {
          search_paths = { path_to_use }
        },
      },
    },
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  fuzzy = {
    implementation = "prefer_rust_with_warning",
  },

  signature = { enabled = true }
})
