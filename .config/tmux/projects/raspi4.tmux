#!/usr/bin/env bash

PROJECT_DIR="$HOME"
SESSION_NAME="Raspi4"
WINDOW_NAME="ssh"

TMUX_SESSIONS=`tmux list-sessions | grep $SESSION_NAME -c`

if [[ "$TMUX_SESSIONS" == "0" ]]; then
    tmux start-server
    tmux new-session -s $SESSION_NAME -n $WINDOW_NAME -c $PROJECT_DIR \; \
        attach-session -t . -c $PROJECT_DIR \; \
        send-keys "cd $PROJECT_DIR && ssh raspi4" C-m \;
else
    tmux attach -t $SESSION_NAME
fi
