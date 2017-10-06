" Use vim-plug for plugin management.
" https://github.com/junegunn/vim-plug
"
" Plugins in rough order of importance.

" TODO(azirbel): Detect python2 on the system and set to that
" TODO(azirbel): Not sure if we need this anymore.
" TODO(azirbel): Note that I had to `pip install neovim` to get things running
let g:python_host_prog='/usr/local/bin/python'

call plug#begin()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fuzzy-file search
"
" WAY faster than Cmd+T and Control-T, and much more powerful. Can search
" files, git files, open buffers, recent files, and much more.
"
" FZF.vim sets up the vim commands and integration. FZF is a dependency.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Give each window a set of tabs
"
" In large projects, where do you keep all the files you're working with? I
" use wintabs to add a tab bar to each of my vim windows (splits). For
" example, my left hand pane might have the files I'm working on, each in a
" tab, and the right hand pane might have reference files.
Plug 'zefei/vim-wintabs'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File pickers
"
" Prefer vinegar (netrw-style picker) when possible - it displays within the
" current window and gets out of the way once it's not needed.
"
" NERDTree is still useful when you do need that high-level overview of files;
" are working with a small project; or need to rename files.
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git commands
"
" A huge library of useful git integration. The commands I use most are
" :Gblame (to show line-by-line blame info in a sidebar) and
" :Gread (to checkout the file I'm on and discard my changes).
Plug 'tpope/vim-fugitive'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Edit characters surrounding a word
"
" For example, change 'word' to "word", or thing to <p>thing</p>, without
" jumping to the front and end of the word as you do it.
Plug 'tpope/vim-surround'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make `.` repeating work with plugin commands, like vim-surround.
Plug 'tpope/vim-repeat'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search and replace over a visual range
Plug 'osyo-manga/vim-over'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Session management
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session', { 'on': ['SaveSession', 'OpenSession'] }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Defines a new text object representing lines of code at the same indent level
Plug 'michaeljsmith/vim-indent-object'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easily create gists with :Gist
" webapi-vim is a dependency for gist-vim.
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ruby on Rails integration
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails', { 'for': ['ruby'] }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Typescript integration
Plug 'Quramy/tsuquyomi'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sort CSS properties in "outside-in" order using :OrderCSS
" I worked on this plugin with Joe (Joe did the hard parts).
"
" Might be better to replace this with e.g. CSS Comb.
Plug 'JPricey/vim-order-css'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search for the highlighted text.
Plug 'JPricey/vim-v-star'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight trailing whitespace in red
"
" Call :FixWhitespace to fix the errors (operates on the whole file)
Plug 'bronson/vim-trailing-whitespace'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Type HTML faster
Plug 'mattn/emmet-vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-markdown'
Plug 'slim-template/vim-slim'
Plug 'digitaltoad/vim-jade'
Plug 'tpope/vim-git'
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby'] }
Plug 'mustache/vim-mustache-handlebars'
Plug 'leafgarland/typescript-vim'


" Add plugins to &runtimepath
call plug#end()
