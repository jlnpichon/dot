# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

source /home/jpichon/.bash_colors

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

color_prompt=yes
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

BASE16_SHELL="$HOME/.config/base16-shell/base16-mocha.dark.sh"
if [ -s "$BASE16_SHELL" ]; then
        source $BASE16_SHELL
fi

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
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

NODE_PATH=$(find ~/local -path */node*/lib/node_modules -print | head -n 1)
EDITOR=vim
GIT_EDITOR=vim
VISUAL=vim

set -o vi

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
for i in $HOME/local/*; do
        [ -d $i/bin ] && PATH="${i}/bin:${PATH}"
        [ -d $i/usr/bin ] && PATH="${i}/usr/bin:${PATH}"
        [ -d $i/include ] && CPATH="${i}/include:${CPATH}"
        [ -d $i/lib ] && LD_LIBRARY_PATH="${i}/lib:${LD_LIBRARY_PATH}" && LIBRARY_PATH="${i}/lib:${LIBRARY_PATH}"
        [ -d $i/lib/pkgconfig ] && PKG_CONFIG_PATH="${i}/lib/pkgconfig:${PKG_CONFIG_PATH}"
        [ -d $i/share/man/man7 ] && MANPATH="${i}/share/man3:${MANPATH}"
        [ -d $i/share/man/man3 ] && MANPATH="${i}/share/man7:${MANPATH}"
done

export CPATH=$CPATH
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH
export LIBRARY_PATH=$LIBRARY_PATH

# {{{
# Node Completion - Auto-generated, do not touch.
#shopt -s progcomp
#for f in $(command ls ~/.node-completion); do
#        f="$HOME/.node-completion/$f"
#        test -f "$f" && . "$f"
#done
# }}}

export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'
export EDITOR=vim
export GOROOT=/home/jpichon/local/go
export PATH=$PATH:$GOROOT/bin


#LIBGL_DRIVERS_PATH=/home/jpichon/sources/mesa-10.5.4/lib/ LIBGL_DEBUG=verbose LD_LIBRARY_PATH=/home/jpichon/sources/mesa-10.5.4/lib EGL_DRIVERS_PATH=/home/jpichon/sources/mesa-10.5.4/lib/ EGL_LOG_LEVEL=debug MESA_GL_VERSION_OVERRIDE=3.3 MESA_GLSL_VERSION_OVERRIDE=330

export NVM_DIR="/home/jpichon/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
