return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "hiphish/rainbow-delimiters.nvim",
    "windwp/nvim-autopairs",
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require("nvim-treesitter")
    treesitter.setup({
      highlight = {
        enable = true,
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

    -- vim.api.nvim_create_autocmd("FileType", {
    --   pattern = "*",
    --   callback = function()
    --     if pcall(vim.treesitter.start) then
    --       -- Indent expérimental
    --       -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    --       -- Folds
    --       vim.wo[0][0].foldmethod = "expr"
    --       vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
    --     end
    --   end,
    -- })

  end,
}
