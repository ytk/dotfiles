"==============================
"   NeoBundle
"==============================
" TODO: 事前に NeoBundle をインストール
" $ mkdir -p ~/.vim/bundle
" $ git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
"==============================
if has('vim_starting')
    set nocompatible
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()
" Plugins
NeoBundle 'vim-jp/vimdoc-ja'
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
"NeoBundle 'rhysd/accelerated-jk'
"NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'rhysd/vim-operator-surround'
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

"==============================
"   共通設定
"==============================
colorscheme desert     " カラースキーマ
syntax on              " シンタックスハイライト
set ambiwidth=double   " East Asian Width Class Ambiguous な文字の扱い(ASCIIの2倍幅に)
set background=dark    " vim に背景色の明るさを教える
set backspace=2        " バックスペースキーの動作を決定する
set cindent            " Cプログラムファイルの自動インデントを始める
set display=uhex       " テキスト表示の方法を変える(表示できない文字を16進数表示)
set expandtab          " インデントをTabではなくスペースに
set fileencodings=utf-8,iso-2022-jp-3,iso-2022-jp,euc-jisx0213,euc-jp,ucs-bom,eucjp-ms,cp932 " エンコーディングの優先順位
set helplang=ja,en     " 日本語ヘルプを優先
set hlsearch           " 検索結果をハイライトする
set ignorecase         " 検索・置換で大文字小文字を区別しない
set incsearch          " インクリメンタルサーチを行う
set laststatus=2       " ステータス行の表示設定(常に表示)
set list               " タブや行末などの不可視文字を表示
set listchars=tab:>-,trail:_ " 文字のフォーマットを指定する(タブを">---"で、行末の連続スペースを"_"で明示)
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
set matchpairs+=<:>    " 「%」のマッチ対象に<, >を追加
" 行番号の色変更
highlight LineNr ctermfg=darkgray

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
" カーソル上下移動を表示行単位で(更に連続したら加速)
nmap k      <Plug>(accelerated_jk_gk)
nmap j      <Plug>(accelerated_jk_gj)
nmap <Up>   <Plug>(accelerated_jk_gk)
nmap <Down> <Plug>(accelerated_jk_gj)
nnoremap gk k
nnoremap gj j
" 行頭と行末の移動
noremap z $
noremap 0 ^
noremap ^ 0
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
" ペーストモード切り替え
nnoremap <silent> <Space>p :<C-u>set paste!<CR>
" vim-gitgutter: git diff 表示
"nnoremap <silent> ,gg :<C-u>GitGutterToggle<CR>
"nnoremap <silent> ,gh :<C-u>GitGutterLineHighlightsToggle<CR>
" vim-operator-surround: クォートなどを補完(with vim-operator-user)
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)
" neocomplcache: Tabでも候補選択
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

"==============================
"   Perl 編集設定
"==============================
" .psgi, .t を perl 扱いに
augroup filetypedetect
autocmd! BufNewFile,BufRead cpanfile setf perl
autocmd! BufNewFile,BufRead *.psgi   setf perl
autocmd! BufNewFile,BufRead *.t      setf perl
augroup END
if executable('perltidy')
    nnoremap ,pt <Esc>:%! perltidy -se<CR>
    vnoremap ,pt <Esc>:'<,'>! perltidy -se<CR>
endif
" 保存時にコードチェック
"augroup perlsyntaxcheck
"autocmd! BufWrite *.pl w !perl -Ilib -wc
"augroup END

"==============================
"   Perl で vimscript のサンプル
"==============================
func! ToHankaku() range
  let str = getline(a:firstline, a:lastline)
perl << EOF
use utf8;
use Encode;
my $text = decode_utf8(VIM::Eval('str'));
my $firstline = VIM::Eval('a:firstline');
my @list = ();
for my $str (split /\n/, $text) {
  $str =~ tr/０-９ａ-ｚＡ-Ｚ/0-9a-zA-Z/;
  push @list, $str;
}
$main::curbuf->Set($firstline, @list);
EOF
execute "normal " . a:lastline . "gg"
endf
vnoremap <silent> <Space>ha :call ToHankaku()<cr>
nnoremap <silent> <Space>ha :call ToHankaku()<cr>
