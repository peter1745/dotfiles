vim.g.mapleader = " "

local map = vim.keymap.set

-- Editor Bindings
map("n", "<C-t>", "<cmd>tabnew<CR>", { desc = "Open New Tab" })
map("n", "<C-q>", "<cmd>tabclose<CR>", { desc = "Close Current Tab" })
map("n", "<C-A-Right>", "<cmd>tabnext<CR>", { desc = "Next Tab" })
map("n", "<C-A-Left>", "<cmd>tabprevious<CR>", { desc = "Previous Tab" })


-- File Operations
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save File" })

vim.cmd([[ inoremap <expr> <cr> pumvisible() ? '<c-y>' : '<cr>' ]])

