# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export MANPATH="$MANPATH:/usr/local/texlive/2022/texmf-dist/doc/man"
export INFOPATH="$INFOPATH:/usr/local/texlive/2022/texmf-dist/doc/info"
export PATH="/usr/local/texlive/2022/bin/x86_64-linux:$PATH"
export PATH="$PATH:/usr/local/go/bin"

export PATH="/home/lalapopa/perl5/bin${PATH:+:${PATH}}"
export perl5lib="/home/lalapopa/perl5/lib/perl5${perl5lib:+:${perl5lib}}"
export perl_local_lib_root="/home/lalapopa/perl5${perl_local_lib_root:+:${perl_local_lib_root}}"
export perl_mm_opt="install_base=/home/lalapopa/perl5"
export PERL_MB_OPT="--install_base \"/home/lalapopa/perl5\""
export EDITOR="/usr/bin/vim"

