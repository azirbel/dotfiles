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


" Vim-Markdown

" Disable folding for vim-markdown so everything is displayed
let g:vim_markdown_folding_disabled=1
