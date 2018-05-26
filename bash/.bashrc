# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set prompt
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Let man pages use less color highlighting (otherwise it's all black & white)
# Also fixes man page highlighting in tmux: http://stackoverflow.com/a/22202558
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;016m\E[48;5;220m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Remove ctrl-s and ctrl-q screen pause/resume functionality on terminal
stty -ixon

# Use crowd-sourced bash options: https://github.com/mrzool/bash-sensible
source ~/.sensible.bash

source ~/.bash_aliases

source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash
bind '"\C-f": "\C-t"'  # Let ctrl+f also activate FZF

# Use virtualenvwrapper for python development
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

export PATH="$PATH:$HOME/bin/"

# Add programs installed with `pip install --user` to $PATH
export PATH="$PATH:$HOME/.local/bin/"
