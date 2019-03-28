export TERM="xterm-256color"

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
POWERLEVEL9K_MODE='nerdfont-complete'
source  ~/build/powerlevel9k/powerlevel9k.zsh-theme


# Customize powerlevel9k prompt
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time dir vcs)
POWERLEVEL9K_DISABLE_RPROMPT=true
alias ls='ls -G'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
