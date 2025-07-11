return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },
  --  {
  --    "OXY2DEV/markview.nvim",
  --    lazy = false,
  --    config = function()
  --      local presets = require("markview.presets");
  --
  --      require("markview").setup({
  --        preview = {
  --        icon_provider = "mini", -- "mini" or "devicons"
  --    }
  --      });
  --    end
  --  },
  {
    "nvim-neorg/neorg",
    lazy = false,
    version = "*",
    dependencies = { "nvim-neorg/lua-utils.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.concealer"] = {
            config = {
              icon_preset = "diamond",
            },
          },
        },
      }
    end,
  },
}
