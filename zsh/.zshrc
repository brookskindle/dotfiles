HISTFILE=~/.histfile
HISTSIZE=999999
SAVEHIST=999999
setopt appendhistory #Append history to the history file (no overwriting)
setopt share_history #Share history across terminals
setopt incappendhistory #Immediately append to the history file, not just when a term is killed

# Use emacs-style keybindings
bindkey -e
zstyle :compinstall filename '/home/brooks/.zshrc'

autoload -Uz compinit
compinit

# Minimal prompt (with base-256 dracula colors)
# Last two folders of current directory: %2~
# Last command exit code: %(?.goodcolor.badcolor)
export PROMPT='%F{183}%2~ %F{%(?.231.210)}λ '

# Allow local scripts to be executed
export PATH=$PATH:$HOME/.local/bin

# Let less support colors and be case-insensitive by default
export LESS="-Ri"

# Use ctrl + left/right, and Home/End to navigate current line
#
# In tmux
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line

# And in termite: https://github.com/thestinger/termite/issues/496
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line

# Modify zsh's word split regex so that we can erase just one part of a
# directory. Eg: erasing ~/dotfiles/zsh takes three ctrl+w motions, instead of
# just one.
WORDCHARS=$WORDCHARS:s:/:

# Let tab-complete be case insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
setopt no_list_ambiguous

# https://github.com/neovim/neovim
alias vim='nvim'
# https://github.com/ggreer/the_silver_searcher
alias ag='ag --hidden --ignore .git'
# https://github.com/sharkdp/fd
alias fd='fd --hidden'
# https://github.com/sharkdp/bat
alias cat='bat'

alias ls='ls --color=auto'

# Tmux shortcuts
alias t="tmux new-session"
alias ta="tmux attach"
alias tls="tmux ls"

# Edit dotfiles quickly
alias dot="pushd ~/dotfiles >/dev/null && vim +':GitFiles' && popd >/dev/null"

# Faster git aliases
alias ga='git add'
alias gs='git status'
alias gd='git diff'
alias gdd='git diff --cached'
alias gp='git push'
alias gg='git commit -v'
alias gco='git checkout'
alias gl='git log --graph --pretty="format:%C(yellow)%h %Cblue%>(12)%ad %Cgreen%<(7)%aN%Cred%d %Creset%s"'
alias gll='git log --patch --graph --pretty="format:%C(yellow)%h %Cblue%>(12)%ad %Cgreen%<(7)%aN%Cred%d %Creset%s"'

# I'm lazy
alias open='xdg-open'

# Clipboard integration
alias copy='xclip -sel clip'
alias paste='xclip -out -sel clip'

# Configure fzf, a command line fuzzy finder - https://github.com/junegunn/fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_COMMAND="ag --hidden --ignore .git --files-with-matches ."
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always {} | head -n 100'"
# Let ctrl+f also activate fzf
bindkey -s  

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

# While typing, show suggested command
# https://github.com/zsh-users/zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlight commands in the shell
# https://github.com/zsh-users/zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Serverless (sls) recommends tabtab for completion
# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# Import colorscheme from 'wal' synchronously
# https://github.com/dylanaraps/pywal/wiki/Getting-Started
\cat ~/.cache/wal/sequences # Use actual cat, not bat
