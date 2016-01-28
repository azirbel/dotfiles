" Use vim-plug for plugin management.
" https://github.com/junegunn/vim-plug
"
" Plugins in rough order of importance.
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
" --tern-completer installs TypeScript and JS support.
" Node and NPM must be installed first.
" TODO(azirbel): Do that install automatically.
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }


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
" Syntax checker
"
" Check syntax as you write, rather than when you run/compile.
Plug 'scrooloose/syntastic'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Edit characters surrounding a word
"
" For example, change 'word' to "word", or thing to <p>thing</p>, without
" jumping to the front and end of the word as you do it.
Plug 'tpope/vim-surround'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight trailing whitespace in red
"
" Call :FixWhitespace to fix the errors (operates on the whole file)
Plug 'bronson/vim-trailing-whitespace'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line-by-line git status
"
" Shows git plus/minus signs in the gutter so you can see where changes have
" been made.
Plug 'airblade/vim-gitgutter'


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
" Syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'groenewege/vim-less'
Plug 'plasticboy/vim-markdown'
Plug 'slim-template/vim-slim'
Plug 'digitaltoad/vim-jade'


" Add plugins to &runtimepath
call plug#end()
