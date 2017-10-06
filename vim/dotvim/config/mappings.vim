"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Movement (between open files or within a file)
"
" Use CTRL keys for moving between files.
" Use SHIFT keys for moving within a file.

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

""C-u
""C-i
" Move backward and forward in the jumplist (list of locations you have been)
nnoremap <C-u> <C-o>
nnoremap <C-i> <C-i>

""C-z
""C-x
""C-c
" Reserved - use for moving windows around

""H
""J
""K
""L
" Used for faster movement than h/j/k/l.
nnoremap H 5h
nnoremap J 5j
nnoremap K 5k
nnoremap L 5l
vnoremap H 5h
vnoremap J 5j
vnoremap K 5k
vnoremap L 5l

""D
""F
" Fast scrolling up and down in a file.
" Besides being faster, also uses `zz` to keep you centered.
nnoremap D <C-d>zz
nnoremap F <C-u>zz
vnoremap D <C-d>zz
vnoremap F <C-u>zz


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File editing

""u
""U
" Move backward and forward in undo history
nnoremap U <C-r>

""L-j
" Collapse lines
nnoremap <Leader>j J
vnoremap <Leader>j J

""Q
" Quickly record into the "q" macro
nnoremap Q qq

""!
" Quickly replay from the "q" macro
nnoremap ! @q


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language integrations
" TODO(azirbel): Scope these to the appropriate file types.

""L-y
""C-y
" Typescript jumps / helpers
" Note: Prefer jump list to :TsuGoBack
nnoremap <C-y>i :TsuImport<cr>
nnoremap <C-y>f :TsuQuickFix<cr>
nnoremap <C-y><C-y> :TsuGeterr<cr>
nnoremap <leader>y :TsuDefinition<cr>zz
nnoremap <C-y>b :TsuGoBack<cr>
nnoremap <C-y>t :TsuTypeDefinition<cr>zz
nnoremap <C-y>r :TsuReferences<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Team collaboration / git / github

""L-p
" Copy path of current file into current/unnamed copy buffer
" Useful to e.g. grab your filename and paste into chat or your test runner
nnoremap <silent> <leader>p :let @+ = expand("%")<CR>

""L-l
" Put link to current line on github into copy buffer
nnoremap <leader>l V :Gbrowse!<CR>
vnoremap <leader>l :Gbrowse!<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Opening files

""C-p
" Find file in changed git files using FZF
nnoremap <C-p> :GFiles?<CR>

""C-o
" Find files from git using FZF - include uncommitted files
nnoremap <C-o> :GFiles --cached --others --exclude-standard<CR>

"""
" Quote to invoke vinegar file browser
" IMPORTANT: Must go before the remap of `-`, because vinegar maps `-`.
" Use of "nmap" is intentional.
nmap " <Plug>VinegarUp

""C-t
" Toggle NERDTree
nnoremap <silent> <C-t> :NERDTreeToggle<CR><C-w>=

""C-r
" Go to current file in NERDTree
nnoremap <C-r> :NERDTreeFind<CR><C-w>=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search

""C-f
" Fuzzy find in files using FZF and Ag
" Use <C-u> to clear any existing commands before running this one.
nnoremap <C-f> :<C-u>Ag 
vnoremap <C-f> :<C-u>Ag 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Managing windows, opening/closing/saving files

""plus
" Add a new vertical split window
nnoremap <silent> + :new<CR><C-w>L

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

""minus
""hyphen
" Close tabs with -
" Also closes windows, if this is the last tab
" IMPORTANT: Must go after the mapping of VinegarUp
nnoremap <silent> - :WintabsClose<CR>

""underscore
" Close all but the current tab
nnoremap <silent> _ :WintabsOnly<CR>

""L-n
""L-m
" Move wintabs left and right.
nnoremap <silent> <leader>n :WintabsMove -1<CR>
nnoremap <silent> <leader>m :WintabsMove 1<CR>

""'
" Save quickly with '
" Also kills search highlighting. Intended to be an easy mashable button.
nnoremap ' :noh<cr>:w<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Managing vim

""L-w
" Close all windows and exit vim
nnoremap <leader>w :qal<CR>

""L-r
" Redraw the window. Useful when vim gets confused and draws the lines in the
" wrong places for no reason
nnoremap <leader>r :redraw!<CR>
