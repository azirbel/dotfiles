" LEADER
" Should be used for invoking plugins and heavyweight commands.
" The leader key is SPACE.

let mapleader=" "

""L-w
" Close all windows and exit vim
nnoremap <leader>w :qal<CR>

""L-e
" Save a file as root, even if you weren't running vim with sudo
nnoremap <leader>e :w !sudo tee % > /dev/null<CR>

""L-r
" Redraw the window. Useful when vim gets confused and draws the lines in the
" wrong places for no reason
nnoremap <leader>r :redraw!<CR>

""L-p
" Copy path of current file into current/unnamed copy buffer
" Useful to e.g. grab your filename and paste into chat or your test runner
nnoremap <silent> <leader>f :let @+ = expand("%")<CR>
