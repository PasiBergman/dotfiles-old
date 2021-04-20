#!/usr/bin/env bash

PROJECT_DIR="$HOME/Code/Keva/Tyokykypolkuja.Infra"
SESSION_NAME="Peli-Infr"
WINDOW_NAME="Nvim"
DEVOPS="https://keva.visualstudio.com/Tyokykypolkuja/_sprints/backlog/Tyokykypolkuja%20Team/Tyokykypolkuja/Sprint%2013"

TMUX_SESSIONS=$(tmux list-sessions | grep $SESSION_NAME -c)

if [[ "$TMUX_SESSIONS" == "0" ]]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        open $DEVOPS
    fi
    tmux start-server
    tmux new-session -s "$SESSION_NAME" -n "$WINDOW_NAME" -c "$PROJECT_DIR" \; \
        attach-session -t . -c "$PROJECT_DIR" \; \
        send-keys "cd $PROJECT_DIR && nvim" C-m \; \
        split-window -v -p 15 \; \
        send-keys 'clear && git fetch --all' C-m \; \
        split-window -h -p 50 \; \
        send-keys 'clear' C-m \; \
        select-pane -t 0 \;
else
    tmux attach -t $SESSION_NAME
fi
