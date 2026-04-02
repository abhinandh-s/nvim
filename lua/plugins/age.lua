local dir_exists = require('global').dir_exists

local plugins = {}

local path = "/home/abhi/git/age.nvim/"

if dir_exists(path) then
  table.insert(plugins, {
    dir = path,
    cmd = { "Age" },
    config = function()
      require('age').setup({
        encrypt_and_del       = true,
        key_file              = vim.fn.expand("~/.config/sops/age/keys.txt"), -- no need to specify `private_key` now
        exclude_in_completion = { ".git", ".cargo", "Downloads" },
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
        key_file = vim.fn.expand("~/.config/sops/age/keys.txt"), -- no need to specify `private_key` now
        exclude_in_completion = { ".git", ".cargo", "Downloads" },
      })
    end
  })
end

return plugins
