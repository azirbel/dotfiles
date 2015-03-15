"==============================================================================
" MAIN SETTINGS
"==============================================================================
set nocompatible
if !1 | finish | endif " Skip NeoBundleinitialization for vim-tiny or vim-small

if has('vim_starting')
 set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-surround'
NeoBundle 'mustache/vim-mustache-handlebars'
" NeoBundle 'bling/vim-airline'
" NeoBundle 'justinmk/vim-sneak'
NeoBundle 'https://github.com/mattn/emmet-vim/'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'wellle/targets.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'groenewege/vim-less'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
call neobundle#end()

" Required by NeoBundle
filetype plugin indent on

" Enable file type detection
filetype on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Make it easy to open vimrc for editing (command :vrc)
ca vrc e ~/projects/personal/dotfiles/vimrc
" Reload vimrc from anywhere (command :rl)
ca rl so ~/.vimrc

syntax on
colorscheme solarized
set background=dark
set t_Co=256        " Enable color schemes with 256 colors

set autoindent      " Copy indent from current line
set ic              " Ignore case in searches
set showmatch       " Show matches in searches
set hlsearch        " Highlight searches
set smartcase       " Be case-sensitive when search contains uppercase letter
set incsearch       " Highlight dynamically as pattern is typed
set expandtab       " Use spaces instead of tabs
set tabstop=2       " Two-space tabs
set shiftwidth=2
set softtabstop=2   " Make the spaces editable like tabs
set number          " Enable line numbers
set cursorline      " Highlight the current line
set nobackup        " Don't constantly write backup files
set noswapfile      " Don't use swap files
set notimeout
set wildmenu        " Enhance command-line completion
set ttyfast         " Optimize for fast terminal connections
set encoding=utf-8  " Use UTF-8
set secure
set laststatus=2    " Always show status line
set mouse=a         " Enable mouse in all modes
set noerrorbells    " Disable error bells
set nostartofline   " Don’t reset cursor to start of line when moving around.
set shortmess=atI   " Don’t show the intro message when starting Vim
set noshowmode      " Don't show the current mode
set title           " Show the filename in the window titlebar
set showcmd         " Show the (partial) command as it’s being typed
set scrolloff=5     " Minimum number of lines above/below cursor in a search
set autoread        " Automatically reload files
set wmh=0           " Set window min height to 0
set hidden          " Keep files in background to preserve undo history

set backspace=indent,eol,start    " Fix broken backspace

set clipboard=unnamed " Use the OS clipboard by default
set backupdir=~/.vim/backups  " Centralize backups, swapfiles and undo history
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Ex mode is evil
nnoremap Q <nop>

" Keep python comments from being autoindented.
:inoremap # X#

" Automatic commands
" Treat .json files as .js
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript

" Automatically maximize vertically when opening a new buffer
autocmd BufWinEnter,BufEnter * execute "normal! \<C-w>_"

" Doesn't expand tabs for makefiles
autocmd FileType make setlocal noexpandtab

"==============================================================================
" PLUGIN CONFIGURATION
"==============================================================================

let g:syntastic_javascript_checkers = ['jshint']  " sets jshint as our javascript linter

" Always focus the cursor on the file
let g:nerdtree_tabs_focus_on_files=1

" Basically, disable these because they conflict with my custom stuff
let NERDTreeMapJumpFirstChild='\K'
let NERDTreeMapJumpLastChild='\J'
let NERDTreeMapToggleFiles='\F'
let NERDTreeMapDeleteBookmark='\D'
let NERDTreeMapJumpNextSibling='\A'
let NERDTreeMapJumpPrevSibling='\B'
let NERDTreeMapMenu='~'

" Hack git grep to run my own command instead, which must be at this
" location in ~/.vim (Ideally, revise this later). My version of git grep
" reformats the output so that Quickfix can easily jump to files.
let g:gitgrepprg="~/.vim/scripts/grep.sh"
function! MyGitGrep(args)
  let grepprg_bak=&grepprg
  exec "set grepprg=" . g:gitgrepprg
  execute "silent! grep! " . a:args 
  bel copen
  let &grepprg=grepprg_bak
  let @/=a:args
  exec "redraw!"
endfunction
function! MyGitGrepPrompt()
  let grepstring = input('> ')
  if grepstring ==# ''
    return
  endif
  call MyGitGrep(grepstring)
endfunction
function! MyGitGrepWord()
  normal! "zyiw
  call MyGitGrep(getreg('z'))
endf

