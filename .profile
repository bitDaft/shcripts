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

# custom profile additions

# add my custom scripts file to path
if [ -d "$HOME/repos/shcripts" ]; then
   PATH="$HOME/repos/shcripts:$PATH"
   PATH="$HOME/repos/shcripts/utils:$PATH"
   PATH="$HOME/repos/shcripts/sound:$PATH"
   PATH="$HOME/repos/shcripts/screen:$PATH"
   PATH="$HOME/repos/shcripts/bluetooth:$PATH"
   PATH="$HOME/repos/shcripts/_torrentor/bin:$PATH"
   PATH="$HOME/repos/shcripts/browserinfo/bin:$PATH"
   PATH="$HOME/repos/shcripts/wifi:$PATH"
   PATH="$HOME/repos/shcripts/dev:$PATH"
fi

#alias pls="sudo "

export SHELL=/usr/bin/zsh
export EDITOR=/usr/bin/vim
export SUDO_ASKPASS=$HOME/repos/shcripts/askpass
export TERM=st
export NNN_FIFO=/tmp/nnn.fifo
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/Downloads/kafka_2.13-3.3.1/bin

pgrep i3 || startx
