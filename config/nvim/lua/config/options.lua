vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmatch = true                    -- Highlight matching brackets
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.wrap = false                        -- Don't wrap lines when they go off-screen
vim.opt.autowrite = true                    -- Save buffers when running e.g :make
vim.opt.incsearch = true                    -- Highlight search matches as you type
vim.opt.switchbuf = "useopen,usetab,newtab" -- Use existing tab / file for showing e.g compile errors
vim.opt.scrolloff = 16;                     -- Ensures there are at least 16 lines above and below the caret (keeps it more centered)
vim.opt.splitright = true

-- Ensure we treat .h files as C files and not C++ files (otherwise treesitter will be upset)
vim.cmd([[
    let g:c_syntax_for_h=1
    autocmd BufNewFile,BufRead *.h setlocal filetype=c
]])