" Quickfix is used only for git grep. Change the settings so that j/k jump
" between files in the list (skipping the file contents preview) and h/l
" scroll left and right (because I hate line wrapping in search results)
autocmd FileType qf call s:my_git_grep_settings()
function! s:my_git_grep_settings()
  setlocal nowrap
  nnoremap <silent> <buffer> h 10zh
  nnoremap <silent> <buffer> l 10zl

  " Crawl through the pipes
  nnoremap <silent> <buffer> j :call CrawlDown()<CR>zz
  nnoremap <silent> <buffer> k :call CrawlUp()<CR>zz
  nnoremap <silent> <buffer> <C-j> :call CrawlDown()<CR>zz
  nnoremap <silent> <buffer> <C-k> :call CrawlUp()<CR>zz

  " Normal switch windows
  nnoremap <silent> <buffer> <S-h> <C-w>h
  nnoremap <silent> <buffer> <S-j> <C-w>j
  nnoremap <silent> <buffer> <S-k> <C-w>k
  nnoremap <silent> <buffer> <S-l> <C-w>l

  nnoremap <silent> <buffer> <CR> :new<CR><C-w>j<CR>
endfunction

" Move down as long as the first character is a pipe
function! CrawlDown()
  execute "normal! j"
  while getline('.')[0] ==# '|'
    " End of file
    if line('$') ==# line('.')
      break
    endif
    execute "normal! j"
  endwhile
endfunction

" Move up as long as the first character is a pipe
function! CrawlUp()
  execute "normal! k"
  while getline('.')[0] ==# '|'
    " End of file
    if 0 ==# line('.')
      break
    endif
    execute "normal! k"
  endwhile
endfunction

" Window swap
let g:windowswap_map_keys = 0 "prevent default bindings

" Disable folding for vim-markdown so everything is displayed
let g:vim_markdown_folding_disabled=1

" Automatic session management per-git-repo
function! FindProjectName()
  let s:name = getcwd()
  if !isdirectory(".git")
    let s:name = substitute(finddir(".git", ".;"), "/.git", "", "")
  end
  if s:name != ""
    let s:name = matchstr(s:name, ".*", strridx(s:name, "/") + 1)
  end
  return s:name
endfunction

" Sessions only restored if we start Vim without args.
function! RestoreSession(name)
  if a:name != ""
    if filereadable($HOME . "/.vim/sessions/" . a:name)
      execute 'source ' . $HOME . "/.vim/sessions/" . a:name
    end
  end
endfunction

" Save and open sessions with :SaveSession and :OpenSession.
" Disable prompting before save.
:let g:session_autosave = 'no'

" Sessions only saved if we start Vim without args.
function! SaveSession(name)
  if a:name != ""
    execute 'mksession! ' . $HOME . '/.vim/sessions/' . a:name
  end
endfunction

if argc() == 0
  autocmd VimEnter * NERDTree
  autocmd VimLeave * NERDTreeClose
end

" Use fuzzy matcher for unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])

" Better sort order in unite results
call unite#filters#sorter_default#use(['sorter_rank'])

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)

  " TODO(azirbel): Test
  " imap <silent><buffer><expr> <C-f>     unite#do_action('split')
endfunction

"==============================================================================
" GENERAL REMAPPINGS
"==============================================================================

" CTRL keys are for moving between, opening, and finding files
" SHIFT keys operate on the current file
" LEADER keys do special behaviors and uncommon commands

" LEADER is SPACE
let mapleader=" "

" <;> is for marks
" <'> then goes to marks
nnoremap ; m

" <C-n> and <C-m> move backward/forward in edit history
nnoremap <C-n> <C-o>
nnoremap <C-m> <C-i>

" <u> and <U> are for moving backward/forward in undo history
nnoremap U <C-r>

" <s> inserts a single character under the cursor
function! RepeatChar(char, count)
  return repeat(a:char, a:count)
endfunction
nnoremap <silent> s :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>

" <left>, <right>, <up>, <down> adjust window sizes
nnoremap <silent> <Left> :vertical resize -5<CR>
nnoremap <silent> <Down> :resize +5<CR>
nnoremap <silent> <Up> :resize -5<CR>
nnoremap <silent> <Right> :vertical resize +5<CR>

" <C-h>, <C-j>, <C-k>, <C-l> switch between windows.
" Auto maximize when switching between horizontal splits.
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" <D>, <F> for scrolling up/down
nnoremap D <C-d>zz
nnoremap F <C-u>zz
vnoremap D <C-d>zz
vnoremap F <C-u>zz

" <H>, <J>, <K>, <L> for faster movement
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

" <C-e> and <C-w> for save and close.
" I use W for close because I use it in Chrome/OSX.
nnoremap <C-e> :w<CR>
nnoremap <C-w> :q<CR><C-w><C-p><C-w>_

