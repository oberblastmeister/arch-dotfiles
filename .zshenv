# for ubuntu
skip_global_compinit=1

export VOLTA_HOME="/home/brian/.volta"
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=firefox
export PAGER=less
export OPENER=run-mailcap

# makesure that there are no duplicates in path var
typeset -U path
path+=(~/.cargo/bin $VOLTA_HOME/bin ~/bin ~/go/bin ~/.local/bin)
# export to subprocesses
export PATH

# start gnome keyring in interactive shell
if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi
