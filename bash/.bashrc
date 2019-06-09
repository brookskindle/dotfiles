# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# prompt
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

eval $(dircolors -b ~/.dircolors)
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# any aliases we want to source?
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Virtualenvwrapper for necessary python development
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

# Remove ctrl-s and ctrl-q screen pause/resume functionality on terminal
stty -ixon


# Use fzf for awesome fuzzy completion!
# https://github.com/junegunn/fzf
if [ -f ~/.fzf.bash ]; then
    source ~/.fzf.bash
fi

# Use sensible bash options
if [ -f ~/.sensible.bash ]; then
    source ~/.sensible.bash
fi

# Let man pages use less color highlighting.
# This fixes man page highlighting in tmux: http://stackoverflow.com/a/22202558
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;016m\E[48;5;220m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# If there are additional .bash scripts, let's make sure to source them.
for f in ~/.bash.d/.*
do
    [ -f $f ] && source $f
done

# Let installed pip --user programs be executed
export PATH="$PATH:$HOME/.local/bin/"
