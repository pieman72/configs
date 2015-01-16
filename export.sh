#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

cp "$DIR/airline_molokai.vim" "$HOME/.vim/bundle/vim-airline/autoload/airline/themes/molokai.vim"
cp "$DIR/.bashrc" "$HOME/.bashrc"
cp "$DIR/.dircolors" "$HOME/.dircolors"
cp "$DIR/molokai.vim" "$HOME/.vim/colors/molokai.vim"
cp "$DIR/TerminalAwesomeness.ttf" "$HOME/TerminalAwesomeness.ttf"
cp "$DIR/.tmux.conf" "$HOME/.tmux.conf"
cp "$DIR/tmux_tempr.sh" "$HOME/tmux_tempr.sh"
cp "$DIR/.vimrc" "$HOME/.vimrc"
