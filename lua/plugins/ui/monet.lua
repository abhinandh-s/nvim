local dir_exists = require('configs.global').dir_exists

local plugins = {}

if dir_exists("/home/abhi/git/monet.nvim/") then
  table.insert(plugins, {
    dir = '/home/abhi/git/monet.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd [[colorscheme monet]]
    end
  })
else
  table.insert(plugins, {
    "abhinandh-s/monet.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd [[colorscheme monet]]
    end
  })
end

return plugins
