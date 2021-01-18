#!/bin/bash

CURRENT_DIR=$(pwd)

check_git_status() {
    cd $1
    GIT_CLEAN=$(git status 2>/dev/null | grep "nothing to commit, working tree clean" -c)
    if [ "$GIT_CLEAN" == "0" ]; then
        echo "---------------------------------------------------"
        echo $1
        echo "---------------------------------------------------"
        git status
        echo ""
    fi
}

[ -d $HOME/.config/nvim ] && check_git_status $HOME/.config/nvim
[ -d $HOME/.config/tmux ] && check_git_status $HOME/.config/tmux
[ -d $HOME/.config/i3 ] && check_git_status $HOME/.config/i3
[ -d $HOME/.config/termite ] && check_git_status $HOME/.config/termite
[ -d $HOME/.config/zsh ] && check_git_status $HOME/.config/zsh
[ -d $HOME/.config/alacritty ] && check_git_status $HOME/.config/alacritty

cd $CURRENT_DIR

