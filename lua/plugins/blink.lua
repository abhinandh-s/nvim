local version = "v1.6.0"

-- Get the info for the specific plugin

-- local h = '~/.local/share/nvim/site/pack/core/opt/typst-snippets'

vim.pack.add({
  {
    src = 'https://github.com/saghen/blink.cmp',
    version = version,
  },
  -- dependencies
  'https://github.com/rafamadriz/friendly-snippets',
  { src = '/home/abhi/projects/typst-snippets' },
  -- { src = 'https://github.com/L3MON4D3/LuaSnip', version = 'v2.5.0' },
  'https://github.com/neovim/nvim-lspconfig',
})

-- require("luasnip.loaders.from_vscode").load {
--   exclude = { "cobol" },
-- }
local typst_info = vim.pack.get({'typst-snippets'})[1]
local typst_path = typst_info and typst_info.path or ""

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
  -- snippets = { preset = 'luasnip' },
  sources = {
    providers = {
      snippets = {
        opts = {
          search_paths = { typst_path }
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
