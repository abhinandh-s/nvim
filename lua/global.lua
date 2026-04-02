local M = {}

local function global_on_attach(_, bufnr)

  local nmap = function(keys, func, desc)
    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
  end

  local maps = {
    ['A'] = { vim.lsp.buf.hover, 'hover documentation' },
    ['<leader>cd'] = { vim.lsp.buf.definition, ' Go to Definition' },
    ['<leader>ci'] = { vim.lsp.buf.implementation, 'Implementation' },
    ['<leader>cr'] = { vim.lsp.buf.rename, 'Rename symbol' },
    ['<leader>cc'] = { vim.lsp.buf.code_action, 'Code action' },
    ['<leader>cf'] = { vim.lsp.buf.format, 'Format buffer' },
    ['<leader>ch'] = { vim.lsp.buf.signature_help, 'Signature help' },

    ['<leader>cR'] = { vim.lsp.buf.references, 'LSP: Go to References' },
    ['<leader>cD'] = { vim.lsp.buf.declaration, 'LSP: Go to Declaration' },
    ['<leader>ct'] = { vim.lsp.buf.type_definition, 'LSP: Type Definition' },
    ['[d'] = { vim.diagnostic.goto_prev, 'Go to previous diagnostic' },
    [']d'] = { vim.diagnostic.goto_next, 'Go to next diagnostic' },
    ['<leader>ce'] = { vim.diagnostic.open_float, 'Show line diagnostics' },
  }

  for key, value in pairs(maps) do
    nmap(key, value[1], value[2])
  end

end

M.global = {
  on_attach = global_on_attach
}


-- cond = function() -- -- `cond` is a condition used to determine whether this plugin should be installed and loaded.
--  return vim.fn.executable 'make' == 1
-- end,

-- ref: https://stackoverflow.com/questions/1340230/check-if-directory-exists-in-lua
--
-- Check if a file or directory exists in this path
local function dir_exists(path)
  local ok, _, code = os.rename(path, path)
  if not ok then
    if code == 13 then
      -- permission denied, but it exists
      return true
    end
    return false
  end
  return true
end


M.dir_exists = dir_exists

return M
