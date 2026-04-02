return {
 {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function() -- -- `cond` is a condition used to determine whether this plugin should be installed and loaded.
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons'},
    },
    config = function()
      require('telescope').setup {
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local keymap = vim.keymap.set;
      local builtin = require 'telescope.builtin'

      -- General Search
      keymap('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
      keymap('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
      keymap('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })
      keymap('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
      keymap('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
      keymap('n', '<leader>fr', builtin.registers, { desc = '[F]ind [R]egisters' })
     keymap('n', '<leader>fc', builtin.colorscheme, { desc = '[S]earch [C]olorscheme' })

      -- LSP specific
      keymap('n', '<leader>sd', builtin.lsp_definitions, { desc = '[S]earch [D]efinition' })
      keymap('n', '<leader>sr', builtin.lsp_references, { desc = '[S]earch [R]eferences' })
      keymap('n', '<leader>si', builtin.lsp_implementations, { desc = '[S]earch [I]mplementations' })
      -- Lists all branches with log preview,
      -- checkout action <cr>,
      -- track action <C-t>,
      -- rebase action<C-r>,
      -- create action <C-a>,
      -- switch action <C-s>, 
      -- delete action <C-d> and
      -- merge action <C-y>
      keymap('n', '<leader>sgb', builtin.git_branches, { desc = 'checkout action <cr>, merge action <C-y>' })
      keymap('n', '<leader>sgs', builtin.git_status, { desc = 'Lists current changes per file with diff preview and add action.' })
      keymap('n', '<leader>sgt', builtin.git_stash, { desc = 'Lists stash items in current repository with ability to apply them on [<cr>]' })
      keymap('n', '<leader>si', builtin.lsp_incoming_calls, { desc = 'Lists LSP incoming calls for word under the cursor' })
      keymap('n', '<leader>sm', builtin.man_pages, { desc = 'Lists manpage entries, opens them in a help window on <cr>' })
      keymap('n', '<leader>so', builtin.lsp_outgoing_calls, { desc = 'Lists LSP outgoing calls for word under the cursor' })
      keymap('n', '<leader>sr', builtin.lsp_references, { desc = 'Lists LSP references for word under the cursor' })
      keymap('n', '<leader>st', builtin.lsp_type_definitions, { desc = 'Goto the type definition' })
      keymap('n', '<leader>si', builtin.lsp_implementations, { desc = 'Goto the implementation ' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>f/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>fn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>fb', function()
        builtin.find_files { cwd = '/home/abhi/docs/capture' }
      end, { desc = '[S]earch [D]ocuments capture dir' })
    end,
  },
}
