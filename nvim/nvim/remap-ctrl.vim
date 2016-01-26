" CTRL
" Should be used to switch between windows and manage files

""C-e
" Save buffer
" TODO(azirbel): Autosave on keystroke
nnoremap <C-e> :w<CR>

""C-w
" Close buffer
nnoremap <C-w> :q<CR>

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

""C-t
" Toggle NERDTree
nnoremap <silent> <C-t> :NERDTreeToggle<CR>

""C-r
" Go to current file in NERDTree
nnoremap <C-r> :NERDTreeFind<CR>

""C-x
""C-c
""C-v
" TODO(azirbel): Reserved - use for moving windows around
