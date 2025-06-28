return {
  'saghen/blink.cmp',
  dependencies = {
    {dir = '/home/abhi/git/friendly-snippets'},
    { 'L3MON4D3/LuaSnip', version = 'v2.*' },
  },
  version = '1.*',
  -- build = 'cargo build --release',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'enter',
      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },

      -- disable a keymap from the preset
      ['<C-e>'] = {},

      -- show with a list of providers
      ['<C-k>'] = { 'scroll_documentation_up' },
      ['<C-j>'] = { 'scroll_documentation_down' },

      ['<C-h>'] = { 'snippet_forward' },
      ['<C-l>'] = { 'snippet_backward' },

      ['<Tab>'] = { 'snippet_forward', 'fallback' },
      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

      ['<C-s>'] = { 'show_signature', 'hide_signature', 'fallback' },
    },
    appearance = { nerd_font_variant = 'mono' },
    completion = {
      menu = {
        auto_show = true,
        draw = {
          columns = {
            { "label", "label_description", gap = 8 },
            { "kind_icon",gap = 2,  "kind" }
          },
        }
      },
      keyword = { range = 'full' },
      accept = { auto_brackets = { enabled = false }, },
      documentation = { auto_show = true },
      ghost_text = { enabled = true },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    snippets = { preset = 'luasnip' },
    signature = { enabled = true },
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
