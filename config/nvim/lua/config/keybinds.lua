vim.g.mapleader = " "

local map = vim.keymap.set

-- Editor Operations


-- File Operations
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save File" })

vim.cmd([[ inoremap <expr> <cr> pumvisible() ? '<c-y>' : '<cr>' ]])

