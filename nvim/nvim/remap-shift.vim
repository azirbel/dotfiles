" SHIFT
" Should be used for default commands and in-window movement

""Q
" Record in the default register
" Conveniently, this also disables Ex mode, which is evil.
" TODO(azirbel): Test
nnoremap Q @q

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
