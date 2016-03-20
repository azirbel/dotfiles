" Closing and opening the editor, sessions, editor maintainance.

" TODO(azirbel): These don't belong here
source ~/.config/nvim/config/editor/autosave.vim
source ~/.config/nvim/config/editor/sessions.vim
source ~/.config/nvim/config/editor/syntastic.vim

" TODO(azirbel): Only settings should go here

colorscheme solarized
set background=dark
set number

" Keep buffers open even when not visible. Very important! This lets us have
" undo history even when closing/reopening files, and lets us implement the
" tabbed-window workflow I like.
set hidden

" Use the system clipboard for vim stuff
" Requires xcopy / pbcopy / pbpaste to be installed
set clipboard+=unnamedplus

" Don't use swap files
" We don't need backup swap files when we have autosave and git.
set noswapfile

set expandtab       " Use spaces instead of tabs
set tabstop=2       " Two-space tabs
set shiftwidth=2    " TODO(azirbel): Needs doc
set softtabstop=2   " Make the spaces editable like tabs

set autoindent      " Copy indent from current line
set ignorecase      " Ignore case in searches, except... (smartcase)
set smartcase       " Be case-sensitive when search contains uppercase letter
set cursorline      " Highlight the current line

set shortmess=atI   " Don’t show the intro message when starting Vim
set scrolloff=5     " Minimum number of lines above/below cursor in a search
set autoread        " Automatically reload files

set undolevels=1000

" Keep undo history in a file so it persists across sessions and doesn't get
" cleared unexpectedly
if has('persistent_undo')
  set undodir=$HOME/.config/nvim/undo
  set undofile
endif

" Use SPACE as the leader key, instead of backslash
let mapleader=" "

""L-w
" Close all windows and exit vim
" TODO(azirbel): Remove this command, use save-session-and-quit instead.
nnoremap <leader>w :qal<CR>

""L-e
" Save a file as root, even if you weren't running vim with sudo
nnoremap <leader>e :w !sudo tee % > /dev/null<CR>

""L-r
" Redraw the window. Useful when vim gets confused and draws the lines in the
" wrong places for no reason
nnoremap <leader>r :redraw!<CR>

""L-p
" Copy path of current file into current/unnamed copy buffer
" Useful to e.g. grab your filename and paste into chat or your test runner
nnoremap <silent> <leader>p :let @+ = expand("%")<CR>

""esc (Terminal)
" Exit terminal mode.
" I don't need to do this very often - usually I just want to switch windows
" with C-h, C-j etc. Sometimes this is useful so I can copy text from the
" terminal window.
tnoremap <esc><esc> <C-\><C-n>

" TODO(azirbel): This should go in a terminal.vim file
function! EnterTerminal()
  terminal

  ""C-h (Terminal)
  ""C-j (Terminal)
  ""C-k (Terminal)
  ""C-l (Terminal)
  " Move to other splits/windows directly from terminal mode
  tnoremap <buffer> <C-h> <C-\><C-n><C-w>h
  tnoremap <buffer> <C-j> <C-\><C-n><C-w>j
  tnoremap <buffer> <C-k> <C-\><C-n><C-w>k
  tnoremap <buffer> <C-l> <C-\><C-n><C-w>l

  ""C-n (Terminal)
  ""C-m (Terminal)
  " Previous and next tab directly from terminal mode
  nnoremap <buffer> <silent> <C-n> :WintabsPrevious<CR>
  nnoremap <buffer> <silent> <C-m> :WintabsNext<CR>
endfunction

" For terminals
" TODO(azirbel): This should go in a terminal.vim file
autocmd BufWinEnter,WinEnter,TermOpen term://* startinsert
autocmd BufLeave,TermClose term://* stopinsert

nnoremap <leader>t :call EnterTerminal()<CR>

""Q
" No-op: Disable ex mode, which is evil
nnoremap Q <nop>

" Make it easy to open vimrc for editing (command :vrc)
ca vrc e ~/projects/dotfiles/nvim/nvim/init.vim

" Reload vimrc from anywhere (command :rl)
ca rl so ~/.config/nvim/init.vim

""L-l
" Put link to current line on github into copy buffer
nnoremap <leader>l V :Gbrowse!<CR>
vnoremap <leader>l :Gbrowse!<CR>

""L-j
" TODO(azirbel): Put this in the right place
nnoremap <leader>j :Goyo<CR>
