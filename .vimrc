filetype off
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

autocmd BufNewFile,BufRead *.html nnoremap <C-e> :!open %
autocmd BufNewFile,BufRead *.py call PythonOptions()
autocmd BufNewFile,BufRead *.rb call RubyOptions()
let $PATH=$PATH.":~/.pyenv/shims/"

function PythonOptions()
    set filetype=python
    nnoremap <C-e> :!python %
    PyenvActivate
endfunction

function RubyOptions()
    set tabstop=2     
    set shiftwidth=2  
    set softtabstop=2 
endfunction

set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }

" Colorschemes 
" NeoBundle 'altercation/vim-colors-solarized'
" NeoBundle 'croaker/mustang-vim'
" NeoBundle 'jeffreyiacono/vim-colors-wombat'
" NeoBundle 'nanotech/jellybeans.vim'
" NeoBundle 'vim-scripts/Lucius'
" NeoBundle 'vim-scripts/Zenburn'
" NeoBundle 'mrkn/mrkn256.vim'
" NeoBundle 'jpo/vim-railscasts-theme'
" NeoBundle 'therubymug/vim-pyte'
" NeoBundle 'tomasr/molokai'
" NeoBundle 'chriskempson/vim-tomorrow-theme'
" NeoBundle 'sickill/vim-monokai'
" NeoBundle 'w0ng/vim-hybrid'
" NeoBundle 'sjl/badwolf'
NeoBundle 'ciaranm/inkpot'
" NeoBundle 'aereal/vim-colors-japanesque'
" NeoBundle 'ujihisa/unite-colorscheme'

" Util
NeoBundleLazy 'Shougo/unite.vim'
NeoBundleLazy 'Shougo/neomru.vim'
NeoBundleLazy 'aperezdc/vim-template'
NeoBundleLazy 'itchyny/lightline.vim'

NeoBundleLazy 'soramugi/auto-ctags.vim'
let g:auto_ctags_filetype_mode = 1
set tags+=tags;

NeoBundleLazy 'nathanaelkane/vim-indent-guides'
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=238
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=2

NeoBundle 'scrooloose/nerdtree'
nnoremap <silent><C-t> :NERDTree<CR>
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Python
NeoBundleLazy 'lambdalisue/vim-django-support', {
    \ 'autoload': {
    \   'filetypes': ['python', 'python3', 'djangohtml']
    \ }}
"NeoBundle 'davidhalter/jedi-vim'
"NeoBundle 'lambdalisue/vim-pyenv'
NeoBundleLazy 'davidhalter/jedi-vim', {
    \ 'autoload': {
    \   'filetypes': ['python', 'python3']
    \ }}
NeoBundleLazy 'lambdalisue/vim-pyenv', {
    \ 'depends': ['davidhalter/jedi-vim'],
    \ 'autoload': {
    \   'filetypes': ['python', 'python3']
    \ }}

" HTML
NeoBundleLazy 'mattn/emmet-vim', {
    \ 'autoload': {
    \   'filetypes':["html", "djangohtml"]
    \ }}

" Markdown
" NeoBundleLazy 'plasticboy/vim-markdown', {
"     \ 'autoload': {
"     \   'filetypes':['markdown']
"     \ }}
NeoBundleLazy 'kannokanno/previm', {
    \ 'autoload': {
    \   'filetypes':['markdown']
    \ }}
NeoBundleLazy 'tyru/open-browser.vim', {
    \ 'autoload': {
    \   'filetypes':['markdown']
    \ }}
let g:previm_open_cmd = 'open -a Safari'

" UML
NeoBundleLazy 'aklt/plantuml-syntax', {
    \ 'autoload': {
    \   'filetypes':['uml', 'pu', 'plantuml']
    \ }}
let g:plantuml_executable_script = "~/dotfiles/plantuml"

" Graphviz
NeoBundleLazy 'wannesm/wmgraphviz.vim', {
    \ 'autoload': {
    \   'filetypes':['dot']
    \ }}

call neobundle#end()

" Required:

NeoBundleCheck

colorscheme inkpot

syntax enable
filetype indent plugin on

