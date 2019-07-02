# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Remove ctrl-s and ctrl-q screen pause/resume functionality on terminal
stty -ixon

# Set prompt
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Use crowd-sourced bash options: https://github.com/mrzool/bash-sensible
source ~/.sensible.bash

source ~/.bash_aliases

source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash
bind '"\C-f": "\C-t"'  # Let ctrl+f also activate FZF

# Let FZF use the platinum searcher, as it respects .gitignore
export FZF_DEFAULT_COMMAND="pt --files-with-matches ."
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

eval "$(direnv hook bash)"
