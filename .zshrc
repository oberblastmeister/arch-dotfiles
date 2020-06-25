#    
#                    ██     
#                   ░██     
#     ██████  ██████░██     
#    ░░░░██  ██░░░░ ░██████ 
#       ██  ░░█████ ░██░░░██
#      ██    ░░░░░██░██  ░██
#     ██████ ██████ ░██  ░██
#    ░░░░░░ ░░░░░░  ░░   ░░ 


### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"

# enable p10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
# zinit light-mode for \
#     zinit-zsh/z-a-patch-dl \
#     zinit-zsh/z-a-as-monitor \
#     zinit-zsh/z-a-bin-gem-node

zinit ice depth=1; zinit light romkatv/powerlevel10k
# source p10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# keytimeout=0 might have bad effects
zinit ice atload"bindkey "jk" vi-cmd-mode"
zinit light softmoth/zsh-vim-mode

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
HISTFILE=~/.cache/zsh/history

export KEYTIMEOUT=20
export BAT_THEME="gruvbox"
export TUIR_URLVIEWER=urlscan

MODE_CURSOR_VIINS="bar"
MODE_CURSOR_REPLACE="underline"
MODE_CURSOR_VICMD="block"
MODE_CURSOR_SEARCH="steady underline"
MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD"
MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL"

zinit ice lucid wait
zinit snippet ~/.aliases

# good defaults
zinit wait lucid light-mode for \
  OMZL::completion.zsh \
  OMZL::clipboard.zsh \

# big three
zinit wait lucid light-mode for \
  zsh-users/zsh-history-substring-search \
  atinit"zicompinit; zicdreplay" \
      zsh-users/zsh-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions \

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=21
export ZSH_AUTOSUGGEST_USE_ASYNC=true
# bindkey '^[;' autosuggest-accept

zinit ice lucid wait blockf id-as'fzf' atclone"./install; sed -i 's_/home/brian/.fzf_/home/brian/.zinit/plugins/fzf_g' ~/.fzf.zsh; mv ~/.fzf.zsh ~/.zinit/plugins/fzf/.fzf.zsh" \
  atpull"%atclone" pick".fzf.zsh"
zinit light junegunn/fzf

# zinit ice lucid wait atclone'PYENV_ROOT="$PWD" ./libexec/pyenv init - > zpyenv.zsh' \
#     atinit'export PYENV_ROOT="$PWD"' atpull"%atclone" \
#     as'command' pick'bin/pyenv' src"zpyenv.zsh" nocompile'!'
# zinit light pyenv/pyenv

# let fzf find hidden files
# hidden
# export FZF_DEFAULT_COMMAND="fd --type file --follow --exclude .git --color=always --hidden"
export FZF_DEFAULT_COMMAND="fd --type file --follow --exclude .git --color=always"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND" 
# export FZF_ALT_C_COMMAND="fd --type directory --hidden --follow --exclude .git --color=always"
export FZF_ALT_C_COMMAND="fd --type directory --follow --exclude .git --color=always"
export FZF_TMUX=1

# default opts for fzf
export FZF_DEFAULT_OPTS="
--layout=reverse --inline-info --ansi
--color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
--color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54,border:#928374"

export FZF_COMPLETION_OPTS="--layout=reverse --inline-info"
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 --theme=gruvbox {}'"
export FZF_ALT_C_OPTS="--preview 'exa --level 3 --tree --color=always --group-directories-first --icons {} | head -50'"

# use fd for completion
_fzf_compgen_path() {
  fd --follow --hidden --color=always --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --follow --hidden --color=always --exclude ".git" . "$1"
}

# lfcd
zinit light-mode for \
  atinit"bindkey -s '^o' 'lfcd\n'" \
    https://raw.githubusercontent.com/gokcehan/lf/master/etc/lfcd.sh

# zinit ice lucid wait
# zinit snippet ~/.pyenv_init.zsh

zinit ice lucid wait
zinit snippet OMZP::autojump/autojump.plugin.zsh

# load programs
zinit ice lucid wait
zinit light soimort/translate-shell

zinit ice lucid wait id-as"googler" as"program"
zinit snippet https://raw.githubusercontent.com/jarun/googler/v4.0/googler

zinit ice lucid wait id-as"cht" as"program"
zinit snippet https://cht.sh/:cht.sh

zinit ice lucid wait id-as"speedtest" as"program"
zinit snippet https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py

zinit ice id-as"exercism" from"gh-r" as"program" mv"exercism* -> exercism"
zinit light exercism/cli

# source lf icons
source ~/.lf_icons
# eval "$(pyenv init -)"
# autoenable virtualenvs
# eval "$(pyenv virtualenv-init -)"
