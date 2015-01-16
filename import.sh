#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

cp "$HOME/.vim/bundle/vim-airline/autoload/airline/themes/molokai.vim" "$DIR/airline_molokai.vim"
cp "$HOME/.bashrc" "$DIR/.bashrc"
cp "$HOME/.dircolors" "$DIR/.dircolors"
cp "$HOME/.vim/colors/molokai.vim" "$DIR/molokai.vim"
cp "$HOME/TerminalAwesomeness.ttf" "$DIR/TerminalAwesomeness.ttf"
cp "$HOME/.tmux.conf" "$DIR/.tmux.conf"
cp "$HOME/tmux_tempr.sh" "$DIR/tmux_tempr.sh"
cp "$HOME/.vimrc" "$DIR/.vimrc"
