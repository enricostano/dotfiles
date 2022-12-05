execute pathogen#infect()

set t_Co=256
set tabstop=2       " Number of spaces that a <Tab> in the file counts for.
set shiftwidth=2    " Number of spaces to use for each step of (auto)indent.
set expandtab
set autoindent      " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).
set ruler           " Show the line and column number of the cursor position,
                    " separated by a comma.
set mouse=a         " Enable the use of the mouse.
set incsearch       " While typing a search command, show immediately where the
                    " so far typed pattern matches.
set number          " Show line numbers.
set cursorline      " highlight current line
set noerrorbells    " shut up the beep
set wildmenu
set nocompatible
set laststatus=2
set statusline=%<\ %t\ %m%r%y%w%=Col:\ \%c\ Lin:\ \%l\/\%L\
set shell=/bin/bash
set hlsearch

filetype on
filetype plugin indent on     " required!

syntax on

colorscheme Tomorrow-Night

let mapleader = ","
" use F5 to get rid of trailing spaces
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>
" Disable arrow keys
map <up>    <nop>
map <down>  <nop>
map <left>  <nop>
map <right> <nop>
" Moving between buffers
noremap <C-J>     <C-W>j
noremap <C-K>     <C-W>k
noremap <C-H>     <C-W>h
noremap <C-L>     <C-W>l

" NERDTree
let NERDTreeWinPos = "left"      " left
let NERDTreeMouseMode = 3        " single click
let NERDTreeMinimalUI = 1        " without ? nor bookmarks

" Minibuffer Explorer Settings
let g:miniBufExplorerMoreThanOne = 1   " Open only when having more than one buffer
let g:miniBufExplUseSingleClick = 1    " Use single click
let g:miniBufExplCheckDupeBufs = 0     " Disable duplicated names feature
let g:miniBufExplShowBufNumbers = 1    " Omit buffer number
let g:miniBufExplModSelTarget = 1

" vim-ctrlp
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0

if has("autocmd")
 " Restore cursor position
 autocmd BufReadPost *
       \ if line("'\"") > 1 && line("'\"") <= line("$") |
       \ exe "normal! g`\"" |
       \ endif
endif

" set swap and backup directories outside your working directory
" the double slash path at the end allows you to avoid collisions
" opening files with the same name in different directories
set backupdir=~/.vim/tmpdir//,.
set directory=~/.vim/tmpdir//,.

" Old copy/paste
" vmap <C-c> :<Esc>`>a<CR><Esc>mx`<i<CR><Esc>my'xk$v'y!xclip -selection c<CR>u
" map <Insert> :set paste<CR>i<CR><CR><Esc>k:.!xclip -o<CR>JxkJx:set nopaste<CR>

function! DevenvTransform(cmd) abort
  return 'ssh ubuntu@local.redbooth.com '.shellescape('cd teambox-hosted; '.a:cmd)
endfunction

let g:test#strategy = "neoterm"
let g:test#custom_transformations = {'devenv': function('DevenvTransform')}
let g:test#transformation = 'devenv'

let python_host_prog = "/usr/bin/python2"
let python3_host_prog = "/usr/bin/python3"

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black'],
\}
