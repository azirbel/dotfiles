" Set grep program to be ag instead
"set grepprg=ag\ --nogroup\ --nocolor

" From http://learnvimscriptthehardway.stevelosh.com/chapters/34.html
" via https://github.com/JPricey
" nnoremap <silent> <C-f> :set operatorfunc=<SID>AgMovementOperator<cr>g@
" vnoremap <silent> <C-f> :<c-u>call <SID>AgMovementOperator(visualmode())<cr>

function! s:AgMovementOperator(type)
 let unnamed_cache = @@

 if a:type ==# 'v'
   execute "normal! `<v`>y"
 elseif a:type ==# 'char'
   execute "normal! `[v`]y"
 else
   return
 endif

 silent execute "grep -F " . shellescape(@@) . " ."
 let @@ = unnamed_cache
endfunction
