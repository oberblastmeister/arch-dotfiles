fish_vi_key_bindings
starship init fish | source

set fish_greeting # disable greeting
set -x LS_COLORS (vivid generate gruvbox-dark)

alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias ls=exa
alias vim=nvim
alias vi=nvim

alias g=git
alias ga='git add'
alias gs='git status'
alias gc='git commit'
alias gp='git push'
