set number "行番号を表示する
set laststatus=2 "編集中のファイル名を表示

set showmatch "括弧入力時の対応する括弧を表示
syntax on "コードの色分け
set smartindent "オートインデント
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
" set cursorcolumn

"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る

"####その他の設定####
set mouse=a "マウス操作を有効に
set incsearch "インクリメンタルサーチ
set wildmenu wildmode=list:full "補完機能
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden

" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" タブ幅制御
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2

set hlsearch "検索でハイライト 

" 80文字目に線
set colorcolumn=80 
set viminfo='20,\"1000

" クリップボードにコピー
set clipboard+=unnamed

set backspace=indent,eol,start

set nocompatible

if &compatible
    set nocompatible " Be iMproved
    endif

    " Required:
    set runtimepath+=~/.cache2/dein/repos/github.com/Shougo/dein.vim

    " Required:
    call dein#begin('~/deinvim')

    " Let dein manage dein
    " Required:
    call dein#add('Shougo/dein.vim')

    " Add or remove your plugins here:
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('tpope/vim-rails')
    call dein#add('tpope/vim-fugitive')
    call dein#add('leafgarland/typescript-vim')
    call dein#add('Shougo/neomru.vim')
    call dein#add('Shougo/unite.vim')
    call dein#add('scrooloose/nerdtree')
    call dein#add('Shougo/neocomplcache.vim') 
    call dein#add('Shougo/neocomplcache-rsense.vim')

    " You can specify revision/branch/tag.
    call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

    " Required:
    call dein#end()

    " Required:
    filetype plugin indent on
    syntax enable

    " If you want to install not installed plugins on startup.
    if dein#check_install()
        call dein#install()
        endif

        let g:unite_enable_start_insert=1
        let g:unite_source_history_yank_enable =1
        let g:unite_source_file_mru_limit = 200
        nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
        nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
        nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
        nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
        nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

        nnoremap <silent> ,v :<C-u>vs<CR>
        nnoremap <silent> ,s :<C-u>split<CR>
        nnoremap <silent> ,q :<C-u>q<CR>
        nnoremap <silent> ,b :<C-u>e#<CR>
        nnoremap <silent> ,t :<C-u>tjump<CR>
        nnoremap <silent> ,n :<C-u>NERDTreeToggle<CR>

        nnoremap <silent> r :<C-u>Unite project_mru<CR>
        nnoremap <silent> R :<C-u>Unite file_mru buffer<CR>

        nnoremap <silent> gr :<C-u>Ggrep <cword> \| cw <CR>
        nnoremap <silent> gn :<C-u>Nt<CR>
" 現在のディレクトリ以下のみを相対パスで表示
let g:unite_source_alias_aliases = {
\   "project_mru" : {
\       "source" : "file_mru"
\   },
\}

call unite#custom#source('project_mru', 'matchers', ['matcher_project_files', 'matcher_default', 'converter_relative_abbr'])
" neocomplcasheの設定
"Disable Auto ComplPop
let g:acp_enableAtStartup = 0
" Use necomplcache
let g:necomplcache_enable_at_startup = 1
" Use smartcase
let g:necomplcache_enable_smart_case = 3

let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1

" Rsense
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif

let  g:neocomplcache_omni_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

let g:rsenseHome = '/Users/haneru/.rbenv/shims/rsense'
let g:rsenseUseOmniFunc = 1
