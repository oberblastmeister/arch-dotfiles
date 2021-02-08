#
#                    ██
#                   ░██
#     ██████  ██████░██
#    ░░░░██  ██░░░░ ░██████
#       ██  ░░█████ ░██░░░██
#      ██    ░░░░░██░██  ░██
#     ██████ ██████ ░██  ░██
#    ░░░░░░ ░░░░░░  ░░   ░░

eval "$(starship init zsh)"
export LS_COLORS="$(vivid generate gruvbox-dark)"

# ### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
# conflicts with zoxide
unalias zi

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
# zinit light-mode for \
#     zinit-zsh/z-a-patch-dl \
#     zinit-zsh/z-a-as-monitor \
#     zinit-zsh/z-a-bin-gem-node

# keytimeout=0 might have bad effects
# vi mode
bindkey -v
bindkey 'jk' vi-cmd-mode

# emacs like keybindings
# bindkey '^A' beginning-of-line
# bindkey '^E' end-of-line
# bindkey '^B' backward-char
# bindkey '^F' forward-char

# ============================================================================
# ============================================================================
# ============================================================================

# environment variables/settings
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
unsetopt correct

# history options
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data
HISTSIZE=10000
SAVEHIST=10000

export TUIR_URLVIEWER=urlscan
export PISTOL_CHROMA_FORMATTER=terminal256

MODE_CURSOR_VIINS="block"
MODE_CURSOR_REPLACE="underline"
MODE_CURSOR_VICMD="block"
MODE_CURSOR_SEARCH="steady underline"
MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD"
MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL"

# good defaults
zinit ice wait lucid
zinit snippet OMZL::completion.zsh

# big four
# zicompinit is just `autoload compinit; compinit`
zinit ice wait lucid atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay"
zinit light zdharma/fast-syntax-highlighting

zinit ice wait lucid atload"!_zsh_autosuggest_start; bindkey '^_' autosuggest-execute; bindkey '^]' autosuggest-accept"
zinit light zsh-users/zsh-autosuggestions

zinit ice wait lucid atload"bindkey '^P' history-substring-search-up; bindkey '^N' history-substring-search-down"
zinit light zsh-users/zsh-history-substring-search

zinit ice wait blockf lucid atpull'zinit creinstall -q "$PWD"'
zinit light zsh-users/zsh-completions

# overrides zsh autosuggest for some reason
zinit ice lucid wait atload"bindkey '^_' autosuggest-execute"
zinit light softmoth/zsh-vim-mode

# source ~/builds/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# zinit ice lucid wait
# zinit light marlonrichert/zsh-autocomplete

export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=21
export ZSH_AUTOSUGGEST_USE_ASYNC=true

zinit wait lucid is-snippet light-mode blockf for \
    /usr/share/fzf/key-bindings.zsh \
    /usr/share/fzf/completion.zsh \

zinit ice lucid wait as"completion"
zinit snippet https://raw.githubusercontent.com/TheLocehiliosan/yadm/master/completion/yadm.zsh_completion

# use fd for completion
_fzf_compgen_path() {
  fd --follow --color=always --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --follow --color=always --exclude ".git" . "$1"
}

# lfcd
zinit light-mode for \
  atinit"bindkey -s '^o' 'lfcd\n'" \
    https://raw.githubusercontent.com/gokcehan/lf/master/etc/lfcd.sh

zinit ice lucid wait
zinit snippet https://github.com/ajeetdsouza/zoxide/blob/master/zoxide.plugin.zsh

zinit ice lucid wait
zinit snippet OMZP::zsh-interactive-cd

zinit ice lucid wait id-as"cht" as"program"
zinit snippet https://cht.sh/:cht.sh

zinit ice lucid wait id-as"seed" as"program"
zinit snippet https://raw.githubusercontent.com/Olical/aniseed/master/scripts/seed.sh

zinit ice id-as"exercism" from"gh-r" as"program" mv"exercism* -> exercism"
zinit light exercism/cli

zinit wait lucid light-mode is-snippet for \
    $ZDOTDIR/lazy/aliases.zsh \
    $ZDOTDIR/lazy/direnv.zsh \

# source lf icons
source ~/.config/zsh/.lf_icons
