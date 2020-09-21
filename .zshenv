export TERMINAL=kitty
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=brave
export PAGER=less

# neovim terminal doesn't export this for bat
export COLORTERM=truecolor

# scaling
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCALE_FACTOR=1

# makesure that there are no duplicates in path var
typeset -U path
path+=(~/.cargo/bin ~/bin ~/bin/rofi ~/bin/bspwm ~/.local/bin)
# export to subprocesses
export PATH

# start gnome keyring in interactive shell
if [ -n "$DESKTOP_SESSION" ]; then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi
