"====================
" vim 基本設定
"====================
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
"set list               " タブや行末などの不可視文字を表示
"set listchars=tab:>-,trail:_ " 文字のフォーマットを指定する(タブを">---"で、行末の連続スペースを"_"で明示)
"set mouse=a            " マウスを有効にするモードを設定する(全てのモード)
set number             " 行番号表示
set ruler              " カーソルの位置を表示
set cursorline         " カーソル行をハイライト
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
