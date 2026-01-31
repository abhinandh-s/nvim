return {
  filetypes = { "lua" },
  settings = {
    Lua = {
      completion = {
        callSnippet = 'Replace',
      },
      diagnostics = { disable = {} },
    },
  },
  flags = {
    debounce_text_changes = 150,
  },
}
