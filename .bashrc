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
