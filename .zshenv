# for ubuntu
skip_global_compinit=1

export VOLTA_HOME="/home/brian/.volta"
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=firefox
export PAGER=less
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

typeset -U path
path+=(~/.cargo/bin $VOLTA_HOME/bin)
# export to subprocesses
export PATH
