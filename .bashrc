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

# Add to LD_LIBRARY_PATH env var
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

# Path for golang
export GOROOT=/usr/share/go/
export GOPATH=/usr/share/go/

# Nice SVN commits
export SVN_EDITOR='vim -c "4,\$y" -c "vnew" -c "put" -c "set syntax=diff buftype=nofile nowrap nobackup previewwindow bufhidden=delete" -c "silent execute \"%!cut -c-5 --complement | xargs svn diff --no-diff-deleted -x --ignore-eol-style\" | redraw" +0'

# My quick_scripts
alias ncl="nc -l -p"
alias apache="sudo /etc/init.d/apache2"
alias beep="echo -n -e '\a'"
alias tm="tmux -u"
alias tl="tmux list-sessions"
alias ta="tmux -u attach-session -t"
alias pro=swipl
alias sudo="sudo "
alias woodo="/home/kenny/sandbox/woodo/woodo.sh"
alias git="/usr/local/bin/hub"
alias less=/usr/share/vim/vim74/macros/less.sh
alias ifconfig="ifconfig|sed 's/inet addr:\([0-9.]*\)/inet addr:[1;37;48;5;19m\1[0;39;49m/'"
alias lisp="sbcl"
alias lisp_load="sbcl --load"
alias configs_export="~/configs/export.sh"
alias configs_import="~/configs/import.sh"
# Tab complete Tmux sessions
tmuxComplete(){
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "$(tmux list-sessions | cut -d: -f1 | paste -s -d ' ' -)" -- $cur) )
}
complete -F tmuxComplete ta

