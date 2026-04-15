local version = "v1.6.0"

vim.pack.add({
  {
    src = 'https://github.com/saghen/blink.cmp',
    version = version,
  },
  -- dependencies
  'https://github.com/rafamadriz/friendly-snippets',
  'https://github.com/neovim/nvim-lspconfig',
})


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
          { "label", "label_description", gap = 1 },
          { "kind_icon", "kind" }
        },
      }
    },
    documentation = { auto_show = true, auto_show_delay_ms = 500 },
    ghost_text = { enabled = true },
  },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

   fuzzy = {
    implementation = "lua",
  },

  snippets = { preset = 'default' }, -- Adjusted from the snippet choice
  signature = { enabled = true }
})


