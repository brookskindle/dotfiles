export TERM="xterm-256color"

# Add sane defaults to zsh - https://github.com/robbyrussell/oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
export HOMEBREW_ROOT="/usr/local/share"
HYPHEN_INSENSITIVE="true"
source $HOMEBREW_ROOT/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_ROOT/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh

# Prompt styling - https://github.com/bhilburn/powerlevel9k
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_DISABLE_RPROMPT=true
source  ~/build/powerlevel9k/powerlevel9k.zsh-theme

# Enable FZF, a fuzzy search finder: https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey '\C-f' fzf-file-widget  # Let ctrl+f also activate FZF

# alias ls='ls -G'
alias ls='colorls'
alias t='tmux new-session'
alias ta='tmux attach'
alias tls='tmux ls'

# Edit dotfiles quickly
alias dot="pushd ~/dotfiles >/dev/null && vim +':GitFiles' && popd >/dev/null 2>&1"

# Let pip3 --user installed binaries be found
export PATH="$PATH:$HOME/Library/Python/3.7/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
