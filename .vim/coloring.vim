"====================
" 色設定
" 注) dein.vim より後に読み込む必要がある
"====================
colorscheme desert " カラースキーマ
syntax on          " シンタックスハイライト

" 行番号の色変更 (カラースキーマの後に定義)
highlight LineNr ctermfg=darkgray
highlight CursorLineNr cterm=bold ctermfg=white ctermbg=darkgray
highlight clear CursorLine
