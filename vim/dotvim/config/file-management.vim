" Keeping track of your files and switching between them.
"
" When remapping keys, prefer using CTRL.

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
" Reserved - use for moving windows around

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
" Find file in changed git files using FZF
nnoremap <C-p> :GFiles?<CR>

""C-o
" Find files from git using FZF - include uncommitted files
nnoremap <C-o> :GFiles --cached --others --exclude-standard<CR>

""C-f
" Fuzzy find in files using FZF and Ag
" Use ''<Left> to put the cursor within quotes automatically.
" Use <C-u> to clear any existing commands before running this one.
nnoremap <C-f> :<C-u>Ag 
vnoremap <C-f> :<C-u>Ag 

""minus
" Close tabs with -
" Also closes windows, if this is the last tab
nnoremap <silent> - :WintabsClose<CR>

""underscore
" Close all but the current tab
nnoremap <silent> _ :WintabsOnly<CR>

""L-n
""L-m
" Move wintabs left and right.
nnoremap <silent> <leader>n :WintabsMove -1<CR>
nnoremap <silent> <leader>m :WintabsMove 1<CR>
