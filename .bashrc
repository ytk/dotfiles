# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific aliases and functions
alias vi=vim
alias ls='ls -F --color'
# cd and ls
function cdls() {
    \cd $1;
    ls -F --color;
}
alias cd=cdls
function mcd {
    mkdir -p "$1" && cd "$1";
}

export PAGER=lv
export GIT_PAGER='lv -Ou8 -c'

# bashでscreenの端末間historyを共有する
function share_history { 
    history -a  # .bash_historyに前回コマンドを1行追記
    history -c  # 端末ローカルの履歴を一旦消去
    history -r  # .bash_historyから履歴を読み込み直す
}
PROMPT_COMMAND='share_history' # 上記関数をプロンプト毎に自動実施
shopt -u histappend  # .bash_history追記モードは不要なのでOFFに
export HISTSIZE=9999 # 履歴のMAX保存数を指定
