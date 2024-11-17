return {
  {
    'saecki/crates.nvim',
    ft = {"toml"},
    config = function ()
       require("crates").setup {
        completion = {
          cmp = {
            enable = true,
          },
        },
      }
    end
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
    config = function ()
      vim.g.rustaceanvim = {
        -- Plugin configuration
        tools = {
        },
        -- LSP configuration
        server = {
          on_attach = function(client, bufnr)
            -- you can also put keymaps in here
          end,
          --[[
         cmd = {
            "rustup", "run", "stable", "rust-analyzer",
          },
          ]]--
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
