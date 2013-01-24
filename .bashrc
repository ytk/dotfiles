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

# bash$B$G(Bscreen$B$NC<Kv4V(Bhistory$B$r6&M-$9$k(B
function share_history { 
    history -a  # .bash_history$B$KA02s%3%^%s%I$r(B1$B9TDI5-(B
    history -c  # $BC<Kv%m!<%+%k$NMzNr$r0lC6>C5n(B
    history -r  # .bash_history$B$+$iMzNr$rFI$_9~$_D>$9(B
}
PROMPT_COMMAND='share_history' # $B>e5-4X?t$r%W%m%s%W%HKh$K<+F0<B;\(B
shopt -u histappend  # .bash_history$BDI5-%b!<%I$OITMW$J$N$G(BOFF$B$K(B
export HISTSIZE=9999 # $BMzNr$N(BMAX$BJ]B8?t$r;XDj(B
