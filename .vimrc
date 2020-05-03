filetype plugin indent on
syntax enable

" 行番号を表示
set number

" ステータス行を常に表示
set laststatus=2

" コマンドラインの行数を2行に変更（デフォルト1行）
set cmdheight=2

" 空白文字の可視化
"
"   >-  : タブ
"   <   : 行末
"   -   : 行末のスペース
"
set list
set listchars=tab:>-,eol:<,trail:-

" インサートモードでのバックスペースの有効化
"
"   indent  : autoindent を超えてバックスペースを働かせる
"   eol     : 改行を超えてバックスペースを働かせる
"   start   : 挿入区間の始めでバックスペースを働かせるが CTRL-W と CTRL-U は挿入区間の始めでいったん止まる
"
set backspace=indent,eol,start

" 保存せずに終了する際に確認ダイアログを出す
set confirm

" ファイルが保存されていなくても別のファイルを開く
set hidden

" vimの外でのファイル変更を自動で読み込む
set autoread

" ファイルの上書きでバックアップを作らない
set nobackup

" ファイル編集中のスワップファイルを作らない
set noswapfile

" 検索対象をハイライトする
set hlsearch

" インクリメンタルサーチを有効にする
set incsearch

" 大文字小文字を区別せず検索する
set ignorecase

" 大文字と小文字が混在する場合に大文字小文字を区別する
set smartcase

" 最後尾まで検索後、先頭に戻る
set wrapscan

" 置換のグローバルオプションをデフォルトでオンにする
set gdefault

" 自動インデント
set autoindent

" {と}でインデントの深さを決める
set smartindent

" タブ文字をスペース4文字として扱う
set shiftwidth=4
set tabstop=4
set expandtab

" クリップボードとの連携を有効化
set clipboard=unnamed,unnamedplus

" タブ補完を有効化
set wildmenu
" 最長マッチまで補完後に補完メニューを開く
set wildmode=list:longest,full

" コマンドラインと検索パターンの履歴件数
set history=100

" ビープ音を無効化
set visualbell t_vb=
set noerrorbells

" ファイル読み込み時のエンコーディング優先順位
"
"   1. UTF-8
"   2. Shift-JIS
"   3. CP932
"
set fileencodings=utf-8,sjis,cp932

" Ctrl + hjkl で画面移動
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" 下に画面分割
set splitbelow

" 右に画面分割
set splitright

augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

" vim -b : バイナリモードでファイルを開く
augroup BinaryXXD
  autocmd!
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END

" vim-plugによるプラグイン管理
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" vim-plug本体
Plug 'junegunn/vim-plug'

" カラースキーム
Plug 'ciaranm/inkpot'

" ステータス表示の強化
Plug 'vim-airline/vim-airline'

" Tmuxのサポート
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

" Gitのサポート
Plug 'tpope/vim-fugitive'

" Markdown, PlantUMLのプレビュー
Plug 'kannokanno/previm', {'for': ['markdown', 'plantuml'] }
Plug 'tyru/open-browser.vim', {'for': ['markdown', 'plantuml'] }
let g:previm_open_cmd = 'open -a Safari'
let g:previm_show_header = 0
nnoremap <silent><Space><Space>p :PrevimOpen<CR>

" プロジェクトのツリー表示
Plug 'scrooloose/nerdtree'
" Ctrl + T でツリーの表示を切替
nnoremap <silent><C-t> :NERDTreeToggleVCS<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ackの結果をQuickfixに表示する
Plug 'mileszs/ack.vim'

" 移動支援
Plug 'easymotion/vim-easymotion'

call plug#end()

colorscheme inkpot

