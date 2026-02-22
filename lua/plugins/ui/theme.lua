return {
  {
    "folke/tokyonight.nvim",
    dependencies = {
      dir = "~/git/age.nvim"
    },
    priority = 1000,
    config = function()
      -- local age = require("age")
      --
      -- ---------
      -- -- api 01
      -- ---------
      --
      -- -- Load the secret
      -- local path = vim.fn.expand("~/.config/nvim/top_secret.txt.age")
      --
      -- local secret = age.decrypt_to_string(path):gsub("%s+", "")
      -- print(secret)
      --
      -- ---------
      -- -- api 02
      -- ---------
      -- local secret_02 = age.decrypt_to_string_with_identities(
      --   vim.fn.expand("~/.config/nvim/top_secret.txt.age"),
      --   {
      --     vim.fn.expand("~/.local/share/age/key.txt"),
      --   }
      -- )
      --
      -- print(secret_02)
      --
      -- ---------
      -- -- api 03
      -- ---------
      -- local enc = "-----BEGIN AGE ENCRYPTED FILE-----\nYWdlLWVuY3J5cHRpb24ub3JnL3YxCi0+IFgyNTUxOSA0MTJ6eFpNSkJzWWZQOGhp\nK3MzZi9KMDhYY0M4azJmNkhhWVlzbHRKRlI0CnF1a2E4UHdKM3NtWHZmRXpKZ1l2\nRTBnUDdwR3JFK0M0YTR5UFA4bENXUnMKLT4gQ3YhLEtELHgtZ3JlYXNlICtAe0Bl\nCk1KQVZBY3Q0NWhPZHFyQQotLS0gaC9IajVmaVB2Mm9BcHQ4RlFtb2dDV3BXSm1G\nUVlUTnp3bG11VmMxQ2xCbwpnuz8DboqAagJFzdzzH1Rw+CmXqA/bdcXf3vKE3mz8\nNjRbL4GsObbj8IomB27BmA5vew==\n-----END AGE ENCRYPTED FILE-----"
      --
      -- local secret_03 = age.decrypt_from_string(enc)
      --
      -- print(secret_03)


      local transparent = false -- set to true if you would like to enable transparency

      local bg = "#011628"
      local bg_dark = "#011423"
      local bg_highlight = "#143652"
      local bg_search = "#0A64AC"
      local bg_visual = "#275378"
      local fg = "#CBE0F0"
      local fg_dark = "#B4D0E9"
      local fg_gutter = "#627E97"
      local border = "#547998"

      require("tokyonight").setup({
        style = "night",
        transparent = transparent,
        styles = {
          sidebars = transparent and "transparent" or "dark",
          floats = transparent and "transparent" or "dark",
        },
        on_colors = function(colors)
          colors.bg_search = bg_search
        end,
      })

      vim.cmd("colorscheme tokyonight")
    end,
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },
}
