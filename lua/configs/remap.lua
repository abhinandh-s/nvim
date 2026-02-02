local keymap = vim.keymap.set;

keymap("n", "j", "gj", { desc = "better navigation for wrapped lines" })
keymap("n", "k", "gk", { desc = "better navigation for wrapped lines" })
keymap("v", "j", ":m '>+1<CR>gv=gv", { desc = "move selected item up and down" })
keymap("v", "k", ":m '<-2<CR>gv=gv", { desc = "move selected item up and down" })
keymap("x", "<leader>p", "\"_dp", { desc = "paste without losing" } )
keymap("n", "Q", "<nop>", { desc = "" })
keymap('n', '<leader>y', ':t.<CR>', { desc = "Duplicate line" })
keymap('n', '<leader>r', ':e!<CR>', { desc = "Reload file" })
keymap('n', '<leader>ih', ':nohlsearch<CR>', { desc = "Clear highlights" })
keymap('n', '<leader>wr', ':%s/\\<<C-r><C-w>\\>//gI<Left><Left><Left>', { desc = "Replace current word" })
keymap('n', '<leader>j', 'mzJ`z', { desc = "Join lines without moving the cursor" })
keymap('n', '<leader>ot', ':split | terminal<CR>', { desc = "Open terminal" })
keymap('n', '<leader>d', '"_d', { desc = "Delete without copying" })
keymap('v', '<leader>d', '"_d', { desc = "Delete selection without copying" })


-- Switch two characters (transpose)
vim.keymap.set('n', 'gx', 'xp', { desc = "Transpose characters" })

-- Uppercase a word
vim.keymap.set('n', '<leader>U', 'viwU<Esc>', { desc = "Uppercase current word" })

-- Lowercase a word
vim.keymap.set('n', '<leader>u', 'viwu<Esc>', { desc = "Lowercase current word" })

-- Surround a word with quotes (requires vim-surround or nvim-surround)
vim.keymap.set('n', '<leader>"', 'viw<esc>a"<esc>bi"<esc>lel', { desc = "Surround word with quotes" })

-- Change word under cursor (stay in normal mode)
vim.keymap.set('n', 'cw', '"_ciw', { desc = "Change word under cursor without yanking" })

-- window management
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })     -- split window vertically
keymap("n", "<leader><CR>", "<C-w>v", { desc = "Split window vertically" })     -- split window vertically
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })   -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })      -- make split windows equal width & height
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Move between windows easily
keymap('n', '<S-h>', '<C-w>h', { desc = "Move to left window" })
keymap('n', '<C-l>', '<C-w>l', { desc = "Move to right window" })
keymap('n', '<C-j>', '<C-w>j', { desc = "Move to lower window" })
keymap('n', '<C-k>', '<C-w>k', { desc = "Move to upper window" })

-- Resize splits
keymap('n', '<A-h>', ':vertical resize -2<CR>', { desc = "Resize split left" })
keymap('n', '<A-l>', ':vertical resize +2<CR>', { desc = "Resize split right" })
keymap('n', '<A-j>', ':resize -2<CR>', { desc = "Resize split down" })
keymap('n', '<A-k>', ':resize +2<CR>', { desc = "Resize split up" })

-- Quickly switch buffers
keymap('n', '<Tab>', ':bnext<CR>', { desc = "Next buffer" })
keymap('n', '<S-Tab>', ':bprevious<CR>', { desc = "Previous buffer" })

keymap("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })                     -- open new tab
keymap("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })              -- close current tab
keymap("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })                     --  go to next tab
keymap("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })                 --  go to previous tab
keymap("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab


keymap('n', '<leader>nhl', ':nohlsearch<CR>', { desc = "no highlight search" })