" <_> to restore vertical maximization
nnoremap _ <C-w>_

" <+> to add another vertical split
nnoremap + :sp<CR><C-w>L

" <=> to add another horizontal split
nnoremap = :new<CR><C-w>_

" <L-e> to save a file as root
nnoremap <leader>e :w !sudo tee % > /dev/null<CR>

" <esc><esc> to stop highlighting results after a search
nnoremap <silent> <Esc><Esc> :noh<cr>

" <L-w> to close vim
nnoremap <leader>w :qal<CR>

"==============================================================================
" PLUGIN MAPPINGS
"==============================================================================

" NERDTree and NERDTreeTabs
" <C-t> to toggle NERDTree
nnoremap <silent> <C-t> :NERDTreeToggle<CR>
" <C-r> to open file in NERDTree
nnoremap <C-r> :NERDTreeFind<CR>

" <L-a> and <L-s> to swap windows. TODO(azirbel): doesn't work well
nnoremap <silent> <leader>a :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>s :call WindowSwap#DoWindowSwap()<CR>

" <C-f> and <C-d> for find-in-project
nnoremap <C-f> :call MyGitGrepPrompt()<CR>
" nnoremap <C-d> :call MyGitGrepWord()<CR>

" <L-d> extension to MyGitGrep: open from quickfix and return to quickfix menu
" TODO(azirbel): Consider removing
nnoremap <leader>d <CR><C-w>p

" <C-p> unite find in files, open in current window
nnoremap <C-p> :<C-u>Unite -no-split -winheight=500 -buffer-name=files -start-insert file_rec/git:--cached:--others:--exclude-standard<CR>
" <C-o> unite MRU, open in current window
nnoremap <C-o> :<C-u>Unite -no-split -winheight=500 -buffer-name=file_mru file_mru<CR>

" <L-p>, <L-o> unite commands but open in split window
nnoremap <leader>p :<C-u>Unite -direction=abo -winheight=500 -buffer-name=files -start-insert file_rec/git:--cached:--others:--exclude-standard<CR>
nnoremap <leader>o :<C-u>Unite -direction=abo -winheight=500 -buffer-name=file_mru file_mru<CR>

"==============================================================================
" WIP
"==============================================================================

" Strip trailing whitespace on all lines in the file
function! StripWhitespace()
	let save_cursor = getpos('.')
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
nnoremap <leader>s :call StripWhitespace()<CR>

" Crazy way to run python code from vim
function! TestPy() range
    let startline = line("'<")
    let endline = line("'>")
    echo "vim-start:".startline . " vim-endline:".endline
python << EOF
import vim
s = "I was set in python"
vim.command("let sInVim = '%s'"% s)
start = vim.eval("startline")
end = vim.eval("endline")
print "start, end in python:%s,%s"% (start, end)
EOF
    echo sInVim
endfunction

" <BS> to delete the current line and move up a line
nnoremap <BS> ddk

" TODO(azirbel): "Cut/copy" buffers into different windows.

" Abbreviations
" TODO(azirbel): Put ember abbreviations in a separate file
iab teh the
iab todo TODO(azirbel):
iab ie import Ember from 'ember';
iab ece Ember.Controller.extend({<CR><BS>});<Up><End>
iab ere Ember.Route.extend({<CR><BS>});<Up><End>
iab eoc Ember.Object.create({<CR><BS>});<Up><End>
iab cp function() {<CR><BS>}.property()<Up><End>
iab cpp function() {<CR><BS>}.property(),<Up><End>
iab ecp Ember.computed(function() {<CR><BS>}).property()<Up><End>
iab ecpp Ember.computed(function() {<CR><BS>}).property(),<Up><End>
iab ob function() {<CR><BS>}.observes()<Up><End>
iab obb function() {<CR><BS>}.observes(),<Up><End>
iab eob Ember.observer(function() {<CR><BS>}).observes()<Up><End>
iab eobb Ember.observer(function() {<CR><BS>}).observes(),<Up><End>

function! VisualFindAndReplace()
  :OverCommandLine%s/
endfunction
function! VisualFindAndReplaceWithSelection() range
  :'<,'>OverCommandLine s/
endfunction

" <L-n>, <L-m> call visual find and replace
" TODO(azirbel): doesn't work well right now due to highlighting
nnoremap <Leader>n :call VisualFindAndReplace()<CR>
xnoremap <Leader>m :call VisualFindAndReplaceWithSelection()<CR>

" Use CTRL to navigate MRU list
autocmd FileType unite call s:my_mru_settings()
function! s:my_mru_settings()
  nnoremap <buffer> <C-j> j
  nnoremap <buffer> <C-k> k
endfunction
