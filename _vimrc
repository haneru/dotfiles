set number "行番号を表示する
set laststatus=2 "編集中のファイル名を表示
set ruler " カーソルの位置表示
set showmatch "括弧入力時の対応する括弧を表示
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
source $VIMRUNTIME/macros/matchit.vim
syntax on "コードの色分け
set smartindent "オートインデント
set encoding=utf-8
" 現在の行を強調表示
set nocursorline
" 現在の行を強調表示（縦）
" set cursorcolumn
" set list
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

" 挿入モードでCtrl+hでバックスペース
set backspace=indent,eol,start

" vi 互換モードで動作させない
set nocompatible

" インデントの可視化
" let g:indent_guides_enable_on_vim_startup=1

" カラースキーマ設定
set t_Co=256
colorscheme molokai
let g:molokai_original=1
set background=dark

" Vim起動完了時にインストール
augroup PluginInstall
  autocmd!
  autocmd VimEnter * if dein#check_install() | call dein#install() | endif
augroup END

" 各プラグインをインストールするディレクトリ
  let s:plugin_dir = expand('~/.vim/')

" dein.vimをインストールするディレクトリをランタイムパスへ追加
  let s:dein_dir = s:plugin_dir . 'repos/github.com/Shougo/dein.vim'
  execute 'set runtimepath+=' . s:dein_dir

" dein.vimがまだ入ってなければ 最初に git clone
if !isdirectory(s:dein_dir)
  call mkdir(s:dein_dir, 'p')
  silent execute printf('!git clone %s %s','https://github.com/Shougo/dein.vim'
  , s:dein_dir)
endif

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
  call dein#add('scrooloose/syntastic.git')
  call dein#add('ngmy/vim-rubocop')
  call dein#add('slim-template/vim-slim')
  call dein#add('szw/vim-tags')
  call dein#add('soramugi/auto-ctags.vim')
  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('othree/yajs.vim')
  call dein#add('elzr/vim-json')
  "call dein#add('plasticboy/vim-markdown')
  "call dein#add('kannokanno/previm')
  "call dein#add('tyru/open-browser.vim')
  call dein#add('othree/html5.vim')
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

    inoremap <silent> jj <ESC>

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

call unite#custom#source('project_mru', 'matchers', ['matcher_project_files','matcher_default', 'converter_relative_abbr'])
" neocomplcacheの設定
"Disable Auto ComplPop
let g:acp_enableAtStartup = 0
" Use neocomplcache
let g:neocomplcache_enable_at_startup = 1
" Use smartcase
let g:neocomplcache_enable_smart_case = 3

let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1

" Rsense
let g:rsenseHome = '/Users/haneru/.rbenv/shims/rsense'
let g:rsenseUseOmniFunc = 1
if !exists('g:neocomplcache_omni_patterms')
  let g:neocomplcache_omni_patterms = {}
endif

"Rubocop Syntastic
let  g:neocomplcache_omni_patterms.ruby = '[^.*\t]\.\w*\|\h\w*::'
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_enable_highlighting=1
let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': ['ruby', 'slim', 'javascript'] }
let g:syntastic_enable_ruby_checker=1
let g:syntastic_ruby_checkers = ['rubocop']
augroup AutoSyntastic
  autocmd!
  autocmd InsertLeave, TermChanged * call s:syntastic()
augroup END
function! s:syntastic()
  w
  SyntasticCheck
endfunction
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
  if 0 == a:0
    let l:arg = "."
  else
    let l:arg = a:1
  endif
  execute "%! jq \"" . l:arg . "\""
endfunction

""" markdown {{{
"autocmd BufRead,BufNewFile *.mkd  set filetype=markdown
"autocmd BufRead,BufNewFile *.md  set filetype=markdown
" Need: kannokanno/previm
"nnoremap <silent> <C-p> :PrevimOpen<CR> " Ctrl-pでプレビュー
" 自動で折りたたまないようにする
"let g:vim_markdown_folding_disabled=1
" }}}

" html5.vim setting
let g:html5_event_handler_attributes_complete = 1
let g:html5_rdfa_attributes_complete = 1
let g:html5_microdata_attributes_complete = 1
let g:html5_aria_attributes_complete = 1
