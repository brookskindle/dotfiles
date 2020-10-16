export TERM="xterm-256color"

# Add sane defaults to zsh - https://github.com/robbyrussell/oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
export HOMEBREW_ROOT="/usr/local/share"
HYPHEN_INSENSITIVE="true"
source $HOMEBREW_ROOT/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_ROOT/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh

# PHENOMENAL COSMIC POWER
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

export PROMPT='%F{183}%2~ %F{%(?.231.210)}λ '

# Enable FZF, a fuzzy search finder: https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey '\C-f' fzf-file-widget  # Let ctrl+f also activate FZF
# TODO: ag won't match empty files. Use fd instead to get around this limitation
export FZF_DEFAULT_COMMAND="ag --hidden --ignore .git --files-with-matches ."
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always {} | head -n 100'"

alias vim='nvim'

alias ls='ls -G'
alias t='tmux new-session'
alias ta='tmux attach'
alias tls='tmux ls'

# Replace grep, find, and cat with nicer alternatives
# https://github.com/ggreer/the_silver_searcher
alias ag='ag --hidden --ignore .git'
# https://github.com/sharkdp/fd
alias fd='fd --hidden'
# https://github.com/sharkdp/bat
alias cat='bat'

# Edit dotfiles quickly
alias dot="pushd ~/dotfiles >/dev/null && vim +':GitFiles' && popd >/dev/null 2>&1"

export PATH="$PATH:$HOME/bin"

# Let pip3 --user installed binaries be found
export PATH="$PATH:$HOME/Library/Python/3.6/bin"

# Use virtualenvwrapper for python envs (pip3 install --user virtualenvwrapper)
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/code
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
source ~/Library/Python/3.6/bin/virtualenvwrapper.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Direnv and GO environment setup
export WORKSPACE=$HOME/source
export GOPATH=$WORKSPACE/go
eval "$(direnv hook zsh)"

# Provide auto-complete for aws-cli command
source ~/Library/Python/3.6/bin/aws_zsh_completer.sh

# Faster git aliases
alias ga='git add'
alias gs='git status'
alias gco='git checkout'
alias gd='git diff'
alias gdd='git diff --cached'
alias gp='git push'
alias gg='git commit -v'

alias copy='pbcopy'
alias paste='pbpaste'

function init_kubectl() {
    # Allow kubectl tab-completion
    alias k='kubectl'
    source <(kubectl completion zsh)
    complete -F __start_kubectl k
}

# Tmux uses ctrl+a; use tmux's old prefix key (ctrl+b) instead
bindkey '^B' beginning-of-line

function init_nvm() {
    export NVM_DIR=~/.nvm
    # source $(brew --prefix nvm)/nvm.sh
    source /usr/local/opt/nvm/nvm.sh
}
