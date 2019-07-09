#
# zplug
#

# zplug がなければインストール後 zsh を再起動
if [ ! -e "${HOME}/.zplug/init.zsh" ]; then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi
source ${HOME}/.zplug/init.zsh
# ここに入れたいプラグインを書いていく(gitのパスで)
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-syntax-highlighting'
zplug 'zsh-users/zsh-autosuggestions'
# プラグインがまだインストールされてないならインストールするか聞く
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
# .zplug 以下にパスを通す。プラグイン読み込み
zplug load --verbose

# Ctrl+D でログアウトしない
setopt IGNOREEOF

# パスを追加したい場合
export PATH="$HOME/bin:$PATH"

# 色指定を可能に
autoload -Uz colors
colors

# 補完
autoload -Uz compinit
compinit

# viキーバインド
#bindkey -v

# 他のターミナルとヒストリーを共有
setopt share_history
setopt histignorealldups # history のコマンド重複をなくす
setopt extended_history # history に時刻表示
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# 履歴検索機能のショートカット設定
# コマンド履歴の検索はCtrl-P/N、複数行の編集は矢印
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# cdコマンドを省略して、ディレクトリ名のみの入力で移動
setopt auto_cd

# 自動でpushdを実行
setopt auto_pushd

# pushdから重複を削除
setopt pushd_ignore_dups

# コマンドミスを修正
setopt correct

setopt list_packed # 補完候補をコンパクトに表示
setopt nolistbeep  # 補完候補表示時などにビープ音を鳴らさない

# Ctrl+sのロック, Ctrl+qのロック解除を無効にする
setopt no_flow_control

# 色見本
# for c in {000..255}; do echo -n "\e[38;5;${c}m $c" ; [ $(($c%16)) -eq 15 ] && echo;done;echo

# VCSの情報を取得するzsh関数
autoload -Uz vcs_info

# PROMPT変数内で変数参照
setopt prompt_subst

zstyle ':vcs_info:*' formats " %F{200}%c%u(%r:%b)%f"  # 通常
zstyle ':vcs_info:*' actionformats '[%b|%a]'        # rebase 途中,merge コンフリクト等 formats 外の表示
zstyle ':vcs_info:git:*' check-for-changes true     # formats 設定項目で %c,%u が使用可
zstyle ':vcs_info:git:*' stagedstr   "%F{202}!"   # commit されていないファイルがある
zstyle ':vcs_info:git:*' unstagedstr "%F{196}+" # add されていないファイルがある

# %b ブランチ情報
# %a アクション名(mergeなど)
# %c changes
# %u uncommit

# プロンプト表示直前に vcs_info 呼び出し
precmd () { vcs_info }

# プロンプト
PROMPT='%F{255}[%f%F{245}%n@%m%f %F{255}%c${vcs_info_msg_0_}]%f %F{220}%#%f '
RPROMPT='%F{245}%~ (%*)%f'

# alias
setopt complete_aliases # エイリアスでも補完
alias ll='ls -lh'
alias la='ls -lha'
alias relogin='exec $SHELL -l'
alias vi='vim'
alias vz='vim ~/.zshrc'

# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    *)
        alias ls='ls -F --color=auto'
        ;;
esac
# cd と同時に ls
chpwd() { ls }
