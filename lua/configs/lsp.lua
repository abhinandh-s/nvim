vim.lsp.enable({
  "lua_ls",
  "gfm_analyzer",
  "emmet_language_server",
  "tailwindcss_language_server",
  "deno_ls",
  "nixd",
});

local on_attach = require("global").global.on_attach

vim.lsp.config("*", {
  on_attach = on_attach
})

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

vim.pack.add({
  'https://github.com/j-hui/fidget.nvim',
})

require("fidget").setup {
  -- options
}
