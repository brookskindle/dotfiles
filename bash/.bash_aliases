alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias df='df -h'

# Tmux aliases
alias t="tmux new-session"
alias ta="tmux attach"
alias tls="tmux ls"

# Edit dotfiles quickly
alias dot="pushd ~/dotfiles >/dev/null && vim +':GitFiles' && popd >/dev/null"
