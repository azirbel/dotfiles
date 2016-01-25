" Install all plugins
source ~/.config/nvim/plugins.vim

" Plugin configuration
source ~/.config/nvim/plugin-config.vim

" Remappings
"
" I've remapped a lot of commands. To keep things sane, it's important to
" be able to search through the remappings and check for conflicts.
"
" Label all key remappings like this (note extra "):
"     ""[X-]xx [(Context)]
"     " Description
"
" Where optional X- is C for <ctrl>, or L for <leader>,
" xx is the combination being remapped,
" and (Context) is the filetype where this is enabled.
source ~/.config/nvim/remap-shift.vim
source ~/.config/nvim/remap-ctrl.vim
source ~/.config/nvim/remap-leader.vim
source ~/.config/nvim/remap-other.vim

colorscheme solarized
set background=dark

" TODO(azirbel): Detect python2 on the system and set to that
let g:python_host_prog='/usr/local/bin/python'
