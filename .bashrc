# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# Mechanical Turk
export MTURK_SDK_HOME=/var/www/temp/turk_test/

# For Open NLP
export JAVA_HOME=/usr

# Add to PATH env var
export PATH=/usr/local/bin:$PATH

# Path for golang
export GOROOT=/usr/share/go/
export GOPATH=/usr/share/go/

# Nice SVN commits
export SVN_EDITOR='vim -c "4,\$y" -c "vnew" -c "put" -c "set syntax=diff buftype=nofile nowrap nobackup previewwindow bufhidden=delete" -c "silent execute \"%!cut -c-5 --complement | xargs svn diff --no-diff-deleted -x --ignore-eol-style\" | redraw" +0'

# My quick_scripts
alias exist="sh ~/quick_scripts/exist.sh "
alias ncl="nc -l -p"
alias apache="sudo /etc/init.d/apache2"
alias beep="echo -e '\a'"
alias tmux="tmux -u"
alias tl="tmux list-sessions"
alias pro=swipl
alias sudo="sudo "
alias woodo="/home/kenny/sandbox/woodo/woodo.sh"
alias git="/home/kenny/hub/hub"
alias less=/usr/share/vim/vim74/macros/less.sh
alias ifconfig="ifconfig|sed 's/inet addr:\([0-9.]*\)/inet addr:[1;37;48;5;19m\1[0;39;49m/'"
alias lisp="sbcl"
alias lisp_load="sbcl --load"
alias tatt="tmux attach-session -t"
# Tab complete Tmux sessions
tmuxComplete(){
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "$(tmux list-sessions | cut -d: -f1 | paste -s -d ' ' -)" -- $cur) )
}
complete -F tmuxComplete tatt

function search(){
	srchpth=".";
	if [ "$2" ]; then
		srchpth=$2;
	fi;
	grep -lr "$1" $srchpth\
		| grep -v 'svn'\
		| grep -v '.swp$'\
		| sed 's/\/\([^\/]*\)$/\/[1m\1[0m/';
	echo -e '\a';
}
function searchi(){
	srchpth=".";
	if [ "$2" ]; then
		srchpth=$2;
	fi;
	grep -ilr "$1" $srchpth\
		| grep -v 'svn'\
		| grep -v '.swp$'\
		| sed 's/\/\([^\/]*\)$/\/[1m\1[0m/';
	echo -e '\a';
}
function searchv(){
	srchpth=".";
	if [ "$2" ]; then
		srchpth=$2;
	fi;
	vim -o "+/$1"\
		$(grep -lr "$1" $srchpth\
			| grep -v 'svn'\
			| grep -v '.swp$'\
		);
}
function fnd(){
	fndpth=".";
	if [ "$2" ]; then
		fndpth=$2;
	fi;
	find $fndpth -name *$1*\
		| grep -v '\.svn'\
		| sed 's/\/\([^\/]*\)$/\/[1m\1[0m/'\
		| sed 's/$/[0;39m/';
	echo -e '\a';
}
function fndv(){
	fndpth=".";
	if [ "$2" ]; then
		fndpth=$2;
	fi;
	vim -o\
		$(find $fndpth -name "*$1*"\
			| grep -v '\.svn'\
			| grep -v '\.swp$'\
		);
}
function blameLine(){
	svn blame $1\
		| sed =\
		| sed 'N;s/\n/ /'\
		| sed -n $(($2-2)),$(($2+2))p\
		| sed 's/^\([[:digit:]]*\)\ *\([[:digit:]]*\)\(\ *[^ ]*\)\ /[33m\1[39m (\2) [31m\3[39m /';
}
function update(){
	svnpth=".";
	if [ "$1" ]; then
		svnpth=$1;
	fi;
	echo '[36m';
	date +--%l:%M%P--;
	echo '[39m';
	svn update $svnpth\
		| grep -v '^Updating'\
		| sed 's/^A/[32mA/'\
		| sed 's/^U/[33mU/'\
		| sed 's/^D/[38;5;241mD/'\
		| sed 's/^G/[36mG/'\
		| sed 's/^C/[31mC/'\
		| sed 's/^\?/[37m?/'\
		| sed 's/$/[0;39m/';
	echo -e '\a';
}
function st(){
	svnpth=".";
	if [ "$1" ]; then
		svnpth=$1;
	fi;
	svn st $svnpth\
		| sed 's/^A[ +]*/[32mA /'\
		| sed 's/^M[ +]*/[33mM /'\
		| sed 's/^D[ +]*/[38;5;241mD /'\
		| sed 's/^C[ +]*/[31mC /'\
		| sed 's/^\?[ +]*/[1;32m? /'\
		| sed 's/$/[0;39m/';
}
function force_time(){
	read -p "Year (e.g. 2013): " SET_YEAR;
	read -p "Month (JAN-DEC): " SET_MONTH;
	read -p "Day (1-31): " SET_DAY;
	read -p "Time (e.g. 07:27:34): " SET_TIME;
	echo -n "New Date: [38;5;208m";
	sudo date -s "$SET_DAY $SET_MONTH $SET_YEAR $SET_TIME";
	echo -n "[39m";
}
function revert_time(){
	sudo /usr/sbin/hwclock -s;
	echo -n "Date reverted: [38;5;27m";
	date;
	echo -n "[39m";
}
function bar(){
	bar_width=$(tput cols);
	if [ $bar_width -ge 26 ]; then
		content_width=`expr $bar_width - 26`;
		printf "\n[32;49m[38;5;22;42m ###### [32;49m[4m   %-${content_width}s   [24m[38;5;22;42m ###### [32;49m[39;49m\n\n" "$1"; unset content_width;
	fi;
	unset bar_width;
}
function count(){
	X=0;
	while X=`expr $X + 1`; do
		sleep 1;
		echo $X;
	done;
}

# append to the history file, don't overwrite it
shopt -s histappend

# fuzzy match history
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[38;5;118m\]\u@\[\033[4;31m\]\h\[\033[0;38;5;118m\]:\w\$\[\033[0;37m\] '
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

#Colors!!!
if [ -z "$TMUX" ]; then
    export TERM=xterm-256color
else
    export TERM=screen-256color
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b ~/.dircolors`"
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
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
