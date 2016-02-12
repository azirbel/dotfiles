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

" TODO(azirbel): Relative paths - how?

" Install plugins first
source ~/.config/nvim/config/plugins.vim

" Everything else
source ~/.config/nvim/config/abbreviations.vim
source ~/.config/nvim/config/editor.vim
source ~/.config/nvim/config/file-editing.vim
source ~/.config/nvim/config/file-management.vim

" Use deoplete.
let g:deoplete#enable_at_startup = 1
