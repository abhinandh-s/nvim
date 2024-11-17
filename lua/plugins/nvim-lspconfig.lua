return {
  'neovim/nvim-lspconfig',
  init_options = {
    userLanguages = {
      rust = "html",
    },
  },
  config = function()
    local lspconfig = require('lspconfig')
    --  lspconfig.rust_analyzer.setup {
    --   capabilities = {
    --     experimental = {
    --       serverStatusNotification = true
    --     }
    --   },
    --   single_file_support = true,
    --   settings = {
    --     ['rust-analyzer'] = {
    --       cargo = {
    --         features = "all",
    --       },
    --       diagnostics = {
    --         enable = true;
    --       },
    --       inlayHints = {
    --         bindingModeHints = {
    --           enable = true,
    --         },
    --         chainingHints = {
    --           enable = true,
    --         },
    --       },
    --     }
    --   }
    -- }

    lspconfig.typst_lsp.setup {
      on_attach = on_attach,
      offset_encoding = "utf-8",
      root_dir = lspconfig.util.root_pattern("*.typ"),
      single_file_support = true
    }

    lspconfig.denols.setup({
      root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
      on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true }
        -- Add more key mappings as needed
      end,
      root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
      settings = {
        -- Add any server-specific settings here
      },
      flags = {
        debounce_text_changes = 150,
      },
    })
    lspconfig.ts_ls.setup {
      on_attach = on_attach,
      root_dir = lspconfig.util.root_pattern("package.json"),
      single_file_support = false
    }

    lspconfig.tailwindcss.setup({
      on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true }
        -- Add more key mappings as needed
      end,
      filetypes = {
        "gohtml",
        "gohtmltmpl",
        "html",
        "php",
        "css",
        "postcss",
        "sass",
        "scss",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact"
      },
      settings = {
        tailwindCSS = {
          classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
          includeLanguages = {
            htmlangular = "html",
            templ = "html"
          },
          lint = {
            cssConflict = "warning",
            invalidApply = "error",
            invalidConfigPath = "error",
            invalidScreen = "error",
            invalidTailwindDirective = "error",
            invalidVariant = "error",
            recommendedVariantOrder = "warning"
          },
          validate = true
        }
      },
      flags = {
        debounce_text_changes = 150,
      },
    })
    -- NOTE: emmet_language_server 
    --
    lspconfig.emmet_language_server.setup({
      on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true }
        -- Add more key mappings as needed
      end,
      settings = {
        filetypes = {
          'css',
          'html',
          'javascriptreact',
          'sass',
          'scss',
          'typescriptreact',
        },
        single_file_support = true,
      },
      flags = {
        debounce_text_changes = 150,
      },
    })
    -- 
    --
    --
    lspconfig.lua_ls.setup({
      on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true }
        -- Add more key mappings as needed
      end,
      settings = {
        Lua = {
          completion = {
            callSnippet = 'Replace',
          },
          diagnostics = { disable = { 'missing-fields' } },
        },
      },
      flags = {
        debounce_text_changes = 150,
      },
    })
    lspconfig.nixd.setup({
      on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true }
        -- Add more key mappings as needed
      end,
      cmd = { "nixd" },
      settings = {
        nixd = {
          nixpkgs = {
            expr = "import <nixpkgs> { }",
          },
          formatting = {
            command = { "alejandra" }, -- or nixfmt or nixpkgs-fmt
          },
          options = {
            nixos = {
              expr = '(builtins.getFlake "/home/abhi/projects/github/nixdots").nixosConfigurations.nixos.options',
            },
            home_manager = {
              expr = '(builtins.getFlake "/home/abhi/projects/github/nixdots").homeConfigurations.nixos.options',
            },
          },
        },
      },
      flags = {
        debounce_text_changes = 150,
      },
    })
  end
}
