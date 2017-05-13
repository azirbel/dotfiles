" TODO(azirbel): Determine if I want active or passive mode
let g:syntastic_mode_map = {
    \ "mode": "passive",
    \ "active_filetypes": [],
    \ "passive_filetypes": [] }
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_check_on_open = 1
" Hide the error list (location-list) by default. You can show it with :Error
let g:syntastic_auto_loc_list = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_style_error_symbol = "✗"
let g:syntastic_warning_symbol = "✗"
let g:syntastic_style_warning_symbol = "✗"
