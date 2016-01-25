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
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

""C-t
" Toggle NERDTree
nnoremap <silent> <C-t> :NERDTreeToggle<CR>

""C-r
" Go to current file in NERDTree
nnoremap <C-r> :NERDTreeFind<CR>
