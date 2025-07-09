local on_attach = require("configs.global").global.on_attach
local lspconfig = require('lspconfig')
local configs = require("lspconfig.configs")

vim.filetype.add({
  extension = {
    norg = "norg",
  },
})

if not configs.neorg_analyzer then
  configs.neorg_analyzer = {
    default_config = {
      cmd = { "/home/abhi/.cargo/__cache/target/debug/neorg-analyzer" },
      filetypes = { "norg" },
      root_dir = lspconfig.util.root_pattern("*"),
      settings = {},
    },
  }
end

return {
  'neovim/nvim-lspconfig',
  config = function()

    lspconfig.neorg_analyzer.setup({
      on_attach = on_attach,
    })

    lspconfig.lua_ls.setup({
      on_attach = on_attach,
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
    })

    lspconfig.denols.setup({
      on_attach = on_attach,
      root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
      settings = {},
      flags = {
        debounce_text_changes = 150,
      },
    })

    lspconfig.tailwindcss.setup({
      on_attach = on_attach,
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

    lspconfig.emmet_language_server.setup({
      on_attach = on_attach,
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

    lspconfig.nixd.setup({
      on_attach = on_attach,
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
