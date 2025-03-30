local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")


vim.filetype.add({
  extension = {
    lime = "lime",
  },
})

-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
--   pattern = "*.age",
--   callback = function()
--     print("Lua file opened")
--     vim.cmd("Just decrypt")
--   end,
-- })

if not configs.neorg_analyzer then
  configs.neorg_analyzer = {
    default_config = {
      cmd = { "neorg-analyzer" },                                                  -- Path to your LSP binary
      filetypes = { "norg" },                           -- Replace with the filetypes your LSP handles
      root_dir = lspconfig.util.root_pattern(".git", "main.norg"),  -- Define your project root
      settings = {},                                                         -- Add any server-specific settings here
    },
  }
end

-- Setup your server
lspconfig.neorg_analyzer.setup({
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

if not configs.typst_analyzer then
  configs.typst_analyzer = {
    default_config = {
      cmd = { "typst-analyzer" },                                                  -- Path to your LSP binary
      filetypes = { "typst" },                           -- Replace with the filetypes your LSP handles
      root_dir = lspconfig.util.root_pattern(".git", ".your_project_root"),  -- Define your project root
      settings = {},                                                         -- Add any server-specific settings here
    },
  }
end
lspconfig.typst_analyzer.setup({
  on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "<leader>qqq", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)

    -- Open diagnostics list
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, bufopts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
  end,
   capabilities = vim.lsp.protocol.make_client_capabilities(),
})

-- Enable folding for LSP
vim.o.foldmethod = "expr"                              -- Use expression-based folding
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"          -- Use Treesitter for foldexpr
-- vim.o.foldlevel = 99                                   -- Open all folds by default
vim.o.foldenable = true                                -- Enable folding globally








if not configs.org_analyzer then
  configs.org_analyzer = {
    default_config = {
      cmd = { "org-analyzer" },                                                  -- Path to your LSP binary
      filetypes = { "org" },                           -- Replace with the filetypes your LSP handles
      root_dir = lspconfig.util.root_pattern(".git", ".your_project_root"),  -- Define your project root
      settings = {},                                                         -- Add any server-specific settings here
    },
  }
end
lspconfig.org_analyzer.setup({
  on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "<leader>qqq", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)

    -- Open diagnostics list
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, bufopts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
  end,
   capabilities = vim.lsp.protocol.make_client_capabilities(),
})




vim.filetype.add {
  extension = {
    lime = "lime",
  },
}

if not configs.lime_analyzer then
  configs.lime_analyzer = {
    default_config = {
      cmd = { "lime-analyzer" },                                                  -- Path to your LSP binary
      filetypes = { "lime" },                           -- Replace with the filetypes your LSP handles
      root_dir = lspconfig.util.root_pattern(".git", "basket.toml"),  -- Define your project root
      settings = {},                                                         -- Add any server-specific settings here
    },
  }
end

-- Setup your server
lspconfig.lime_analyzer.setup({
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

