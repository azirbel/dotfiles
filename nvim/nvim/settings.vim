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
set shiftwidth=2
set softtabstop=2   " Make the spaces editable like tabs

set autoindent      " Copy indent from current line
set smartcase       " Be case-sensitive when search contains uppercase letter
set cursorline      " Highlight the current line

set shortmess=atI   " Don’t show the intro message when starting Vim
set scrolloff=5     " Minimum number of lines above/below cursor in a search
set autoread        " Automatically reload files
