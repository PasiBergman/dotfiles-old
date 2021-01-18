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

git_pull() {
    cd $1
    echo "---------------------------------------------------"
    echo $1
    echo "---------------------------------------------------"
    git pull
}

[ -d $HOME/.config/nvim ] && git_pull $HOME/.config/nvim
[ -d $HOME/.config/tmux ] && git_pull $HOME/.config/tmux
[ -d $HOME/.config/i3 ] && git_pull $HOME/.config/i3
[ -d $HOME/.config/termite ] && git_pull $HOME/.config/termite
[ -d $HOME/.config/zsh ] && git_pull $HOME/.config/zsh
[ -d $HOME/.config/alacritty ] && git_pull $HOME/.config/alacritty

cd $CURRENT_DIR

