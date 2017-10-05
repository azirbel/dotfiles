" Moving around within a file and editing efficiently.
"
" When remapping keys, prefer using SHIFT.

""esc-esc
" Stop highlighting results after a search
nnoremap <silent> <Esc><Esc> :noh<cr>

""H
""J
""K
""L
" Used for faster movement than h/j/k/l.
" TODO(azirbel): I think there is an easier command to map in both normal
" and visual modes but can't look it up now
nnoremap H 5h
nnoremap J 5j
nnoremap K 5k
nnoremap L 5l
vnoremap H 5h
vnoremap J 5j
vnoremap K 5k
vnoremap L 5l

""D
""F
" Fast scrolling up and down in a file.
" Besides being faster, also uses `zz` to keep you centered.
nnoremap D <C-d>zz
nnoremap F <C-u>zz
vnoremap D <C-d>zz
vnoremap F <C-u>zz

""u
""U
" Move backward and forward in undo history
nnoremap U <C-r>

":FormatJSON
command! FormatJSON %!python -m json.tool

""C-y
nnoremap <C-y>* :TsuDefinition<cr>
nnoremap <C-y><S-n> :TsuquyomiGoBack<cr>
nnoremap <C-y>i :TsuImport<cr>
nnoremap <C-y>t :TsuquyomiTypeDefinition<cr>
nnoremap <C-y>f :TsuquyomiQuickFix<cr>
nnoremap <C-y><C-y> :TsuquyomiGeterr

""L-j
" Collapse lines
vnoremap <Leader>j J

""'
" Save quickly with '
nnoremap ' :w<cr>
