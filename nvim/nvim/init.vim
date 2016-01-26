" Install all plugins
source ~/.config/nvim/plugins.vim

" Plugin configuration
source ~/.config/nvim/plugin-config.vim

" Configure vim itself
source ~/.config/nvim/settings.vim

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

" TODO(azirbel): Detect python2 on the system and set to that
" TODO(azirbel): Not sure if we need this anymore
let g:python_host_prog='/usr/local/bin/python'

" Terminal mappings
""esc (Terminal): Exit terminal mode
tnoremap <Esc> <C-\><C-n>

" Make it easy to open vimrc for editing (command :vrc)
ca vrc e ~/projects/dotfiles/nvim/nvim/init.vim

" Reload vimrc from anywhere (command :rl)
ca rl so ~/.config/nvim/init.vim

iab teh the
iab baord board
iab dashbaord dashboard
iab todo TODO(azirbel):

if argc() == 0
  autocmd VimEnter * NERDTree
  autocmd VimLeave * NERDTreeClose
end
