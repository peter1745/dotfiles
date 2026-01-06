vim.g.mapleader = " "

local map = vim.keymap.set

-- Editor Bindings
map("n", "<C-t>", "<cmd>tabnew<CR>", { desc = "Open New Tab" })
map("n", "<C-q>", "<cmd>tabclose<CR>", { desc = "Close Current Tab" })
map("n", "<C-A-Right>", "<cmd>tabnext<CR>", { desc = "Next Tab" })
map("n", "<C-A-Left>", "<cmd>tabprevious<CR>", { desc = "Previous Tab" })

map({ "n", "i" }, "<C-b>", "<cmd>make<CR>", { desc = "Build Project" })

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

