local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")



-- vim.filetype.add {
--   extension = {
--     ebnf = "ebnf",
--   },
-- }
--
-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
--   pattern = "*.age",
--   callback = function()
--     print("Lua file opened")
--     vim.cmd("Just decrypt")
--   end,
-- })

if not configs.just_lsp then
  configs.just_lsp = {
    default_config = {
      cmd = { "just-lsp" },                                                  -- Path to your LSP binary
      filetypes = { "markdown", "typst", "ebnf" },                           -- Replace with the filetypes your LSP handles
      root_dir = lspconfig.util.root_pattern(".git", ".your_project_root"),  -- Define your project root
      settings = {},                                                         -- Add any server-specific settings here
    },
  }
end

-- Setup your server
lspconfig.just_lsp.setup({
  -- capabilities = vim.lsp.protocol.make_client_capabilities(),
  on_attach = function(client, bufnr)
    -- print(vim.inspect(client.server_capabilities))
    -- Optional: Customize keybindings for LSP
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  end,
--  capabilities = capabilities,
})
