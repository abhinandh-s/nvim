return {
 {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
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
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        -- pickers = {}
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
      keymap('n', '<leader>fh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      keymap('n', '<leader>fk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      keymap('n', '<leader>fa', builtin.find_files, { desc = '[S]earch [A]ll Files' })
      keymap('n', '<leader>fc', builtin.colorscheme, { desc = '[S]earch [C]olorscheme' })
      keymap('n', '<leader>ff', builtin.git_files, { desc = '[S]earch Git [F]iles' })
      keymap('n', '<leader>fh', builtin.registers, { desc = '[S]earch vim register [H]istory' })
      keymap('n', '<leader>fs', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      keymap('n', '<leader>fw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      keymap('n', '<leader>fg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      keymap('n', '<leader>fd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      keymap('n', '<leader>fr', builtin.resume, { desc = '[S]earch [R]esume' })
      keymap('n', '<leader>f.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      keymap('n', '<leader><leader>', builtin.git_files, { desc = '[S]earch Git [F]iles' })
      keymap('n', '<leader>sd', builtin.lsp_definitions, { desc = 'Goto the definition' })
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
    end,
  },
}
