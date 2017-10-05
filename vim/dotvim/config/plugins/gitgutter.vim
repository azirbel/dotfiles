" Don't let GitGutter make any keymappings, I don't want them
let g:gitgutter_map_keys = 0

" Turn GitGutter off by default
let g:gitgutter_enabled = 0

""L-g
" Toggle GitGutter
" TODO(azirbel): This isn't working
nnoremap <leader>g :GitGutterToggle
