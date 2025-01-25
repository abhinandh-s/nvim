-- lua/custom/plugins/mini.lua
return {
  {
    'echasnovski/mini.nvim',
    enabled = true,
    config = function()

      local function lsp_clients_section()
        -- Get the current buffer number
        local bufnr = vim.api.nvim_get_current_buf()

        -- Use the filter to get clients attached to the current buffer
        local clients = vim.lsp.get_clients({ buffer = bufnr })
        local client_names = {}

        -- Collect client names
        for _, client in ipairs(clients) do
          table.insert(client_names, client.name)
        end

        -- Return a formatted string or an empty string if no clients are active
        if #client_names == 0 then
          return '' -- No LSP clients, return empty string
        end

        return '  ' .. table.concat(client_names, ', ')
      end

      require('mini.statusline').setup({
        content = {
          active = function()
            local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
            local git = MiniStatusline.section_git({ trunc_width = 40 })
            local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
            local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
            local filename = MiniStatusline.section_filename({ trunc_width = 140 })
            local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
            local location = MiniStatusline.section_location({ trunc_width = 75 })
             local custom_lsp = lsp_clients_section() -- Custom LSP client names section


            return MiniStatusline.combine_groups({
              { hl = mode_hl,                 strings = { mode } },
              { hl = 'MiniStatuslineDevinfo', strings = { git, diagnostics, lsp, custom_lsp } },
              '%<', -- Mark general truncate point
              { hl = 'MiniStatuslineFilename', strings = { filename } },
              '%=', -- End left alignment
              { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
              { hl = mode_hl,                  strings = { location } },
            })
          end,
          inactive = function()
            local filename = MiniStatusline.section_filename({ trunc_width = 80 })
            return MiniStatusline.combine_groups({
              { hl = 'MiniStatuslineFilename', strings = { filename } },
            })
          end,
        },
        use_icons = true,
        set_vim_settings = true,
      })
    end,
  },
}
