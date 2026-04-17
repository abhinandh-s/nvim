vim.pack.add({
  'https://github.com/folke/todo-comments.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',
})

-- Initialize Todo Comments
local todo_comments = require("todo-comments")

todo_comments.setup({
  signs = false, -- As per your request
})

-- Keymaps
local keymap = vim.keymap

-- Jump between TODOs
keymap.set("n", "tn", function()
  todo_comments.jump_next()
end, { desc = "Next todo comment" })

keymap.set("n", "tp", function()
  todo_comments.jump_prev()
end, { desc = "Previous todo comment" })

-- Search TODOs via Telescope
keymap.set("n", "<leader>z", "<cmd>TodoTelescope<cr>", { desc = "Todo Telescope" })

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  callback = function()
    require("todo-comments").setup({ signs = false })
    -- Move your keymaps here if you only want them available after a file opens
  end,
})

vim.pack.add({
  'https://github.com/folke/trouble.nvim',
})

require("trouble").setup({
  modes = {
    symbols = {
      desc = "document symbols",
      mode = "lsp_document_symbols", -- Use this exact name
      focus = true,
      win = { 
        position = "right", 
        width = 35 
      },
      filter = {
        -- This removes noisy "Package" entries in Lua files
        ["not"] = { ft = "lua", kind = "Package" },
        any = {
          -- all symbol kinds for help / markdown files
          ft = { "help", "markdown" },
          -- default set of symbol kinds to show
          kind = {
            "Class", "Constructor", "Enum", "Field", "Function", 
            "Interface", "Method", "Module", "Namespace", 
            "Package", "Property", "Struct", "Trait",
          },
        },
      },
    },
  },
})

-- Keymaps
local map = vim.keymap.set

map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>cs", "<cmd>Trouble symbols toggle<cr>", { desc = "Symbols (Trouble)" })
map("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP Definitions / references / ... (Trouble)" })
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

