alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias df='df -h'

# Tmux aliases
alias t="tmux new-session"
alias ta="tmux attach"
alias tls="tmux ls"

# Edit dotfiles quickly
alias dot="pushd ~/dotfiles >/dev/null && vim +':GitFiles' && popd >/dev/null"

# Poor man's virtualenv
function workon() {
    if [ -z $1 ]
    then
        # No custom venv to source, use the default
        source venv/bin/activate
    else
        # Custom venv directory given, lets source that!
        source $1/bin/activate
    fi
}
