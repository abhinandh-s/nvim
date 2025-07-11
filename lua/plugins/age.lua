local dir_exists = require('configs.global').dir_exists

local plugins = {}

local path = "/home/abhi/git/age.nvim/"

local public_key = os.getenv("AGE_PUBLIC_KEY")
local private_key = os.getenv("AGE_PRIVATE_KEY")

if not public_key or not private_key then
  vim.notify("AGE keys are not set in environment variables!", vim.log.levels.ERROR)
  return
else
  if dir_exists(path) then
    table.insert(plugins, {
      dir = path,
      cmd = { "Age" },
      config = function()
        require('age').setup({
          encrypt_and_del = true,
          public_key = public_key,
          private_key = private_key,
        })
      end
    })
  else
    table.insert(plugins, {
      "abhinandh-s/age.nvim",
      cmd = { "Age" },
      config = function()
        require('age').setup({
          encrypt_and_del = true,
          public_key = public_key,
          private_key = private_key,
        })
      end
    })
  end
end

return plugins
