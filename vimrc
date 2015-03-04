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
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
" NeoBundle 'pangloss/vim-javascript'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-surround'
" NeoBundle 'bling/vim-airline'
" NeoBundle 'justinmk/vim-sneak'
NeoBundle 'https://github.com/mattn/emmet-vim/'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'wellle/targets.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'groenewege/vim-less'
NeoBundle 'plasticboy/vim-markdown'
call neobundle#end()

" Required by NeoBundle
filetype plugin indent on

" Enable file type detection
filetype on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Make it easy to open vimrc for editing (command :vrc)
ca vrc e ~/.vim/vimrc
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

" General principle: CTRL keys operate on current file, SHIFT keys
" move between files or invoke commands. CTRL keys also run helper commands
" (searches, NERD Tree, etc), and SHIFT often have default vim uses.

" LEADER is SPACE
let mapleader=" "

" Colon is for marks
nnoremap ; m

" m and M are for moving backward/forward in edit history
nnoremap m <C-o>
nnoremap M <C-i>

" u and U are for moving backward/forward in undo history
nnoremap <S-u> <C-r>

" Insert single character with s
function! RepeatChar(char, count)
  return repeat(a:char, a:count)
endfunction
nnoremap <silent> s :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>

" Adjust buffer sizes with arrow keys
nnoremap <Left> :vertical resize -5<CR>
nnoremap <Down> :resize +5<CR>
nnoremap <Up> :resize -5<CR>
nnoremap <Right> :vertical resize +5<CR>

" Switch windows with SHIFT + hjkl. Auto maximize
" when switching between horizontal splits.
nnoremap <S-h> <C-W>h
nnoremap <S-j> <C-W>j
nnoremap <S-k> <C-W>k
nnoremap <S-l> <C-W>l

" Easy moving up/down faster with CTRL
nnoremap <C-d> <C-d>zz
nnoremap <C-f> <C-u>zz
vnoremap <C-d> <C-d>zz
vnoremap <C-f> <C-u>zz

" TODO(azirbel): I think there is an easier command to map in both normal
" and visual modes but can't look it up now
nnoremap <C-h> 5h
nnoremap <C-j> 5j
nnoremap <C-k> 5k
nnoremap <C-l> 5l
vnoremap <C-h> 5h
vnoremap <C-j> 5j
vnoremap <C-k> 5k
vnoremap <C-l> 5l

" TODO(azirbel): Disabled tabs for now. Figure out later if I want them.

" Save and close. I use W for close because I use it in Chrome/OSX.
nnoremap <S-e> :w<CR>
nnoremap <S-w> :q<CR><C-w><C-p><C-w>_

" In case vertical maximization gets messed up
nnoremap _ <C-w>_

" Add another vertical split
nnoremap + :sp<CR><C-w>L

" Add another horizontal split
nnoremap = :new<CR><C-w>_

" Save a file as root
nnoremap <leader>e :w !sudo tee % > /dev/null<CR>

" After a search, SPACE+SPACE to stop highlighting results
nnoremap <silent> <leader><space> :noh<cr>

" Close vim with <leader> w
nnoremap <leader>w :qal<CR>

"==============================================================================
" PLUGIN MAPPINGS
"==============================================================================

" NERDTree and NERDTreeTabs
" Go straight to NERD tree
nnoremap <silent> <C-t> :NERDTreeFocus<CR>
" Open file in NERDTree
map <C-r> :NERDTreeTabsFind<CR>

map <C-n> :NERDTreeTabsToggle<CR>

nnoremap <silent> <leader>a :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>s :call WindowSwap#DoWindowSwap()<CR>

" Explict setting of command t functions
nnoremap <silent> <leader>t :CommandT<CR>
nnoremap <silent> <leader>b :CommandTBuffer<CR>

nnoremap <leader>f :call MyGitGrepPrompt()<CR>
nnoremap <leader>g :call MyGitGrepWord()<CR>

" Extension to MyGitGrep: open from quickfix and return to quickfix menu
nnoremap <leader>d <CR><C-w>p

" Unite find in files, open in current window
nnoremap <C-p> :<C-u>Unite -no-split -winheight=500 -buffer-name=files -start-insert file_rec/git:--cached:--others:--exclude-standard<CR>
" Unite MRU, open in current window
nnoremap <C-o> :<C-u>Unite -no-split -winheight=500 -buffer-name=file_mru file_mru<CR>

" Unite commands but open in split window
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

let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
      \ '-S --nocolor --nogroup --hidden --ignore ''.git'''
let g:unite_source_grep_recursive_opt = ''

" TODO(azirbel): Don't use unite for search - just use git grep & quickfix
"nnoremap <C-g> :<C-u>Unite -direction=bot -buffer-name=grep grep:.<CR>

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

" TODO(azirbel): "Cut/copy" buffers into different windows.

" Abbreviations
iab teh the
iab ie import Ember from 'ember';
iab ece Ember.Controller.extend({<CR> <CR><BS>});<Up>
iab ere Ember.Route.extend({<CR> <CR><BS>});<Up>
iab eoc Ember.Object.create({<CR> <CR><BS>});<Up>
iab cp function() {<CR> <CR><BS>}.property()<Up>
iab cpp function() {<CR> <CR><BS>}.property(),<Up>
iab ecp Ember.computed(function() {<CR> <CR><BS>}).property()<Up>
iab ecpp Ember.computed(function() {<CR> <CR><BS>}).property(),<Up>
" TODO: remap backspace in normal mode?
