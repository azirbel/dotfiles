" CTRL
" Should be used to switch between windows and manage files

""C-h
""C-j
""C-k
""C-l
" Switch between windows in various directions
" For issues with <C-h>: see https://github.com/neovim/neovim/issues/2048.
" I patched the backspace issue in `install.sh`.
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>

""C-n
""C-m
" Previous and next tab
nnoremap <silent> <C-n> :WintabsPrevious<CR>
nnoremap <silent> <C-m> :WintabsNext<CR>

""C-t
" Toggle NERDTree
nnoremap <silent> <C-t> :NERDTreeToggle<CR>

""C-r
" Go to current file in NERDTree
nnoremap <C-r> :NERDTreeFind<CR>

""C-z
""C-x
""C-c
" TODO(azirbel): Reserved - use for moving windows around
