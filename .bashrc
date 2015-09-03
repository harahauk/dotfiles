# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
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

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

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
#so damn hard to remember the case
alias vboxmanage='VBoxManage'
export PATH=${PATH}:~/git/android-sdk-mac_86/tools
#export JAVA_HOME=$(/usr/libexec/java_home)
alias targz='tar -pczf'
#easy tar syntax
alias untargz='tar xvfz'
alias untar='tar xvf'
alias cls='clear'
export EDITOR='vim'

# Terminal colours (after installing GNU coreutils)
#NM="\[\033[0;38m\]" #means no background and white line
NM="\[\033[0;38m\]" #means no background and white lines
HI="\[\033[0;37m\]" #change this for letter colors
SI="\[\033[0;33m\]" #this is for the current directory
IN="\[\033[0m\]"
HII="\[\033[0;33m\]"
DYN="\e]2;titlebar\a"
DYN="\e]2;\u@\h\a"

#decide color of hostname
# http://www.funtoo.org/en/articles/linux/tips/prompt/
if [ "$HOSTNAME" = "cerebdil" ]; then
    HII="\[\033[0;36m\]"
fi
if [ "$HOSTNAME" = "kenpachi" ]; then
    HII="\[\033[0;34m\]"
fi
if [ "$HOSTNAME" = "endscape" ]; then
    HII="\[\033[0;34m\]"
fi
if [ "$HOSTNAME" = "fenris" ]; then
    HII="\[\033[0;32m\]"
fi
if [ "$HOSTNAME" = "iris.hauknes.org" ]; then
    HII="\[\033[0;31m\]"
fi

export PS1="$NM[ $HI\u $HII\h $SI\w$NM ] $IN"
# $DYN"
#export PS1="$NM[ $HI\u $HII\h $SI\w$NM ] $IN$DYN"
#export PS1="\[\e]2;\u@\H \w\a\e[32;1m\]>\[\e[0m\] "
#export PS1="$NM[ $HI\u@$HII\h $SI\w$NM ]$ $IN"
if [ "$TERM" != "dumb" ] && [ "$OSTYPE" = "linux-gnu" ]; then
    export LS_OPTIONS='--color=auto'
    eval `dircolors -b ~/.dir_colors`
fi

# Useful aliases
#alias ls='ls --color=auto -hF'
#if in osx:
if [ -x /System/Library ]; then
    export PATH=/opt/local/bin:/opt/local/sbin:$PATH
    ## http://hocuspokus.net/2008/01/a-better-ls-for-mac-os-x
    export MANPATH=/opt/local/share/man:$MANPATH
    # Use self-compiled vim
    # http://blog.coredumped.org/2010/01/osx-vim-and-python.html
    #export EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim'
    #screw macvim, compile vim from the official repo
    alias flushdns='sudo dscacheutil -flushcache'
    if [ -x /usr/local/bin/vim ]; then
        export EDITOR='/usr/local/bin/vim'
    fi
    eval `gdircolors -b ~/.dir_colors` 
    alias vim='$EDITOR'
    alias locate='mdfind'
    alias umount='diskutil unmount'


    #Seems coreutils installed by macports need a g in fromt
    if [ -x /opt/local/bin/gls ]; then    
        alias ls='gls $LS_OPTIONS -hF'
        export LS_OPTIONS='--color=auto'
    fi
fi

test -r /sw/bin/init.sh && . /sw/bin/init.sh
#export ARCHFLAGS="-arch i386 -arch x86_64"
alias eclimd='~/Dropbox/dev/eclipse_osx64/eclimd'
alias rd='screen -rd'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH=$PATH:~/scripts
alias ircitea='ssh -f harahauk@gina.itea.ntnu.no -L ircitea.hauknes.org:26667:irc.itea.ntnu.no:6667 -N'
alias beep='echo -e "\007"'
alias hsync='rsync -P --recursive --ignore-existing $@'
alias colog='ccze -A < $@|less -R'
alias siterip='wget -r --no-parent --reject "index.html*" $@'
alias p='ssh harahauk@poseidon.orakel.ntnu.no'
alias f='ssh sinzim@fenris.hauknes.org'
alias i='ssh sinzim@iris.hauknes.org'
alias o='open $@'
alias htopc='htop --sort-key PERCENT_CPU'
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="~/Library/Python/2.7/bin:$PATH"
#TODO source via the bashrc in the system, to allow for updating from other locs
export TERM="screen-256color"
