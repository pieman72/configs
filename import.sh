#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

cp "$HOME/.vim/bundle/vim-airline/autoload/airline/themes/molokai.vim" "$DIR/airline_molokai.vim"
cp "$HOME/.bashrc" "$DIR/.bashrc"
cp "$HOME/.dircolors" "$DIR/.dircolors"
cp "$HOME/.vim/colors/molokai.vim" "$DIR/molokai.vim"
cp "/usr/local/share/fonts/TerminalAwesomeness.ttf" "$DIR/TerminalAwesomeness.ttf" 2>/dev/null || :
cp "/usr/share/fonts/TerminalAwesomeness.ttf" "$DIR/TerminalAwesomeness.ttf" 2>/dev/null || :
cp "$HOME/.tmux.conf" "$DIR/.tmux.conf"
cp "$HOME/scripts/tmux_tempr.sh" "$DIR/tmux_tempr.sh"
cp "$HOME/scripts/layout.tmux" "$DIR/layout.tmux"
cp "$HOME/.vimrc" "$DIR/.vimrc"
cp "$HOME/.muttrc" "$DIR/.muttrc"
cp "$HOME/.mailcap" "$DIR/.mailcap"
cp "$HOME/.procmailrc" "$DIR/.procmailrc"
cp "$HOME/.elinks/elinks.conf" "$DIR/.elinks/elinks.conf"
cp "$HOME/.elinks/user.css" "$DIR/.elinks/user.css"
cp -R "$HOME/.terminfo/"* "$DIR/.terminfo"
