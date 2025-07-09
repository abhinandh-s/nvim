local M = {}

local function global_on_attach()
  vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = 'lsp go to definition' })
  vim.keymap.set("n", "A", vim.lsp.buf.hover, { desc = 'lsp hover documentation' })
  vim.keymap.set("n", "<leader>ci", vim.lsp.buf.implementation, { desc = 'lsp implementation' })
  vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = 'lsp rename symbol' })
  vim.keymap.set("n", "<leader>cc", vim.lsp.buf.code_action, { desc = 'code action' })
  vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = 'Format buffer' })
  vim.keymap.set("n", "<leader>ch", vim.lsp.buf.signature_help, { desc = 'Signature help' })
end

M.global = {
  on_attach = global_on_attach()
}

return M
