filetype off
filetype indent plugin off

" Print the line number in front of each line.
set number

" The value of this option influences when the last window will have a
"   status line:
"       0: never
"       1: only if there are at least two windows
"       2: always
set laststatus=2

" Number of screen lines to use for the command-line.
set cmdheight=2

" When a bracket is inserted, briefly jump to the matching one.
set showmatch

" Tenths of a second to show the matching paren, when 'showmatch' is set.
set matchtime=3

" Minimal initial height of the help window when it is opened with the 
" ":help" command.
set helpheight=999

" Same as :print, but display unprintable characters
" with '^' and put $ after the line.
set list
" Strings to use in 'list' mode and for the |:list| command.
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:<

" number of colors
set t_Co=256

" Enable backspace in the insert mode.
set backspace=indent,eol,start

" Allow specified keys that move the cursor left/right to move to the
" previous/next line when the cursor is on the first/last character in the line.
set whichwrap=b,s,h,l,

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=4

" The minimal number of screen columns to keep to the left and to the
" right of the cursor if 'nowrap' is set.
set sidescrolloff=16

" If you want to always use ":confirm", set the 'confirm' option.
set confirm

" When on a buffer becomes hidden when it is |abandon|ed.
set hidden

" When a file has been detected to have been changed outside of Vim 
" and it has not been changed inside of Vim, automatically read it again.
set autoread

" Not make a backup before overwriting a file.
set nobackup

" If you want to open a new buffer without creating a swap file for it,
" use the |:noswapfile| modifier.
set noswapfile

""" Settings of search
" When there is a previous search pattern, highlight all its matches.
set hlsearch

" While typing a search command, show where the pattern,
" as it was typed so far, matches.
set incsearch

" If the 'ignorecase' option is on, the case of normal letters is ignored.
set ignorecase

" Override the 'ignorecase' option if the search pattern contains
" upper case characters.
set smartcase

" Searches wrap around the end of the file.
set wrapscan

" When on, the ":substitute" flag 'g' is default on.
" This means that all matches in a line are substituted instead of one.
set gdefault

""" Settings of indent
" Copy indent from current line when starting a new line (typing <CR>
" in Insert mode or when using the "o" or "O" command).
set autoindent

" Do smart autoindenting when starting a new line.
set smartindent

" In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
set expandtab

" Number of spaces that a <Tab> in the file counts for.
set tabstop=4

" Number of spaces to use for each step of (auto)indent.
set shiftwidth=4

" Number of spaces that a <Tab> counts for while performing editing operations,
" like inserting a <Tab> or using <BS>.
set softtabstop=4

" Yunk to clipboard and paste from clipborad
set clipboard=unnamed,unnamedplus

" When set, a forward slash is used when expanding file names.
set shellslash

" When 'wildmenu' is on, command-line completion operates in an enhanced mode.
" Completion mode that is used for the character specified with 'wildchar'.
set wildmenu wildmode=list:longest,full

" A history of ":" commands,
" and a history of previous search patterns is remembered.
set history=10000

" Disable beep.
set visualbell t_vb=
set noerrorbells

" This is a list of character encodings considered
" when starting to edit an existing file.
set fileencodings=utf-8,sjis,cp932

" tag jump
nnoremap <C-]> g<C-]>

" split
nnoremap <C-_> <C-W>s
nnoremap <C-\> <C-W>v
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

""" Binary Editor
" vim -b : Open file in xxd-format.
augroup BinaryXXD
  autocmd!
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END

""" Load Plugins
if &loadplugins
    source $HOME/.vimrc-plugins
endif

filetype on
filetype indent plugin on
syntax enable

