#!/usr/bin/env bash

PROJECT_DIR="$HOME/VimWiki"
SESSION_NAME="VimWiki"
WINDOW_NAME="nvim"

TMUX_SESSIONS=`tmux list-sessions | grep $SESSION_NAME -c`

if [[ "$TMUX_SESSIONS" == "0" ]]; then
    tmux start-server
    tmux new-session -s $SESSION_NAME -n $WINDOW_NAME -c $PROJECT_DIR \; \
        attach-session -t . -c $PROJECT_DIR \; \
        send-keys "cd $PROJECT_DIR && nvim ./index.md" C-m \; \
        split-window -h -p 40 -c $PROJECT_DIR \; \
        send-keys 'clear && git fetch origin && git status' C-m \; \
        select-pane -t 0
else
    tmux attach -t $SESSION_NAME
fi
