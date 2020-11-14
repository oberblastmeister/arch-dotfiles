export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

export ZDOTDIR=$HOME/.config/zsh
# export HISTFILE="$XDG_DATA_HOME"/zsh/history
export HISTFILE=~/.zsh_history

export TERMINAL=kitty
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=firefox
export PAGER=less

# scaling
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCALE_FACTOR=1

# qt
export QT_STYLE_OVERRIDE=kvantum

# makesure that there are no duplicates in path var
typeset -U path
path+=(
    ~/.cargo/bin
    ~/bin
    ~/.local/bin
    $GOPATH/bin
    ~/.luarocks/bin
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

# fzf
# let fzf find hidden files
export FZF_DEFAULT_COMMAND="fd --type file --follow --color=always"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_ALT_C_COMMAND="fd --type directory --hidden --follow --exclude .git --color=always"
export FZF_ALT_C_COMMAND="fd --type directory --hidden --follow --exclude .git --exclude .cache --color=always"
export FZF_TMUX=1

# default opts for fzf
export FZF_DEFAULT_OPTS="
--layout=reverse --inline-info --ansi
--color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
--color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54,border:#928374"

export FZF_COMPLETION_OPTS="--layout=reverse --inline-info"
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 --theme=gruvbox {}'"
export FZF_ALT_C_OPTS="--preview 'exa --level 3 --tree --color=always --group-directories-first --icons {} | head -50'"

# sk
export SKIM_DEFAULT_COMMAND="fd --type file --follow --color=always"
# export SKIM_DEFAULT_OPTS="--ansi"
# export SKIM_DEFAULT_OPTS="
# --layout=reverse --inline-info --ansi
# --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
# --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54,border:#928374"

# bat
export BAT_THEME="gruvbox"
export BAT_CONFIG_PATH="$HOME/.config/bat/config"

# ripgrep
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/config"

# change default config path for starship (~/.config/starship.toml)
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# xmonad
export XMONAD_CONFIG_HOME="$XDG_CONFIG_HOME/xmonad"
export XMONAD_DATA_HOME="$XDG_DATA_HOME/xmonad"
export XMONAD_CACHE_HOME="$XDG_CACHE_HOME/xmonad"
