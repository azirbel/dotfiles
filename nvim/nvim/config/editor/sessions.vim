" Vim-Session
let g:session_autosave = 'no'
let g:session_autoload = 'no'
let g:session_directory = '~/.config/nvim/sessions'

""L-s
" Save session
" TODO(azirbel): Save to branchname
nnoremap <silent> <leader>s :SaveSession<CR>

""L-o
" Open session
" TODO(azirbel): Open from branchname
" TODO(azirbel): Keybinding doesn't work
nnoremap <silent> <leader>o :OpenSession<CR>
