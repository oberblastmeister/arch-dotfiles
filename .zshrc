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

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
# zinit light-mode for \
#     zinit-zsh/z-a-patch-dl \
#     zinit-zsh/z-a-as-monitor \


# zinit module
# module_path+=( "/home/brian/.zinit/bin/zmodules/Src" )
# zmodload zdharma/zplugin

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt autocd
unsetopt correct

export NNN_PLUG='t:fzopen;c:fzhist;v:preview-kitty;d:dragdrop;p:pdfview'
export VISUAL=nvim
export EDITOR=nvim
export PAGER=less
export NNN_COLORS=2
export NNN_USE_EDITOR=1
export NNN_TRASH=1
export BAT_PAGER="less -R"

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

# let fzf find hidden files
# export FZF_DEFAULT_COMMAND="fdfind --type file --follow --hidden --exclude .git --color=always"
export FZF_DEFAULT_COMMAND="fd --type file --follow --exclude .git --color=always"
# export FZF_DEFAULT_COMMAND="fdfind --type file --follow --exclude .git"
# export FZF_DEFAULT_COMMAND="fdfind --type file --follow --hidden --color=always"
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --ansi"
export FZF_COMPLETION_OPTS="--layout=reverse --inline-info --ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND" 
export FZF_ALT_C_COMMAND="fd --type directory --hidden --follow --exclude .git --color=always"

export ENHANCD_FILTER="fzf"

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --follow --hidden --color=always --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --follow --hidden --color=always --exclude ".git" . "$1"
}

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=21
export ZSH_AUTOSUGGEST_USE_ASYNC=true

MODE_CURSOR_VIINS="block"
MODE_CURSOR_REPLACE="underline"
MODE_CURSOR_VICMD="block"
MODE_CURSOR_SEARCH="steady underline"
MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD"
MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL"

zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit light-mode for \
  OMZL::completion.zsh \
  OMZL::history.zsh \

zinit ice atload"export KEYTIMEOUT=10; bindkey "jk" vi-cmd-mode"
zinit light softmoth/zsh-vim-mode

zinit wait pack for system-completions

# big three
zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
      zsh-users/zsh-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions

zinit wait lucid light-mode for \
  OMZP::command-not-found/command-not-found.plugin.zsh \

# must be lower down in the list
zinit ice wait blockf lucid id-as'fzf' atclone"./install; sed -i 's_/home/brian/.fzf_/home/brian/.zinit/plugins/fzf_g' ~/.fzf.zsh; mv ~/.fzf.zsh ~/.zinit/plugins/fzf/.fzf.zsh" \
  atpull"%atclone" pick".fzf.zsh"
zinit light junegunn/fzf

zinit wait lucid id-as"fasd" as"program" atclone"PREFIX=$PWD make install" \
  pick"fasd" atpull"%atclone" atinit'eval "$(fasd --init auto)"' for \
    clvv/fasd

export FZFZ_RECENT_DIRS_TOOL='fasd'
zinit ice wait lucid
zinit light andrewferrier/fzf-z

zinit ice id-as"nnn_quitcd" lucid wait
zinit snippet https://github.com/jarun/nnn/blob/master/misc/quitcd/quitcd.bash_zsh

zinit wait lucid as'command' pick'bin/pyenv' atinit'export PYENV_ROOT="$PWD"' \
    atclone'PYENV_ROOT="$PWD" ./libexec/pyenv init - > zpyenv.zsh' \
    atpull"%atclone" src"zpyenv.zsh" nocompile'!' for \
        pyenv/pyenv

zinit ice lucid wait
zinit light soimort/translate-shell

zinit ice id-as"googler" as"program"
zinit snippet https://raw.githubusercontent.com/jarun/googler/v4.0/googler

zinit ice id-as"cht" as"program"
zinit snippet https://cht.sh/:cht.sh

zinit ice id-as"speedtest" as"program"
zinit snippet https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py

# zinit ice lucid wait
# zinit light fcambus/ansiweather

zinit ice id-as"exercism" from"gh-r" as"program" mv"exercism* -> exercism"
zinit light exercism/cli

# zinit ice id-as"youtube-dl" as"program"
# zinit snippet https://yt-dl.org/downloads/latest/youtube-dl

# zinit ice id-as"neofetch" from"gh-r" as"program"
# zinit light dylanaraps/neofetch

### End of Zinit's installer chunk

# source p10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# source aliases
source $HOME/.aliases

# add volta to path

# include rust tools to path just in case installer fails
export PATH="$HOME/.cargo/bin:$PATH"

export VOLTA_HOME="/home/brian/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
