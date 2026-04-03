---@type ColorPalette
local palette = require('colors')
local monet_colors = require('monet.colors')

local highlights = {
  ["CMODE"] = { bg = palette.cherry.red, fg = palette.mocha.text, bold = true },
  ["LEFT"] = { bg = palette.cherry.red, fg = palette.mocha.text },
  ["CFILE"] = { fg = palette.mocha.text, bg = palette.mocha.surface1 },
  ["CLSP"] = { bg = palette.mocha.overlay0, fg = palette.mocha.text },
}

for group, settings in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, settings)
end

local function get_lsp_status()
  local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
  if #buf_clients == 0 then return "" end

  local client_names = {}
  for _, client in ipairs(buf_clients) do
    table.insert(client_names, client.name)
  end
  return "⭘ " .. table.concat(client_names, ", ") .. " "
end

-- Map mode codes to labels
local function get_mode()
  local modes = {
    ['n'] = ' %#CMODE# NORMAL ',
    ['i'] = ' %#CMODE# INSERT ',
    ['v'] = ' %#CMODE# VISUAL ',
    ['V'] = ' %#CMODE# V-LINE ',
    ['c'] = ' %#CMODE# COMMAND ',
    ['R'] = ' %#CMODE# REPLACE ',
  }
  return modes[vim.api.nvim_get_mode().mode] or ' UNKNOWN '
end

local function get_diagnostics()
  -- Fetch counts safely
  local err_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warn_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  local info_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

  -- Create strings only if count > 0
  local errors = err_count > 0 and (" %#DiagnosticError# :" .. err_count .. " ") or ""
  local warnings = warn_count > 0 and (" %#DiagnosticWarn# :" .. warn_count .. " ") or ""
  local info = info_count > 0 and (" %#DiagnosticInfo# :" .. info_count .. " ") or ""

  return errors .. warnings .. info
end

function _G.status_line()
  return table.concat({
    -- LEFT SIDE
    " ", get_mode(),          -- Colored Mode block
    "%#CFILE#", " %f ",       -- Filename with subtle background
    "%##", get_diagnostics(), -- Colored Mode block
    "%#CFILE#", " ",          -- Filename with subtle background

    -- RIGHT SIDE (The %= pushes everything after it to the far right)
    "%=",
    "%#CLSP#", " %y ",            -- Filetype
    "%#CLSP#", get_lsp_status(), -- LSP Name in info color
    "%#LEFT#", " %l:%c ",        -- Line:Column
  })
end

vim.opt.statusline = "%!v:lua.status_line()"
