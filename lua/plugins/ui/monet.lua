return {
  dir = "/home/abhi/git/monet.nvim",
  lazy = false,    -- We want to load this immediately
  priority = 1000, -- High priority to load before other plugins
  config = function()
    vim.cmd("colorscheme monet")
  end,
}
