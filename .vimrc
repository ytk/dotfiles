"==============================
"   共通設定
"==============================
colorscheme desert     " カラースキーマ
syntax on              " シンタックスハイライト
set background=dark    " vim に背景色の明るさを教える
set backspace=2        " バックスペースキーの動作を決定する
set cindent            " Cプログラムファイルの自動インデントを始める
set display=uhex       " テキスト表示の方法を変える(表示できない文字を16進数表示)
set expandtab          " インデントをTabではなくスペースに
set hlsearch           " 検索結果をハイライトする
set ignorecase         " 検索・置換で大文字小文字を区別しない
set incsearch          " インクリメンタルサーチを行う
set laststatus=2       " ステータス行の表示設定(常に表示)
set list               " タブや行末などの不可視文字を表示
set listchars=tab:>-   " 文字のフォーマットを指定する(タブを">---"で明示)
set mouse=a            " マウスを有効にするモードを設定する(全てのモード)
set number             " 行番号表示
set ruler              " カーソルの位置を表示
set scrolloff=999      " カーソルの上または下に表示する最小限の行数(常にカーソルがウインドウの中心に)
set shellslash         " ファイル名の展開にスラッシュを使う(Windows端末用)
set shiftwidth=4       " 自動インデントの各段階に使われる空白の数
set showmatch          " 閉じ括弧が入力されたとき、対応する括弧を表示する
set showcmd            " コマンドをステータスラインに表示
set softtabstop=4      " タブを押したときに入るスペースの量
set tabstop=4          " タブが対応するスペースの数
set ttymouse=xterm2    " ターミナルでマウスを使う設定
set wildmenu           " 補完候補を表示する
set wildmode=list:full " 補完動作の設定(複数のマッチがあるときは全てのマッチを羅列し、最初のマッチを補完する)
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P " ステータス行に文字コードと改行コードを表示
 
"==============================
"   キーバインディング
"==============================
"               normal insert command visual
" map/noremap     @      -       -      @
" nmap/nnoremap   @      -       -      -
" imap/inoremap   -      @       -      -
" cmap/cnoremap   -      -       @      - 
" vmap/vnoremap   -      -       -      @
" map!/noremap!   -      @       @      -
"==============================
" カーソルを表示行単位で移動
nnoremap k      gk
nnoremap j      gj
nnoremap <Up>   gk
nnoremap <Down> gj
" 行頭と行末の移動を 0 と z で
noremap z $
noremap 0 _
" Ctrl-j を Esc 扱いに
inoremap <C-j> <Esc>
noremap  <C-j> <Esc>
" インサートモードでは Ctrl-hjkl で移動
"inoremap <C-h> <Esc>ha
"inoremap <C-j> <Esc>ja
"inoremap <C-k> <Esc>ka
"inoremap <C-l> <Esc>la
" Tab でインデント整形
vnoremap <Tab>   >gv
vnoremap <S-Tab> <gv
" .vimrc の編集と再読み込み
nnoremap <silent> <Space>ve :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>vs :<C-u>source $MYVIMRC<CR>

"==============================
"   ファイルタイプ設定
"==============================
" .psgi, .t を perl 扱いに
augroup filetypedetect
autocmd! BufNewFile,BufRead *.psgi setf perl
autocmd! BufNewFile,BufRead *.t    setf perl
augroup END

"==============================
"   文字コード設定
"==============================
" UTF-8 の□や○でカーソル位置がずれないようにする
if exists("&ambiwidth")
    set ambiwidth=double
endif
" 文字コード自動判別
if &encoding !=# 'utf-8'
    set encoding=japan
endif
set fileencoding=japan
if has('iconv')
    let s:enc_euc = 'euc-jp'
    let s:enc_jis = 'iso-2022-jp'
    " iconvが JISX0213 に対応しているかをチェック
    if iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
        let s:enc_euc = 'euc-jisx0213'
        let s:enc_jis = 'iso-2022-jp-3'
    endif
    " fileencodings を構築
    if &encoding ==# 'utf-8'
        let s:fileencodings_default = &fileencodings
        let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
        let &fileencodings = &fileencodings .','. s:fileencodings_default
        unlet s:fileencodings_default
    else
        let &fileencodings = &fileencodings .','. s:enc_jis
        set fileencodings+=utf-8,ucs-2le,ucs-2
        if &encoding =~# '^euc-\%(jp\|jisx0213\)$'
            set fileencodings+=cp932
            set fileencodings-=euc-jp
            set fileencodings-=euc-jisx0213
            let &encoding = s:enc_euc
        else
            let &fileencodings = &fileencodings .','. s:enc_euc
        endif
    endif
    unlet s:enc_euc
    unlet s:enc_jis
endif

"==============================
"   NeoBundle
"==============================
" TODO: 事前に NeoBundle をインストール
" $ mkdir -p ~/.vim/bundle
" $ git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
if has('vim_starting')
    set nocompatible
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
" Plugins
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin'  : 'make -f make_cygwin.mak',
      \     'mac'     : 'make -f make_mac.mak',
      \     'unix'    : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'vim-perl/vim-perl'
filetype plugin indent on
NeoBundleCheck

"==============================
"   NeoBundle Plugin 設定
"==============================
" lightline.vim
if !has('gui_running')
    set t_Co=256
endif
let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'component_function': {
    \     'modified': 'MyModified',
    \     'readonly': 'MyReadonly',
    \     'fugitive': 'MyFugitive',
    \     'filename': 'MyFilename',
    \     'fileformat': 'MyFileformat',
    \     'filetype': 'MyFiletype',
    \     'fileencoding': 'MyFileencoding',
    \     'mode': 'MyMode'
    \ }
    \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:p:~') ? expand('%:p:~') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" neocomplcache.vim
let g:neocomplcache_enable_at_startup          = 1 " vimと同時起動
let g:neocomplcache_enable_smart_case          = 1 " 大文字入力まで大文字小文字を無視
let g:neocomplcache_enable_underbar_completion = 1 " アンダーバー区切りの補完を有効化
