" TODO(azirbel): Relative paths - how?

" Install plugins first
source ~/.config/nvim/config/plugins.vim

" A vanilla config
"TODO(azirbel): Replace with tpope/vim-sensible and refactor
source ~/.config/nvim/config/editor.vim
source ~/.config/nvim/config/editor/sessions.vim
source ~/.config/nvim/config/file-management/wintabs.vim

""C-n
""C-m
" Previous and next tab
nnoremap <silent> <C-n> :WintabsPrevious<CR>
nnoremap <silent> <C-m> :WintabsNext<CR>

" Shaw a warning when we are in pair mode
function PairingTabLine()
  return 'PAIR MODE'
endfunction

set showtabline=2
set tabline=%!PairingTabLine()

hi TabLineFill ctermfg=White ctermbg=DarkRed
