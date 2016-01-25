" IMPORTANT:
" I've remapped a lot of commands. To keep things sane, it's important to
" be able to search through the remappings and check for conflicts.
"
" Label all key remappings like this (note extra "):
"     ""[X-]xx
"     " Description
"
" Where X is C = ctrl, L = leader
" And xx is the combination being remapped.


" Install all plugins
source ~/.config/nvim/plugins.vim

" Plugin configuration
source ~/.config/nvim/plugin-config.vim

" Remappings
source ~/.config/nvim/remap-shift.vim
source ~/.config/nvim/remap-ctrl.vim
source ~/.config/nvim/remap-leader.vim
source ~/.config/nvim/remap-other.vim

colorscheme solarized
set background=dark
