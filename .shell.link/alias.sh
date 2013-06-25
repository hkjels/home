
# File system

alias _='sudo'
alias la='ls -la'
alias ll='ls -1'
alias lst="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
alias -- -='cd -'
alias ..='cd ..'
alias ....='cd ../..'
alias ......='cd ../../..'


# Applications

alias g='git'
alias GET='burl GET'
alias POST='burl POST'
alias PUT='burl PUT'
alias DEL='burl DELETE'
alias HEAD='burl -I'
alias mux='tmux attach || tmux new'


# Date & time

alias today="date '+%Y-%m-%d'"

