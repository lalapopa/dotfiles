# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;94m\]\u@\h\[\033[94m\]\[\033[01;94m\](\W)\[\033[0m\]\[\033[1;31m\]$\[\e[m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:(\W)\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
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

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

##########
#  path  #
##########

# plantuml
export PLANTUML_JAR="/usr/local/plantuml/plantuml.jar"
export GRAPHVIZ_DOT="/usr/bin/dot"

# perl 
export PATH="/home/lalapopa/perl5/bin${PATH:+:${PATH}}"
export PERL5LIB="/home/lalapopa/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="/home/lalapopa/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_MB_OPT="--install_base \"/home/lalapopa/perl5\""
export PERL_MM_OPT="INSTALL_BASE=/home/lalapopa/perl5"

# texlive 
export MANPATH="$MANPATH:/usr/local/texlive/2023/texmf-dist/doc/man"
export INFOPATH="$INFOPATH:/usr/local/texlive/2023/texmf-dist/doc/info"
export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"

# go
export PATH="$PATH:/usr/local/go/bin"

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"


#############
#  exports  #
#############

export PROMPT_COMMAND="history -a; history -n"

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

###########
#  alias  #
###########

alias envact="source ./env/bin/activate"
alias c=clear
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

###########
#  other  #
###########

set -o vi

if [ -x $HOME/.pyenv/bin/pyenv ]; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

