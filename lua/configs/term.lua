vim.api.nvim_create_autocmd('TermOpen', {
  desc = '',
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true}),
  callback = function ()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end
})

vim.keymap.set("n", "<space>tt", function ()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 15)
end)

-- Keymap to toggle terminal (e.g., Ctrl-t)
vim.api.nvim_set_keymap(
  'n', -- Normal mode
  '<A-z>', -- Key combination
  '<cmd>lua Snacks.terminal()<CR>', -- Lua command to call the function
  { noremap = true, silent = true } -- Keymap options
)

-- Keymap to toggle terminal in terminal mode
vim.api.nvim_set_keymap(
  't', -- Terminal mode
  '<A-z>', -- Key combination
  '<C-\\><C-n><cmd>lua Snacks.terminal()<CR>', -- Escape to normal mode, then call the function
  { noremap = true, silent = true } -- Keymap options
)

-- Keymap to toggle terminal (e.g., Ctrl-t)
vim.api.nvim_set_keymap(
  'n', -- Normal mode
  '<C-t>', -- Key combination
  '<cmd>lua Snacks.terminal()<CR>', -- Lua command to call the function
  { noremap = true, silent = true } -- Keymap options
)

-- Keymap to toggle terminal in terminal mode
vim.api.nvim_set_keymap(
  't', -- Terminal mode
  '<C-t>', -- Key combination
  '<C-\\><C-n><cmd>lua Snacks.terminal()<CR>', -- Escape to normal mode, then call the function
  { noremap = true, silent = true } -- Keymap options
)
