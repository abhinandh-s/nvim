return {
  {
    'saecki/crates.nvim',
    ft = { "toml" },
    config = function()
      require("crates").setup {
        completion = {
        },
      }
    end
  },
  {
    'mrcjkb/rustaceanvim',
    version = '*', -- Recommended
    lazy = false,   -- This plugin is already lazy
    config = function()
local on_attach = require("configs.global").global.on_attach
      vim.g.rustaceanvim = {
        -- Plugin configuration
        tools = {
        },
        -- LSP configuration
        server = {
          on_attach = on_attach,
          --[[
         cmd = {
            "rustup", "run", "stable", "rust-analyzer",
          },
          ]] --
          default_settings = {
            -- rust-analyzer language server configuration
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
        -- DAP configuration
        dap = {
        },
      }
    end
  },
}
