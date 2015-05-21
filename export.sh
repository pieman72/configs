#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

if [ -z "$(which vim)" ]; then sudo apt-get install vim; fi
if [ ! -d "$HOME/.vim" ]; then mkdir "$HOME/.vim"; fi
if [ ! -d "$HOME/.vim/bundle" ]; then git clone https://github.com/gmarik/Vundle.vim.git "$HOME/.vim/bundle"; fi
cp "$DIR/airline_molokai.vim" "$HOME/.vim/bundle/vim-airline/autoload/airline/themes/molokai.vim"
cp "$DIR/.bashrc" "$HOME/.bashrc"
cp "$DIR/.dircolors" "$HOME/.dircolors"
cp "$DIR/molokai.vim" "$HOME/.vim/colors/molokai.vim"
cp "$DIR/TerminalAwesomeness.ttf" "/usr/local/share/fonts/TerminalAwesomeness.ttf" 2>/dev/null || :
cp "$DIR/TerminalAwesomeness.ttf" "/usr/share/fonts/TerminalAwesomeness.ttf" 2>/dev/null || :
cp "$DIR/.tmux.conf" "$HOME/.tmux.conf"
cp "$DIR/tmux_tempr.sh" "$HOME/scripts/tmux_tempr.sh"
cp "$DIR/.vimrc" "$HOME/.vimrc"
cp "$DIR/.muttrc" "$HOME/.muttrc"
cp "$DIR/.mailcap" "$HOME/.mailcap"
cp "$DIR/.elinks/elinks.conf" "$HOME/.elinks/elinks.conf"
cp "$DIR/.elinks/user.css" "$HOME/.elinks/user.css"
cp -R "$DIR/.terminfo" "$HOME/.terminfo"
source "$HOME/.bashrc"
