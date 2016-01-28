" Keeping track of your files and switching between them.
"
" When remapping keys, prefer using CTRL.

source ~/.config/nvim/config/file-management/favex.vim
source ~/.config/nvim/config/file-management/nerd-tree.vim
source ~/.config/nvim/config/file-management/wintabs.vim

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
nnoremap <silent> <C-t> :NERDTreeToggle<CR><C-w>=

""C-r
" Go to current file in NERDTree
nnoremap <C-r> :NERDTreeFind<CR><C-w>=

""C-y
" Open a tree to find a file.
nnoremap <C-y> :e .<CR>

""C-u
""C-i
" Move backward and forward in the jumplist (list of locations you have been)
nnoremap <C-u> <C-o>
nnoremap <C-i> <C-i>

""plus
" Add a new vertical split window
nnoremap <silent> + :new<CR><C-w>L

""C-z
""C-x
""C-c
" TODO(azirbel): Reserved - use for moving windows around

""left
""right
""up
""down
" Use arrows to adjust window sizes
nnoremap <silent> <Left> :vertical resize -5<CR>
nnoremap <silent> <Down> :resize +5<CR>
nnoremap <silent> <Up> :resize -5<CR>
nnoremap <silent> <Right> :vertical resize +5<CR>

""equals
" Make the windows the same width/height
nnoremap <silent> = <C-w>=

""C-p
" Find file in history using FZF
nnoremap <C-p> :History<CR>

""C-o
" Find files from git using FZF
nnoremap <C-o> :GitFiles<CR>

""C-f
" Fuzzy find in files using FZF and Ag
" TODO(azirbel): Use a sublime-like search. Fuzzy match isn't very useful.
nnoremap <C-f> :Ag<CR>

""minus
" Close tabs with -
" Also closes windows, if this is the last tab
" TODO(azirbel): Organize logically, not by plugin
nnoremap <silent> - :WintabsClose<CR>

""underscore
" Close all but the current tab
nnoremap <silent> _ :WintabsOnly<CR>

""C-v
""C-b
" Move wintabs left and right.
nnoremap <silent> <C-v> :WintabsMove -1<CR>
nnoremap <silent> <C-b> :WintabsMove 1<CR>
