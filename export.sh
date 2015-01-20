#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

cp "$DIR/airline_molokai.vim" "$HOME/.vim/bundle/vim-airline/autoload/airline/themes/molokai.vim"
cp "$DIR/.bashrc" "$HOME/.bashrc"
cp "$DIR/.dircolors" "$HOME/.dircolors"
cp "$DIR/molokai.vim" "$HOME/.vim/colors/molokai.vim"
cp "$DIR/TerminalAwesomeness.ttf" "/usr/local/share/fonts/TerminalAwesomeness.ttf" 2>/dev/null || :
cp "$DIR/TerminalAwesomeness.ttf" "/usr/share/fonts/TerminalAwesomeness.ttf" 2>/dev/null || :
cp "$DIR/.tmux.conf" "$HOME/.tmux.conf"
cp "$DIR/tmux_tempr.sh" "$HOME/scripts/tmux_tempr.sh"
cp "$DIR/.vimrc" "$HOME/.vimrc"
