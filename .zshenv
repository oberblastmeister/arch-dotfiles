# for ubuntu
skip_global_compinit=1

export VOLTA_HOME="/home/brian/.volta"
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=firefox
export PAGER=less
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

typeset -U path
path+=(~/.cargo/bin $VOLTA_HOME/bin)
# export to subprocesses
export PATH

# export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# eval $(keychain --eval id_rsa)

# SSH_ENV="$HOME/.ssh/environment"

#function start_agent {
#    echo "Initialising new SSH agent..."
#    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
#    echo succeeded
#    chmod 600 "${SSH_ENV}"
#    . "${SSH_ENV}" > /dev/null
#    /usr/bin/ssh-add;
#}

## Source SSH settings, if applicable

#if [ -f "${SSH_ENV}" ]; then
#    . "${SSH_ENV}" > /dev/null
#    #ps ${SSH_AGENT_PID} doesn't work under cywgin
#    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
#        start_agent;
#    }
#else
#    start_agent;
#fi
