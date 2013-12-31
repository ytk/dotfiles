#==============================
# SETUP oh-my-zsh:
#   1. Clone the repository
#       git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
#   2. Set zsh as your default shell:
#       chsh -s /bin/zsh
#   3. Start / restart zsh
#==============================

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gianu"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew osx mysql perl)

source $ZSH/oh-my-zsh.sh

#==============================
#   User configuration
#==============================

# 環境変数
export PATH=$HOME/bin:/usr/local/bin:$PATH
export LANG=ja_JP.UTF-8
case ${UID} in
0)
    LANG=C
    ;;
esac

# zsh設定
setopt auto_cd     # ディレクトリ名だけでも cd
setopt auto_pushd  # cd と同時に pushd (cd -[tab] で履歴
setopt correct     # コマンドが間違っている場合に指摘
setopt list_packed # 補完候補をコンパクトに表示
setopt nolistbeep  # 補完候補表示時などにビープ音を鳴らさない

# 履歴検索機能のショートカット設定
# コマンド履歴の検索はCtrl-P/N、複数行の編集は矢印
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# コマンド履歴設定
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups # コマンドを重複して記録しない
setopt share_history    # コマンド履歴の共有

# エイリアス設定
setopt complete_aliases # エイリアスでも補完
# ls
case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -FGw"
  ;;
linux*)
  alias ls="ls -F --color"
  ;;
esac
alias ll="ls -l"
alias la="ls -a"
# cd と同時に ls
function cd() {builtin cd $@ && ls}

# 補完の有効化
autoload -U compinit
compinit
