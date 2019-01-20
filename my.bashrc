# my.bashrc

umask 022


alias ll='ls -l'
alias ls1='ls -1'
alias lld='ls -ld'
alias lla='ls -la'

alias e='emacs -nw'


export EDITOR="vim"
export PAGER="less"
export HISTSIZE=10000


# man の出力を均等割り付けしない
#export MANOPT=--no-justification

# PATH
export PATH=~/python:~/local/bin:~/bin:$PATH

