
vim.pack.add({
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
  'https://github.com/nvim-telescope/telescope-ui-select.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
})

local telescope = require('telescope')
local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

telescope.setup({
  extensions = {
    ['ui-select'] = {
      themes.get_dropdown(),
    },
  },
})

-- Load extensions (pcall prevents errors if the fzf 'make' hasn't been run yet)
pcall(telescope.load_extension, 'fzf')
pcall(telescope.load_extension, 'ui-select')

-- Keymaps
local map = vim.keymap.set

-- General Search
map('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
map('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
map('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })
map('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
map('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
map('n', '<leader>fc', builtin.colorscheme, { desc = '[S]earch [C]olorscheme' })

-- LSP / Git / Advanced
map('n', '<leader>sd', builtin.lsp_definitions, { desc = '[S]earch [D]efinition' })
map('n', '<leader>sr', builtin.lsp_references, { desc = '[S]earch [R]eferences' })
map('n', '<leader>sgb', builtin.git_branches, { desc = 'Git Branches' })
map('n', '<leader>sgs', builtin.git_status, { desc = 'Git Status' })

-- Fuzzy find in current buffer
map('n', '<leader>/', function()
  builtin.current_buffer_fuzzy_find(themes.get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

-- Search Neovim Config
map('n', '<leader>fn', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })

-- Search Documents capture (Your specific path)
map('n', '<leader>fD', function()
  builtin.find_files { cwd = '/home/abhi/docs/capture' }
end, { desc = '[S]earch [D]ocuments capture dir' })

vim.pack.add({
  'https://github.com/brenoprata10/nvim-highlight-colors',
})

require("nvim-highlight-colors").setup {
  ---@usage 'background'|'foreground'|'virtual'
  render = 'background',
  virtual_symbol = '■',
  virtual_symbol_prefix = '',
  virtual_symbol_suffix = ' ',
  virtual_symbol_position = 'inline',

  enable_hex = true,
  enable_short_hex = true,
  enable_rgb = true,
  enable_hsl = true,
  enable_var_usage = true, -- Highlight CSS variables, e.g. 'var(--testing-color)'
    enable_named_colors = false,
    enable_tailwind = false,

    custom_colors = {
      { label = '%-%-theme%-primary%-color',   color = '#0f1219' },
      { label = '%-%-theme%-secondary%-color', color = '#5a5d64' },
    },

    exclude_filetypes = { 'markdown', 'neorg' },
    exclude_buftypes = {}
  }
 

