return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = { signs = false },
  config = function()
    vim.keymap.set("n", "<leader>z", "<cmd>TodoTelescope<cr>", { desc = "Todo Telescope" })
    local todo_comments = require("todo-comments")
    local keymap = vim.keymap   -- for conciseness
    keymap.set("n", "tn", function()
      todo_comments.jump_next()
    end, { desc = "Next todo comment" })
    keymap.set("n", "tp", function()
      todo_comments.jump_prev()
    end, { desc = "Previous todo comment" })
    todo_comments.setup()
  end,
}
