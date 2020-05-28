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
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node

# zinit module
# module_path+=( "/home/brian/.zinit/bin/zmodules/Src" )
# zmodload zdharma/zplugin

zinit ice depth=1; zinit light romkatv/powerlevel10k
# source p10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# environment variables
setopt autocd
unsetopt correct

export NNN_PLUG='t:fzopen;c:fzhist;v:preview-kitty;d:dragdrop;p:pdfview'
export VISUAL=nvim
export EDITOR=nvim
export PAGER=less
export NNN_COLORS=2
export NNN_USE_EDITOR=1
export NNN_TRASH=1
# export BAT_PAGER="less -R"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export PISTOL_CHROMA_FORMATTER=terminal16m

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# change bat theme
export BAT_THEME="gruvbox"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# incase rustup fails
export PATH="$HOME/.cargo/bin:$PATH"

export VOLTA_HOME="/home/brian/.volta"
grep --silent "$VOLTA_HOME/bin" <<< $PATH || export PATH="$VOLTA_HOME/bin:$PATH"


MODE_CURSOR_VIINS="bar"
MODE_CURSOR_REPLACE="underline"
MODE_CURSOR_VICMD="block"
MODE_CURSOR_SEARCH="steady underline"
MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD"
MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL"


zinit ice atload"export KEYTIMEOUT=10; bindkey "jk" vi-cmd-mode"
zinit light softmoth/zsh-vim-mode

# good defaults
zinit light-mode for \
  OMZL::completion.zsh \
  OMZL::history.zsh \

zinit pack for pyenv

# big three
zinit wait lucid light-mode for \
  zsh-users/zsh-history-substring-search \
  atinit"zicompinit; zicdreplay" \
      zsh-users/zsh-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions \

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=21
export ZSH_AUTOSUGGEST_USE_ASYNC=true
# bindkey '^[;' autosuggest-accept

zinit ice lucid wait blockf id-as'fzf' atclone"./install; sed -i 's_/home/brian/.fzf_/home/brian/.zinit/plugins/fzf_g' ~/.fzf.zsh; mv ~/.fzf.zsh ~/.zinit/plugins/fzf/.fzf.zsh" \
  atpull"%atclone" pick".fzf.zsh"
zinit light junegunn/fzf

# let fzf find hidden files
export FZF_DEFAULT_COMMAND="fd --type file --follow --exclude .git --color=always --hidden"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND" 
export FZF_ALT_C_COMMAND="fd --type directory --hidden --follow --exclude .git --color=always"

# default opts for fzf
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --ansi"
export FZF_COMPLETION_OPTS="--layout=reverse --inline-info --ansi"
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always {} | head -500'"

# use fd for completion
_fzf_compgen_path() {
  fd --follow --hidden --color=always --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --follow --hidden --color=always --exclude ".git" . "$1"
}

# lfcd
zinit wait lucid light-mode for \
  atinit"bindkey -s '^o' 'lfcd\n'" \
    https://raw.githubusercontent.com/gokcehan/lf/master/etc/lfcd.sh

zinit ice lucid wait
zinit snippet OMZP::colored-man-pages/colored-man-pages.plugin.zsh

# load programs
zinit ice lucid wait
zinit light soimort/translate-shell

zinit ice id-as"googler" as"program"
zinit snippet https://raw.githubusercontent.com/jarun/googler/v4.0/googler

zinit ice id-as"cht" as"program"
zinit snippet https://cht.sh/:cht.sh

zinit ice id-as"speedtest" as"program"
zinit snippet https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py

zinit ice id-as"exercism" from"gh-r" as"program" mv"exercism* -> exercism"
zinit light exercism/cli

# zinit ice id-as"youtube-dl" as"program"
# zinit snippet https://yt-dl.org/downloads/latest/youtube-dl

# zinit ice id-as"neofetch" from"gh-r" as"program"
# zinit light dylanaraps/neofetch

# source aliases
source $HOME/.aliases

# source lf icons
source ~/.lf_icons
