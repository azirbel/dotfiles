" Vim-Session
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_directory = '~/.config/nvim/sessions'
let g:session_autosave_periodic = 1
let g:session_autosave_silent = 1
let g:session_persist_colors = 0
let g:session_lock_enabled = 0

" TODO: Take remappings out of this plugin-config file
""L-s
" Save session
" TODO(azirbel): Save to branchname
nnoremap <silent> <leader>s :SaveSession<CR>

""L-o
" Open session
" TODO(azirbel): Open from branchname
" TODO(azirbel): Keybinding doesn't work
nnoremap <silent> <leader>o :OpenSession<CR>
