export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

export ZDOTDIR=$HOME/.config/zsh
# export HISTFILE="$XDG_DATA_HOME"/zsh/history
export HISTFILE=~/.zsh_history

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

# qt
export QT_STYLE_OVERRIDE=kvantum

# makesure that there are no duplicates in path var
typeset -U path
path+=(~/.cargo/bin
    ~/bin
    ~/.local/bin
    $GOPATH/bin
)
# export to subprocesses
export PATH

# start gnome keyring in interactive shell
if [ -n "$DESKTOP_SESSION" ]; then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

# scaling
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCALE_FACTOR=1
