filetype plugin indent off

let g:email = "t.hirayama@bravesoft.co.jp"
let g:username = "Takayuki Hirayama"

set nocompatible

set number          
set laststatus=2    
set cmdheight=2     
set showmatch       
set helpheight=999  
set list            
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:<
set t_Co=256        

set backspace=indent,eol,start 
set whichwrap=b,s,h,l,<,>,[,]  
set scrolloff=4                
set sidescrolloff=16           

set confirm    
set hidden     
set autoread   
set nobackup   
set noswapfile 

set hlsearch   
set incsearch  
set ignorecase 
set smartcase  
set wrapscan   
set gdefault   

set expandtab     
set tabstop=4     
set shiftwidth=4  
set softtabstop=4 

set autoindent    
set smartindent   

if (exists('+colorcolumn'))
  set colorcolumn=80
  highlight ColorColumn ctermbg=9
endif

set clipboard=unnamed,unnamedplus
set mouse=a
set shellslash

set wildmenu wildmode=list:longest,full
set history=10000

set visualbell t_vb=
set noerrorbells 

set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp

nnoremap <C-]> g<C-]>

augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

autocmd BufNewFile,BufRead *.rb nnoremap <C-e> :!ruby %
autocmd BufNewFile,BufRead *.pl nnoremap <C-e> :!perl %
autocmd BufNewFile,BufRead *.html nnoremap <C-e> :!open %

let g:python_host_prog = $PYENV_ROOT . '/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT . '/versions/neovim3/bin/python'

let g:cache_home = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let g:config_home = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME

let s:dein_cache_dir = g:cache_home . 'dein'

augroup MyAutoCmd
    autocmd!
augroup END

if &runtimepath !~# '/dein.vim'
    let s:dein_repo_dir = s:dein_cache_dir . 'repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
    endif
    execute 'set runtimepath^=' . s:dein_repo_dir
endif

" dein.vim
let g:dein#install_max_processes = 16
let g:dein#install_progress_type = 'title'
let g:dein#install_message_type = 'none'
let g:dein#enable_notification = 1

if dein#load_state(s:dein_cache_dir)
    call dein#begin(s:dein_cache_dir)
    let s:toml_dir = g:config_home . '/nvim/dein'
    call dein#load_toml(s:toml_dir . '/plugins.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})
    if has('nvim')
        call dein#load_toml(s:toml_dir . '/neovim.toml', {'lazy': 1})
    endif
    call dein#end()
    call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
    call dein#install()
endif

colorscheme inkpot

syntax enable
filetype indent plugin on

