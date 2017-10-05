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

""C-q
""Q
" Faster macro recording and replay at the cost of only using one register for
" it. Uses the q register by default.
" TODO(azirbel): Working on this
"nnoremap <C-q> :g/\(<c-r>/\)/ normal @q
"nno-remap Q *``Nqqn

" Combine lines, since I remapped J.
" Also, I prefer to be on the line which should be moved up, rather than the
" line which stays in place.
" TODO(azirbel): Testing this out
"nnoremap <BS> k^<S-j>

":FormatJSON
command! FormatJSON %!python -m json.tool

""L-j
""L-k
" Intelligently expand/collapse blocks
nnoremap <Leader>j :SplitjoinJoin<cr>
nnoremap <Leader>k :SplitjoinSplit<cr>

""C-y
nnoremap <C-y>* :TsuDefinition<cr>
nnoremap <C-y><S-n> :TsuquyomiGoBack<cr>
nnoremap <C-y>i :TsuImport<cr>
nnoremap <C-y>t :TsuquyomiTypeDefinition<cr>
nnoremap <C-y>f :TsuquyomiQuickFix<cr>
nnoremap <C-y><C-y> :TsuquyomiGeterr

""L-j
" Collapse lines, fallback for splitjoin.vim above
vnoremap <Leader>j J
