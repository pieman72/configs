#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

function prompt_replace(){
	if [ ! -e "$2" ]; then
		cp "$1" "$2"
	elif [ -f "$2" ]; then
		read -r -p " * File '$2' exists. Overwrite? [y/N] " clobber
		if [[ ${clobber,,} =~ ^(yes|y)$ ]]; then
			cp -f "$1" "$2"
		fi
	fi
}

# Git
echo -e "\n\e[38;5;248m--- Exporting git configs\e[39m"
echo "cURL"
if [ -z "$(which curl)" ]; then sudo apt-get install curl; fi
echo "Ruby"
if [ -z "$(which ruby)" ]; then sudo apt-get install ruby; fi
echo "hub"
if [ ! -f "/usr/local/bin/hub" ]; then
	sudo curl -Lo /usr/local/bin/hub --silent https://hub.github.com/standalone
	sudo chmod 755 /usr/local/bin/hub
fi

# Bash
echo -e "\n\e[38;5;118m--- Exporting bash configs\e[39m"
echo ".bashrc"
prompt_replace "$DIR/.bashrc" "$HOME/.bashrc"
echo ".dircolors"
prompt_replace "$DIR/.dircolors" "$HOME/.dircolors"
echo ".terminfo"
cp -R -n "$DIR/.terminfo" "$HOME/.terminfo"

# Fonts
echo -e "\n\e[38;5;81m--- Exporting fonts\e[39m"
echo "TerminalAwesomeness.ttf"
prompt_replace "$DIR/TerminalAwesomeness.ttf" "/usr/local/share/fonts/TerminalAwesomeness.ttf" 2>/dev/null || :
prompt_replace "$DIR/TerminalAwesomeness.ttf" "/usr/share/fonts/TerminalAwesomeness.ttf" 2>/dev/null || :

# Vim
echo -e "\n\e[38;5;161m--- Exporting vim configs\e[39m"
echo "Vim"
if [ -z "$(which vim)" ]; then sudo apt-get install vim; fi
echo ".vim"
if [ ! -d "$HOME/.vim" ]; then mkdir "$HOME/.vim"; fi
echo ".vim/colors"
if [ ! -d "$HOME/.vim/colors" ]; then mkdir "$HOME/.vim/colors"; fi
echo ".vimrc"
prompt_replace "$DIR/.vimrc" "$HOME/.vimrc"
echo "molokai.vim"
prompt_replace "$DIR/molokai.vim" "$HOME/.vim/colors/molokai.vim"
echo "Vundle"
if [ ! -d "$HOME/.vim/bundle" ]; then git clone https://github.com/gmarik/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"; fi
read -r -p " * Would you like to install/update Vim plugins? [y/N] " update
if [[ ${update,,} =~ ^(yes|y)$ ]]; then vim +PluginInstall "$HOME/.vimrc"; fi
echo "vim-airline:molokai.vim"
prompt_replace "$DIR/airline_molokai.vim" "$HOME/.vim/bundle/vim-airline/autoload/airline/themes/molokai.vim"

# Tmux
echo -e "\n\e[38;5;135m--- Exporting tmux configs\e[39m"
echo "tmux"
if [ -z "$(which tmux)" ]; then sudo apt-get install tmux; fi
echo ".tmux.conf"
prompt_replace "$DIR/.tmux.conf" "$HOME/.tmux.conf"
echo "scripts"
if [ ! -d "$HOME/scripts" ]; then mkdir "$HOME/scripts"; fi
echo "tmux_tempr.sh"
prompt_replace "$DIR/tmux_tempr.sh" "$HOME/scripts/tmux_tempr.sh"

# Mutt
echo -e "\n\e[38;5;208m--- Exporting mutt configs\e[39m"
echo "mail"
if [ -z "$(which mail)" ]; then sudo apt-get install mail; fi
echo "mutt"                                              
if [ -z "$(which mutt)" ]; then sudo apt-get install mutt; fi
echo ".muttrc"
prompt_replace "$DIR/.muttrc" "$HOME/.muttrc"
echo ".mailcap"
prompt_replace "$DIR/.mailcap" "$HOME/.mailcap"
echo ".elinks"
if [ ! -d "$HOME/.elinks" ]; then mkdir "$HOME/.elinks"; fi
echo "elinks.conf"
prompt_replace "$DIR/.elinks/elinks.conf" "$HOME/.elinks/elinks.conf"
echo "user.css"
prompt_replace "$DIR/.elinks/user.css" "$HOME/.elinks/user.css"

# Done
echo -e "\n--- All done! Please source your .bashrc ---\n"
