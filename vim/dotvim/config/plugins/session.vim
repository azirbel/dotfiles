" Only save the current tab in the session
"set sessionoptions-=tabpages

" Autoload default session when opening vim
let g:session_autoload = 'yes'

" Autosave every 1 minute
let g:session_autosave_periodic = 1

" Autosave on exit
let g:session_autosave = 'yes'

" Alias so "SessionSave" == "SaveSession"
let g:session_command_aliases = 1

" Don't show message during autosave
"let g:session_autosave_silent = 1
