vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmatch = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.wrap = false
vim.autowrite = true

-- Ensure we treat .h files as C files and not C++ files (otherwise treesitter will be upset)
vim.cmd([[
    let g:c_syntax_for_h=1
    autocmd BufNewFile,BufRead *.h setlocal filetype=c
]])

