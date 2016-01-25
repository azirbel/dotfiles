" Use vim-plug for plugin management.
" https://github.com/junegunn/vim-plug


" Automatically install vim-plug, and all plugins, if vim-plug isn't already
" installed.
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  echom "Installing vim-plug and plugins..."

  " TODO(azirbel): Don't do this. The file's already here. We need a different
  " install trigger.
  " Grab plug.vim to manage plugins
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  " When vim starts, run the install command. Then re-source the vimrc file.
  autocmd VimEnter * PlugInstall | source $MYVIMRC

  echom "Done."
endif


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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Add plugins to &runtimepath
call plug#end()
