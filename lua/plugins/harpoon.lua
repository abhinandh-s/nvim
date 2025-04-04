return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require('harpoon')
    harpoon:setup({})

    -- basic telescope configuration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end

    vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })


    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Open harpoon window" })
    vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = "toggle harpoon quick_menu window" })
    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Open harpoon window 1" })
    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Open harpoon window 2" })
    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Open harpoon window 3" })
    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Open harpoon window 4" })
    vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, { desc = "Open harpoon window 5" })
    vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end, { desc = "Open harpoon window 6" })
    vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end, { desc = "Open harpoon window 7" })
    vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end, { desc = "Open harpoon window 8" })
    vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end, { desc = "Open harpoon window 9" })
    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end, { desc = "Open harpoon window" })
    vim.keymap.set("n", "<leader><tab>", function() harpoon:list():next() end, { desc = "Open harpoon window" })
  end

}
