
local function global_on_attach(client, bufnr)
  -- Set up buffer-specific key mappings using `vim.keymap.set`
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[S]earch [H]elp' })
  -- Example key mappings
  vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = 'lsp definition' }, opts) -- Go to definition
  vim.keymap.set("n", "A", vim.lsp.buf.hover, { desc = 'lsp definition' }, opts)       -- Show hover documentation
  vim.keymap.set("n", "<leader>ci", vim.lsp.buf.implementation, { desc = 'lsp implementation' }, opts) -- Go to implementation
  vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = 'lsp rename' }, opts) -- Rename symbol
  vim.keymap.set("n", "<leader>cc", vim.lsp.buf.code_action, { desc = 'code action' }, opts) -- Code actions
  vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = 'Format buffer' }, opts)
  vim.keymap.set("n", "<leader>ch", vim.lsp.buf.signature_help, { desc = 'Signature help' }, opts)
  -- Add any other global bindings here
end

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
      on_attach = global_on_attach(client, bufnr),
      offset_encoding = "utf-8",
      root_dir = lspconfig.util.root_pattern("*.typ"),
      single_file_support = true
    }

    lspconfig.denols.setup({
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
      on_attach = global_on_attach(client, bufnr),
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
      on_attach = global_on_attach(client, bufnr),
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
