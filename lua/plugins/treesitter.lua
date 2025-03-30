return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
   -- "hiphish/rainbow-delimiters.nvim",
    "windwp/nvim-autopairs",
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({
      highlight = {
        enable = true,
        custom_captures = {
          ["tex"] = {
            ["function.declaration"] = "TSFunction", -- Change the TSFunction to your highlight group
          },
        },
      },
      indent = { enable = true },
      autotag = {
        enable = true,
      },
      sync_install = true,
      auto_install = true,
      ensure_installed = {
        "lua",
        "rust",
        "org",
        "typst",
      },
     -- ignore_install = { "org" },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
        autotag = {
          enable = true,
        },
        autopairs = {
          enable = true,
        },

        rainbow = {
          enable = true,
        },
      },
    })

    -- Associate .lime files with Typst
    vim.filetype.add({
      extension = {
        lime = "typst", -- ✅ Tell Neovim that .lime files are Typst
      },
    })

    -- Ensure Tree-sitter treats .lime as Typst syntax
    require("nvim-treesitter.parsers").get_parser_configs().typst.filetype_to_parsername = { "typst", "lime" }
  end,
}
