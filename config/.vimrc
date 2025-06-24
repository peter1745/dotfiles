runtime defaults.vim
runtime mswin.vim

set tabstop=4
set shiftwidth=4
set expandtab

" Relative Line number
set relativenumber
set rnu

" Tab Navigation
nnoremap <S-Tab> :tabprevious<CR>
nnoremap <Tab>   :tabnext<CR>
nnoremap <C-t>   :tabnew<CR>
nnoremap <C-w>   :tabclose<CR>
nnoremap <C-S-w> :tabclose!<CR>
