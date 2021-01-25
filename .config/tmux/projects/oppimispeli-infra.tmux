#!/usr/bin/env bash

PROJECT_DIR="$HOME/Code/Keva/Tyokykypolkuja.Infra"
SESSION_NAME="Peli-Infr"
WINDOW_NAME="Nvim"

TMUX_SESSIONS=`tmux list-sessions | grep $SESSION_NAME -c`

if [[ "$OSTYPE" == "darwin"* ]]; then
    open "https://keva.visualstudio.com/Tyokykypolkuja/_backlogs/backlog/Tyokykypolkuja%20Team/Backlog%20items"
fi

if [[ "$TMUX_SESSIONS" == "0" ]]; then
    tmux start-server
    tmux new-session -s $SESSION_NAME -n $WINDOW_NAME -c $PROJECT_DIR \; \
        attach-session -t . -c $PROJECT_DIR \; \
        send-keys "cd $PROJECT_DIR && nvim" C-m \; \
        split-window -h -p 30 \; \
        send-keys 'clear && git fetch --all' C-m \; \
        split-window -v -p 50 \; \
        send-keys 'clear' C-m \; \
        select-pane -t 0 \;
else
    tmux attach -t $SESSION_NAME
fi
