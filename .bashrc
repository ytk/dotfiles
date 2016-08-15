# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific aliases and functions
alias vi=vim

# cd & ls
case "`uname`" in
    Darwin) # MacOS
        alias ls='ls -FG'
        ;;
    *)
        alias ls='ls -F --color'
        ;;
esac
function cdls() {
    \cd $1;
    ls;
}
alias cd=cdls
function mcd {
    mkdir -p "$1" && cd "$1";
}
alias ll='ls -l'
alias la='ls -la'

export PAGER=lv
export GIT_PAGER='lv -Ou8 -c'

# ssh Keychain
#keychain /path/to/ssh-key >/dev/null 2>/dev/null
#source $HOME/.keychain/$HOSTNAME-sh

# bash で screen の端末間 history を共有する
function share_history { 
    history -a  # .bash_history に前回コマンドを1行追記
    history -c  # 端末ローカルの履歴を一旦消去
    history -r  # .bash_history から履歴を読み込み直す
}
PROMPT_COMMAND='share_history' # 上記関数をプロンプト毎に自動実施
shopt -u histappend  # .bash_history追記モードは不要なのでOFFに

export HISTSIZE=9999 # 履歴のMAX保存数を指定

# history にコマンド実行時刻を記録する
HISTTIMEFORMAT='%Y-%m-%dT%T%z '

# 無用な画面停止を解除
stty stop undef
