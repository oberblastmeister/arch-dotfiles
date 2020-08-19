export EDITOR=nvim
export VISUAL=nvim
export BROWSER=firefox
export PAGER=less

# neovim terminal doesn't export this for bat
export COLORTERM=truecolor

# makesure that there are no duplicates in path var
typeset -U path
path+=(~/.cargo/bin ~/bin ~/go/bin ~/.local/bin)
# export to subprocesses
export PATH

# start gnome keyring in interactive shell
if [ -n "$DESKTOP_SESSION" ]; then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi
