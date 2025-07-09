-- ref: https://stackoverflow.com/questions/1340230/check-if-directory-exists-in-lua
--
-- Check if a file or directory exists in this path
local function dir_exists(path)
  local ok, _, code = os.rename(path, path)
  if not ok then
    if code == 13 then
      -- permission denied, but it exists
      return true
    end
    return false
  end
  return true
end

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
