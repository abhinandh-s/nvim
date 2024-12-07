return {
  'lewis6991/gitsigns.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('gitsigns').setup {
      signs = {
        add          = { text = '▎' },
        change       = { text = '▎' },
        delete       = { text = '▎' },
        topdelete    = { text = '▎' },
        changedelete = { text = "󱕖" },
      },
      current_line_blame = true, -- Show blame info inline for the current line
    }
    vim.api.nvim_set_hl(0, 'CursorLineNR', { fg = '#a6e3a1', bold = true })
    vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = '#a6e3a1' })
    vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = '#f9e2af' })
    vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = '#f38ba8' })
  end
}
