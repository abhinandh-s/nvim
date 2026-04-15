vim.pack.add({
 'https://github.com/nvim-neo-tree/neo-tree.nvim',
-- dependencies
 'https://github.com/nvim-lua/plenary.nvim',
 'https://github.com/MunifTanjim/nui.nvim',
-- optional dependencies
 'https://github.com/nvim-tree/nvim-web-devicons',
})

require('neo-tree').setup({
  enable_git_status = true,
  enable_diagnostics = false, -- Disabling diagnostics inside the tree speeds it up significantly
  filesystem = {
    -- This prevents Neo-tree from searching the whole disk for a .git folder
    bind_to_cwd = false, 
    follow_current_file = { enabled = true },
    use_libuv_file_watcher = true, -- Faster file system updates
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
})

-- Toggle Neo-tree with backslash
-- 'reveal' ensures it opens to your current file immediately
vim.keymap.set('n', '\\', '<cmd>Neotree toggle reveal<cr>', { 
    desc = 'Toggle Neo-tree',
    nowait = true -- This helps skip the timeout delay
})
