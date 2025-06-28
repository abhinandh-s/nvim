return {
  {
    dir = '/home/abhi/git/monet.nvim',
    -- "abhinandh-s/monet.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd[[colorscheme monet]]
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd [[colorscheme tokyonight]]
    end
  }
}
