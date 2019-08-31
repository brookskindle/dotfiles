# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Remove ctrl-s and ctrl-q screen pause/resume functionality on terminal
stty -ixon

# Set prompt
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Use crowd-sourced bash options: https://github.com/mrzool/bash-sensible
source ~/.sensible.bash

source ~/.bash_aliases

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
bind '"\C-f": "\C-t"'  # Let ctrl+f also activate FZF

# Let FZF use the platinum searcher, as it respects .gitignore
# export FZF_DEFAULT_COMMAND="pt --files-with-matches ."
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

eval "$(direnv hook bash)"

# Let ctrl+w erase only part of a path
# https://unix.stackexchange.com/a/58491
stty werase undef
bind '\C-w:unix-filename-rubout'
