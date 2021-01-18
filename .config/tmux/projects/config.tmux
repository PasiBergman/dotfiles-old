#!/usr/bin/env bash

PROJECT_DIR="$HOME/.config"
SESSION_NAME="Config"
WINDOW_NAME="nvim"

TMUX_SESSIONS=`tmux list-sessions | grep $SESSION_NAME -c`

if [[ "$TMUX_SESSIONS" == "0" ]]; then
    tmux start-server
    tmux new-session -s $SESSION_NAME -n $WINDOW_NAME -c $PROJECT_DIR \; \
        attach-session -t . -c $PROJECT_DIR \; \
        send-keys "cd $PROJECT_DIR && nvim" C-m \; \
        split-window -h -p 30 -c $PROJECT_DIR \; \
        send-keys 'clear' C-m \; \
        select-pane -t 0
else
    tmux attach -t $SESSION_NAME
fi
