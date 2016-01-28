" Use vim-plug for plugin management.
" https://github.com/junegunn/vim-plug
call plug#begin()

" Tree file browser.
"
" Ideally, should be opened/closed when needed. Prefer window or
" buffer-based file management to tree-based file management.
Plug 'scrooloose/nerdtree'

" TAB-completion.
"
" --tern-completer installs TypeScript and JS support.
" Node and NPM must be installed first.
" TODO(azirbel): Do that install automatically.
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

" Fuzzy-file search
" WAY faster than Cmd+T and Control-T, and much more powerful. Can search
" files, git files, open buffers, recent files, and much more.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Auto-save
Plug '907th/vim-auto-save'

" Git commands. The one I use most is :Gblame
Plug 'tpope/vim-fugitive'

" Highlight trailing whitespace in red.
" Call :FixWhitespace to fix it (operates on the whole file)
Plug 'bronson/vim-trailing-whitespace'

" Shows git plus/minus signs in the gutter so you can see changes.
" I turn this off by default and toggle it on/off. See plugin-config.vim.
Plug 'airblade/vim-gitgutter'

" TODO(azirbel): Doc
Plug 'zefei/vim-wintabs'

" TODO(azirbel): Doc
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" TODO(azirbel): Doc
Plug 'tpope/vim-surround'

" TODO(azirbel): Doc
Plug 'vim-scripts/FavEx'

" TODO(azirbel): Doc
Plug 'scrooloose/syntastic'

" TODO(azirbel): Doc
Plug 'osyo-manga/vim-over'

" Syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'groenewege/vim-less'
Plug 'plasticboy/vim-markdown'
Plug 'slim-template/vim-slim'
Plug 'digitaltoad/vim-jade'

" Add plugins to &runtimepath
call plug#end()
