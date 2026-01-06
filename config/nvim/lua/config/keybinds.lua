vim.g.mapleader = " "

local map = vim.keymap.set

-- Editor Bindings
map({ "n", "i" }, "<C-t>",       "<cmd>tabnew<CR>",      { desc = "Open New Tab" })
map({ "n", "i" }, "<C-q>",       "<cmd>tabclose<CR>",    { desc = "Close Current Tab" })
map({ "n", "i" }, "<C-A-Right>", "<cmd>tabnext<CR>",     { desc = "Next Tab" })
map({ "n", "i" }, "<C-A-Left>",  "<cmd>tabprevious<CR>", { desc = "Previous Tab" })

map({ "n", "i" }, "<C-b>", "<cmd>make<CR>",         { desc = "Build Project" })
map({ "n", "i" }, "<F12>", vim.lsp.buf.definition,  { desc = "Go to Definition" })
map({ "n", "i" }, "<F2>",  vim.lsp.buf.rename,      { desc = "Rename Symbol" })

-- Handle Split Navigation
map("n", "<A-Up>",    "<C-w>k<CR>", { desc = "Move to split up" })
map("n", "<A-Right>", "<C-w>l<CR>", { desc = "Move to split right" })
map("n", "<A-Left>",  "<C-w>h<CR>", { desc = "Move to split left" })
map("n", "<A-Down>",  "<C-w>j<CR>", { desc = "Move to split below" })
map("i", "<A-Up>",    "<Esc><C-w>k<Insert>", { desc = "Move to split up" })
map("i", "<A-Right>", "<Esc><C-w>l<Insert>", { desc = "Move to split right" })
map("i", "<A-Left>",  "<Esc><C-w>h<Insert>", { desc = "Move to split left" })
map("i", "<A-Down>",  "<Esc><C-w>j<Insert>", { desc = "Move to split below" })

-- Telescope Bindings
local telescope = require("telescope.builtin")
map("n", "<C-o>", function()
    telescope.find_files({
        modifiable = true
    })    
end, { desc = "Find Files" })
map("n", "<C-m>", telescope.man_pages, { desc = "Find Files" })
map("n", "<A-m>", telescope.lsp_document_symbols, { desc = "List Symbols" })

local use_live_grep = false

if use_live_grep then
    map("n", "<C-g>", telescope.live_grep, { desc = "Find in Files" })
else
    map("n", "<C-g>", function()
        local input = vim.fn.input("Search in Files: ")

        if input ~= "" then
            telescope.grep_string({ search = input })
        end
    end, { desc = "Grep in Files" })
end

-- File Operations
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save File" })

vim.cmd([[ inoremap <expr> <cr> pumvisible() ? '<c-y>' : '<cr>' ]])

