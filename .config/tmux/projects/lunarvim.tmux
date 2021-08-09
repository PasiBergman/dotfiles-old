#!/usr/bin/env bash

PROJECT_DIR="$HOME/Code/LunarVim/LunarVim"
SESSION_NAME="LunarVim"
WINDOW1_NAME="lvim"

TMUX_SESSIONS=$(tmux list-sessions | grep $SESSION_NAME -c)

if [[ "$TMUX_SESSIONS" == "0" ]]; then
    tmux start-server
    tmux new-session -s $SESSION_NAME -n $WINDOW1_NAME -c "$PROJECT_DIR" \; \
        attach-session -t . -c "$PROJECT_DIR" \; \
        send-keys $WINDOW1_NAME C-m \; \
        new-window -c "$PROJECT_DIR" /usr/local/bin/zsh \; \
        new-window -c "$PROJECT_DIR" /usr/local/bin/zsh \; \
        select-window -t "$WINDOW1_NAME" \; \
        select-pane -t 0 \;
else
    tmux attach -t $SESSION_NAME
fi
