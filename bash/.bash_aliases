#more readable df
alias df='df -h'

#ls sorting by time
alias llt="ls -l --sort=time"

#tmux aliases
alias tls="tmux ls"
alias ta="tmux -2 attach"
alias t="tmux -2 new-session"

#common mistakes
alias cd..="cd .."
alias sl="ls"

# Edit dotfiles quickly
alias dot="pushd ~/dotfiles >/dev/null && vim +':GitFiles' && popd >/dev/null"
