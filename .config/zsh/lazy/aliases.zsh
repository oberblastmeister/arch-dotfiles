# directory aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

# config aliases
alias zshrc="nvim ~/.zshrc"
alias vimrc="nvim ~/.config/nvim/init.vim"

alias rust="evcxr"
alias vim="nvim"
alias vi="nvim"

alias man="batman"
# alias man="nvim +Man!"

alias wttr="curl wttr.in"

# jupyter aliases
alias ijs='jupyter console --kernel=javascript'
alias ivim='jupyter console --kernel=vim_kernel'
alias ijava='jupyter console --kernel=java'
alias irust='jupyter console --kernel=rust'

# exa
alias ls='exa --icons'
alias lt='exa --tree --icons --level=3'
alias lS='exa -1 --icons'
alias la='exa --all --icons'

alias l='lfcd'
alias b='buku --suggest'
alias fb='URL=$(buku -p -f 10 | fzf) && [[ -n $URL ]] && $BROWSER $URL'
alias bu='buku'
alias top='btm'

alias chtsh='cht --shell'
alias mopen='mimeopen &>/dev/null'
alias open='handlr open'
alias icat="kitty +kitten icat"

alias mutt='neomutt'

# git
alias g='git'
alias ga='git add'
alias gs='git status'
alias gc='git commit'
alias gp='git push'

# yadm
alias y='yadm'
alias ya='yadm add'
alias ys='yadm status'
alias yc='yadm commit'
alias yp='yadm push'

# tmux
alias ta='tmux attach'
alias tl='tmux ls'

alias t='task'

alias pac="sudo pacman -Syu"
alias fyay="fuzzy_yay"
alias syay="sk_yay"
alias faura="yay -Slq | fzf -m --preview 'bat --paging=never <(aura -Ai {1}) <(yay -Fl {1} | awk \"{print \$2}\")' | xargs -ro  yay -S"
alias aurasyu="sudo aura -Akuax"
alias pacaura="sudo pacman -Syu && sudo aura -Akuax"
alias fpac="pacman -Slq | fzf --multi --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk \"{print \$2}\")' | xargs -ro sudo pacman -S"
alias ytdl="youtube-dl"

# jupyter aliases
alias irust="jupyter console --kernel rust"
