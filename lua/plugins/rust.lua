vim.pack.add({
  'https://github.com/saecki/crates.nvim',
})

require("crates").setup {
  completion = {
  },
}
vim.pack.add({
  {
  src = 'https://github.com/mrcjkb/rustaceanvim',
  version = vim.version.range('^9')
},
})

local global = require("global")

vim.g.rustaceanvim = {
  server = {
    on_attach = function(client, bufnr)
      -- Call your global attach logic
      global.global.on_attach(client, bufnr)
      
      -- You can add Rust-specific keymaps here if you want
      local opts = { silent = true, buffer = bufnr }
      vim.keymap.set("n", "<leader>ce", function() vim.cmd.RustLsp('expandMacro') end, opts)
    end,
    default_settings = {
      -- rust-analyzer settings
      ['rust-analyzer'] = {
        cargo = {
          allFeatures = true,
          buildScripts = {
            enable = true,
          },
        },
        imports = {
          granularity = {
            group = "module",
          },
          prefix = "self",
        },
        procMacro = {
          enable = true
        },
      },
    },
  },
}
