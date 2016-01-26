" NERDTree
" Default commands:
""C-j (NERDTree): Jump to next sibling
""C-k (NERDTree): Jump to previous sibling
""p (NERDTree): Jump to parent
""o (NERDTree): Open node
""O (NERDTree): Recursively open node
""r (NERDTree): Refresh node
""R (NERDTree): Refresh root node

" Basically, disable these because I don't need them and they conflict with my
" remappings
" Jumping to first/last child isn't useful because we have `gg` and `G`
let NERDTreeMapJumpFirstChild='\K'
let NERDTreeMapJumpLastChild='\J'

" Lets you toggle showing files vs just directories - useless
let NERDTreeMapToggleFiles='\F'

" I don't use bookmarks
let NERDTreeMapDeleteBookmark='\D'

" I like ~ and don't want to trample over `m`
let NERDTreeMapMenu='~'


" FZF
""C-o
" Find file in history
nnoremap <C-o> :History<CR>

""C-i
" Find files from git
" TODO(azirbel): Use https://github.com/junegunn/fzf.vim/issues/47
nnoremap <C-i> :GitFiles<CR>

""C-f
" Find in files
" TODO(azirbel): Use a sublime-like search
nnoremap <C-f> :Ag<CR>


" Autosave
" Enable AutoSave on Vim startup
let g:auto_save = 1

" Do not save while in insert mode
let g:auto_save_in_insert_mode = 0

" Do not display the auto-save notification
let g:auto_save_silent = 1


" GitGutter

" Don't let GitGutter make any keymappings, I don't want them
let g:gitgutter_map_keys = 0

" Turn GitGutter off by default
let g:gitgutter_enabled = 0

""L-g
" Toggle GitGutter
" TODO(azirbel): This isn't working
nnoremap <leader>g :GitGutterToggle


" WinTabs
let g:wintabs_display = 'statusline'
let g:wintabs_ui_sep_inbetween = ' '
let g:wintabs_ui_sep_rightmost = ' '
let g:wintabs_ui_active_left = '('
let g:wintabs_ui_active_right = ')'

" Always autoclose a window if it has no more tabs
let g:wintabs_autoclose = 2

""minus
" Close tabs with -
" Also closes windows, if this is the last tab
" TODO(azirbel): Organize logically, not by plugin
nnoremap <silent> - :WintabsClose<CR>

""underscore
" Close all but the current tab
nnoremap <silent> _ :WintabsOnly<CR>

""C-v
""C-b
" Move wintabs left and right.
nnoremap <silent> <C-v> :WintabsMove -1<CR>
nnoremap <silent> <C-b> :WintabsMove 1<CR>


" Vim-Markdown

" Disable folding for vim-markdown so everything is displayed
let g:vim_markdown_folding_disabled = 1


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
" TODO(azirbel): Save to branchname
" TODO(azirbel): Doesn't work
nnoremap <silent> <leader>o :OpenSession<CR>
