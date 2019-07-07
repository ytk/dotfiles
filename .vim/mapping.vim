"====================
" キーマッピング設定
"====================
"               normal insert command visual
" map/noremap     @      -       -      @
" nmap/nnoremap   @      -       -      -
" imap/inoremap   -      @       -      -
" cmap/cnoremap   -      -       @      -
" vmap/vnoremap   -      -       -      @
" map!/noremap!   -      @       @      -

" カーソル上下移動を表示行単位で
noremap k      gk
noremap j      gj
noremap <Up>   gk
noremap <Down> gj
noremap gk k
noremap gj j

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

" 行数表示切り替え
nnoremap <silent> <Space>n :<C-u>set number!<CR>
