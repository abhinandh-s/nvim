return {
  {
    dir = "/home/abhi/git/moon-knight-vim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
    end
  },
  {
    dir = "/home/abhi/git/monet.nvim",
    lazy = false,    -- We want to load this immediately
    priority = 1000, -- High priority to load before other plugins
    config = function()
      vim.cmd("colorscheme monet")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd [[colorscheme tokyonight-night]]
    end
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
    config = function()
      vim.keymap.set("n", "<leader>z", "<cmd>TodoTelescope<cr>", { desc = "Todo Telescope" })
      local todo_comments = require("todo-comments")
      local keymap = vim.keymap -- for conciseness
      keymap.set("n", "tn", function()
        todo_comments.jump_next()
      end, { desc = "Next todo comment" })
      keymap.set("n", "tp", function()
        todo_comments.jump_prev()
      end, { desc = "Previous todo comment" })
      todo_comments.setup()
    end,
  },
}