function search(){
	srchpth=".";
	if [ "$2" ]; then
		srchpth=$2;
	fi;
	grep -lr "$1" $srchpth\
		| grep -v 'svn'\
		| grep -v '\.git/'\
		| grep -v '\.swp$'\
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
		| grep -v '\.git/'\
		| grep -v '\.swp$'\
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
			| grep -v '\.git/'\
			| grep -v '\.swp$'\
		);
}
function fnd(){
	fndpth=".";
	if [ "$2" ]; then
		fndpth=$2;
	fi;
	find $fndpth -name *$1*\
		| grep -v '\.svn'\
		| grep -v '\.git/'\
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
			| grep -v '\.git/'\
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
function hex_to_ansi(){
	# Get the individual color components as decimals
	HEX=$(echo "$1" | tr -d '#' | tr '[:lower:]' '[:upper:]')
	DIGITS=$(( ${#HEX} / 3 ))
	R=$(( 16#${HEX:$(( DIGITS * 0 )):$DIGITS} ))
	G=$(( 16#${HEX:$(( DIGITS * 1 )):$DIGITS} ))
	B=$(( 16#${HEX:$(( DIGITS * 2 )):$DIGITS} ))

	# Handle grey ramp
	if [ "`echo $(( R-G )) | tr -d '-'`" -lt 16 ]\
			&& [ "`echo $(( R-B )) | tr -d '-'`" -lt 16 ]\
			&& [ "`echo $(( G-B )) | tr -d '-'`" -lt 16 ]; then
		GREY=$(( (R+G+B)/3 ))
		if [ "$GREY" -lt 5 ]; then CC="0"
		elif [ "$GREY" -gt 246 ]; then CC=15
		else CC=$(( (GREY-3)/10 + 232 )); fi

	# Handle 16 basic colors
	elif [ "`echo $(( R-0 )) | tr -d '-'`" -lt 24 ]\
			&& [ "`echo $(( G-0 )) | tr -d '-'`" -lt 24 ]\
			&& [ "`echo $(( B-0 )) | tr -d '-'`" -lt 24 ]; then
		CC="0"
	elif [ "`echo $(( R-128 )) | tr -d '-'`" -lt 14 ]\
			&& [ "`echo $(( G-0 )) | tr -d '-'`" -lt 24 ]\
			&& [ "`echo $(( B-0 )) | tr -d '-'`" -lt 24 ]; then
		CC=1
	elif [ "`echo $(( R-0 )) | tr -d '-'`" -lt 24 ]\
			&& [ "`echo $(( G-128 )) | tr -d '-'`" -lt 14 ]\
			&& [ "`echo $(( B-0 )) | tr -d '-'`" -lt 24 ]; then
		CC=2
	elif [ "`echo $(( R-128 )) | tr -d '-'`" -lt 14 ]\
			&& [ "`echo $(( G-128 )) | tr -d '-'`" -lt 14 ]\
			&& [ "`echo $(( B-0 )) | tr -d '-'`" -lt 24 ]; then
		CC=3
	elif [ "`echo $(( R-0 )) | tr -d '-'`" -lt 24 ]\
			&& [ "`echo $(( G-0 )) | tr -d '-'`" -lt 24 ]\
			&& [ "`echo $(( B-128 )) | tr -d '-'`" -lt 14 ]; then
		CC=4
	elif [ "`echo $(( R-128 )) | tr -d '-'`" -lt 14 ]\
			&& [ "`echo $(( G-0 )) | tr -d '-'`" -lt 24 ]\
			&& [ "`echo $(( B-128 )) | tr -d '-'`" -lt 14 ]; then
		CC=5
	elif [ "`echo $(( R-0 )) | tr -d '-'`" -lt 24 ]\
			&& [ "`echo $(( G-128 )) | tr -d '-'`" -lt 14 ]\
			&& [ "`echo $(( B-128 )) | tr -d '-'`" -lt 14 ]; then
		CC=6
	elif [ "`echo $(( R-192 )) | tr -d '-'`" -lt 18 ]\
			&& [ "`echo $(( G-192 )) | tr -d '-'`" -lt 18 ]\
			&& [ "`echo $(( B-192 )) | tr -d '-'`" -lt 18 ]; then
		CC=7
	elif [ "`echo $(( R-128 )) | tr -d '-'`" -lt 14 ]\
			&& [ "`echo $(( G-128 )) | tr -d '-'`" -lt 14 ]\
			&& [ "`echo $(( B-128 )) | tr -d '-'`" -lt 14 ]; then
		CC=8
	elif [ "`echo $(( R-255 )) | tr -d '-'`" -lt 10 ]\
			&& [ "`echo $(( G-128 )) | tr -d '-'`" -lt 14 ]\
			&& [ "`echo $(( B-128 )) | tr -d '-'`" -lt 14 ]; then
		CC=9
	elif [ "`echo $(( R-128 )) | tr -d '-'`" -lt 14 ]\
			&& [ "`echo $(( G-255 )) | tr -d '-'`" -lt 10 ]\
			&& [ "`echo $(( B-128 )) | tr -d '-'`" -lt 14 ]; then
		CC=10
	elif [ "`echo $(( R-255 )) | tr -d '-'`" -lt 10 ]\
			&& [ "`echo $(( G-255 )) | tr -d '-'`" -lt 10 ]\
			&& [ "`echo $(( B-128 )) | tr -d '-'`" -lt 14 ]; then
		CC=11
	elif [ "`echo $(( R-128 )) | tr -d '-'`" -lt 14 ]\
			&& [ "`echo $(( G-128 )) | tr -d '-'`" -lt 14 ]\
			&& [ "`echo $(( B-255 )) | tr -d '-'`" -lt 10 ]; then
		CC=12
	elif [ "`echo $(( R-255 )) | tr -d '-'`" -lt 10 ]\
			&& [ "`echo $(( G-128 )) | tr -d '-'`" -lt 14 ]\
			&& [ "`echo $(( B-255 )) | tr -d '-'`" -lt 10 ]; then
		CC=13
	elif [ "`echo $(( R-128 )) | tr -d '-'`" -lt 14 ]\
			&& [ "`echo $(( G-255 )) | tr -d '-'`" -lt 10 ]\
			&& [ "`echo $(( B-255 )) | tr -d '-'`" -lt 10 ]; then
		CC=14
	elif [ "`echo $(( R-255 )) | tr -d '-'`" -lt 10 ]\
			&& [ "`echo $(( G-255 )) | tr -d '-'`" -lt 10 ]\
			&& [ "`echo $(( B-255 )) | tr -d '-'`" -lt 10 ]; then
		CC=15

	# Handle 6x6x6 color cube
	else
		CC=16
		if [ "$R" -lt 48 ]; then :
		elif [ "$R" -lt 115 ]; then CC=$(( CC+(36*1) ))
		elif [ "$R" -lt 156 ]; then CC=$(( CC+(36*2) ))
		elif [ "$R" -lt 196 ]; then CC=$(( CC+(36*3) ))
		elif [ "$R" -lt 235 ]; then CC=$(( CC+(36*4) ))
		else CC=$(( CC+(36*5) )); fi
		if [ "$G" -lt 48 ]; then :
		elif [ "$G" -lt 115 ]; then CC=$(( CC+(6*1) ))
		elif [ "$G" -lt 156 ]; then CC=$(( CC+(6*2) ))
		elif [ "$G" -lt 196 ]; then CC=$(( CC+(6*3) ))
		elif [ "$G" -lt 235 ]; then CC=$(( CC+(6*4) ))
		else CC=$(( CC+(6*5) )); fi
		if [ "$B" -lt 48 ]; then :
		elif [ "$B" -lt 115 ]; then CC=$(( CC+1 ))
		elif [ "$B" -lt 156 ]; then CC=$(( CC+2 ))
		elif [ "$B" -lt 196 ]; then CC=$(( CC+3 ))
		elif [ "$B" -lt 235 ]; then CC=$(( CC+4 ))
		else CC=$(( CC+5 )); fi
	fi

	# Use the color for either background or foreground
	if [ -z "$2" ]; then
		echo "[38;5;"$CC"m"
	else
		echo "[48;5;"$CC"m"
	fi
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
    export TERMCAP=xterm-256color
	export TERMINFO=/lib/terminfo/x/xterm-256color
else
    export TERM=screen-256color
    export TERMCAP=screen-256color
	export TERMINFO=/lib/terminfo/s/screen-256color
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
