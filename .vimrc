" ---------------------
" vundle設定
" ---------------------
set encoding=utf-8
colorscheme railscasts


" * 初期化
set nocompatible
filetype off
if has('vim_starting')
        set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

" * grep関連
NeoBundle 'rking/ag.vim'
let g:ag_apply_lmappings=0
let g:ag_apply_qmappings=0

" * GIT操作
NeoBundle "tpope/vim-fugitive"

" * Subversion操作
NeoBundle "vcscommand.vim"

" * DB操作
NeoBundle "dbext.vim"
" * Ruby/Rails関連
" Ruby用
NeoBundle 'vim-ruby/vim-ruby'
" Rails用
NeoBundle 'tpope/vim-rails'
" * コマンド補助
" 簡易スクリプト実行
NeoBundle 'thinca/vim-quickrun'

" * コーディング補助系
" コーディング補完
NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/neosnippet'
NeoBundle 'taichouchou2/vim-rsense'
NeoBundle 'slim-template/vim-slim'
" HTMLタグ補完
NeoBundle 'mattn/emmet-vim' 
NeoBundle 'hail2u/vim-css3-syntax'
" CofeeScript関連
NeoBundle 'kchmck/vim-coffee-script'
" インデントに色を付ける
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1 " 自動起動
let g:indent_guides_start_level=2           " インデント量
let g:indent_guides_color_change_percent=30 " 色変化幅
let g:indent_guides_space_guides=1          " 空白文字ガイド: 有効
let g:indent_guides_auto_colors=0           " 自動カラー: 無効
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=darkblue
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray
let g:indent_guides_guide_size=2            " ガイド幅

NeoBundle 'tpope/vim-endwise'
NeoBundle 'tomtom/tcomment_vim'

" Sass関連
NeoBundle 'Sass'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'wavded/vim-stylus'

" コメント補完
NeoBundle 'The-NERD-Commenter'
let NERDSpaceDelims = 2
nmap <c-o> <Plug>NERDCommenterToggle
vmap <c-o> <Plug>NERDCommenterToggle

" ツリーファイラ
NeoBundle 'The-NERD-tree'
vmap ct <Plug>NERDTree
nmap ct <Plug>NERDTree
NeoBundle 'Shougo/vimshell'
NeoBundle 'scrooloose/syntastic'
"let g:quickrun_config._ = {'runner' : 'vimproc'}
call neobundle#end()

" ----------------------
" 表示
" ----------------------

" 行番号の表示
set number

" 対応する括弧の表示
set showmatch

" 全角スペースを視覚化
highlight ZSpace cterm=underline ctermfg=lightblue guibg=white
match ZSpace /　/

" vim起動時にNERDTreeを表示する
let file_path = expand("%")
if has('vim_starting') &&  file_path == ""
    autocmd VimEnter * NERDTree ./
endif

" ----------------------
" 各種設定
" ----------------------

" コマンド補完
set wildmenu 
" 最長マッチ
set wildmode=list:full

" バックアップ
set backupdir=$HOME/.bk_vim

" スワップファイル
set directory=$HOME/.bk_vim

" タブを半角スペース2文字
set tabstop=2 
set shiftwidth=2
set expandtab
" ペーストモード
" set autoindent
set paste

" インクリメンタルサーチ
set incsearch
" 検索結果をハイライト
set hlsearch
" 大文字と小文字を区別しない
set ignorecase

" syntaxカラーON
syntax on

filetype plugin indent on 

" エイリアス
command Rco Rcontroller
command Rvi Rview
command Rmo Rmodel
command Rst Rstylesheet

" ----------------------
" キーマップ
" ----------------------
" ------------------
" スペースキーでスクロール
nnoremap <Space> jzz
nnoremap <S-Space> kzz

"カーソル行の強調表示
"set cursorline

"ビジュアルモード時vで行末まで選択
vnoremap v $h

" 通常モードでもエンターで改行
" noremap <CR> o<ESC>

" escをctrl+jに
imap <C-j> <esc>

" バックスペース設定
set backspace=start,eol,indent
