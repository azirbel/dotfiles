""left
""right
""up
""down
" Use arrows to adjust window sizes
nnoremap <silent> <Left> :vertical resize -5<CR>
nnoremap <silent> <Down> :resize +5<CR>
nnoremap <silent> <Up> :resize -5<CR>
nnoremap <silent> <Right> :vertical resize +5<CR>

""esc-esc
" Stop highlighting results after a search
nnoremap <silent> <Esc><Esc> :noh<cr>

""plus
" Add a new vertical split window
nnoremap <silent> + :new<CR><C-w>L
