" Use vim-plug for plugin management.
" https://github.com/junegunn/vim-plug
"
" Plugins in rough order of importance.


" TODO(azirbel): Try https://github.com/shuber/vim-promiscuous
" TODO(azirbel): Use https://github.com/Shougo/neomru.vim again. FZF doesn't
" cut it for history
" TODO(azirbel): Try https://github.com/tommcdo/vim-exchange


" TODO(azirbel): Detect python2 on the system and set to that
" TODO(azirbel): Not sure if we need this anymore.
" TODO(azirbel): Note that I had to `pip install neovim` to get things running
let g:python_host_prog='/usr/local/bin/python'

" Automatically install vim-plug, and all plugins, if vim-plug isn't already
" installed.
" TODO(azirbel): This won't work - I've checked the file into version control,
" so it'll always be here.
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  echom "Installing vim-plug and plugins..."

  " When vim starts, run the install command. Then re-source the vimrc file.
  autocmd VimEnter * PlugInstall | source $MYVIMRC

  echom "Done."
endif

call plug#begin()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fuzzy-file search
"
" WAY faster than Cmd+T and Control-T, and much more powerful. Can search
" files, git files, open buffers, recent files, and much more.
"
" FZF.vim sets up the vim commands and integration. FZF is a dependency.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'jpricey/fzf.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Give each window a set of tabs
"
" In large projects, where do you keep all the files you're working with? I
" use wintabs to add a tab bar to each of my vim windows (splits). For
" example, my left hand pane might have the files I'm working on, each in a
" tab, and the right hand pane might have reference files.
Plug 'zefei/vim-wintabs'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autosave
"
" Since it's so easy to keep track of changes and roll them back with git,
" there's no reason to manually think about saving. This also prevents stupid
" errors.
Plug '907th/vim-auto-save'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tree file browser in the sidebar.
"
" Ideally, should be closed when not needed; prefer window or buffer-based
" file management to tree-based file management.
Plug 'scrooloose/nerdtree'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TAB-completion
"
" I stopped using YCM because it's too slow and lags vim.
" deoplete is built for neovim/async out of the box, so hopefully it will work
" better.
"
" TODO(azirbel): Requires python3 (sudo pip3 install neovim). Document
" somewhere.
" TODO(azirbel): I stopped using this one because it wasn't working.
" Plug 'Shougo/deoplete.nvim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Session management
"
" Save and restore the window layout when opening/closing vim.
"
" vim-misc is a dependency for vim-session.
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'


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
" Highlight trailing whitespace in red
"
" Call :FixWhitespace to fix the errors (operates on the whole file)
Plug 'bronson/vim-trailing-whitespace'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sort CSS properties in "outside-in" order.
" I worked on this plugin with Joe.
Plug 'JPricey/vim-order-css'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintain a list of favorite files
"
" TODO(azirbel): Testing this one out. Some interesting ideas:
" - Closing all files in a window shouldn't affect favorites
" - It should be easier to edit the favorites list
" - FZF should search the favorites list
Plug 'vim-scripts/FavEx'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search and replace over a visual range
"
" TODO(azirbel): Testing this one out.
Plug 'osyo-manga/vim-over'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" TODO(azirbel): Testing this one out.
Plug 'michaeljsmith/vim-indent-object'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" TODO(azirbel): Testing this one out.
"
" webapi-vim is a dependency for gist-vim.
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" TODO(azirbel): Testing this one out.
Plug 'junegunn/goyo.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" TODO(azirbel): Testing this one out.
Plug 'reedes/vim-pencil'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" TODO(azirbel): Testing this one out.
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-markdown'
Plug 'JPricey/vim-slim'
Plug 'digitaltoad/vim-jade'
Plug 'tpope/vim-git'
Plug 'vim-ruby/vim-ruby'
Plug 'mustache/vim-mustache-handlebars'


" Add plugins to &runtimepath
call plug#end()
