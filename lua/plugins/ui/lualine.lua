return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local lualine = require("lualine")
      local lazy_status = require("lazy.status")
      local colors = {
        blue = "#b4befe",
        green = "#a7c080",
        pink = "#d699b6",
        pink_moon = "#393552",
        violet = "#cba6f7",
        yellow = "#dbbc7f",
        red = "#e67e80",
        fg = "#cdd6f4",
        bg = "#26233a",
        inactive_bg = "#2c3043",
      }

      local my_lualine_theme = {
        normal = {
          a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        insert = {
          a = { bg = colors.pink, fg = colors.bg, gui = "bold" },
          b = { bg = colors.pink_moon, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        visual = {
          a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        command = {
          a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        replace = {
          a = { bg = colors.red, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        inactive = {
          a = { bg = colors.inactive_bg, fg = colors.fg, gui = "bold" },
          b = { bg = colors.inactive_bg, fg = colors.fg },
          c = { bg = colors.inactive_bg, fg = colors.fg },
        },
      }

      -- LSP status function with lightning symbol
      local function lsp_status()
        local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
        if next(clients) == nil then
          return "  No LSP"
        end
        local msg = " "
        for _, client in ipairs(clients) do
          if #msg > 1 then
            msg = msg .. " "
          end
          msg = msg .. client.name
        end
        return msg
      end

      -- configure lualine with modified theme
      lualine.setup({
        options = {
          component_separators = '',
          section_separators = '',
          theme = my_lualine_theme,
        },
        sections = {
          lualine_x = {
            {
              lazy_status.updates,
              cond = lazy_status.has_updates,
              color = { fg = "#f38ba8" },
            },
            { "encoding" },
            { "fileformat" },
            { "filetype" },
            { lsp_status }, -- Adding LSP status to lualine_x
          },
        },
      })
    end,
  }
}
