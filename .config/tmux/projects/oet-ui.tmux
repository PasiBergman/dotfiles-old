#!/usr/bin/env bash

PROJECT_DIR="$HOME/Code/Keva/oet-ui"
SESSION_NAME="OET-UI"
WINDOW_NAME="nvim"

TMUX_SESSIONS=`tmux list-sessions | grep $SESSION_NAME -c`

if [[ "$OSTYPE" == "darwin"* ]]; then
    open "https://keva.visualstudio.com/Verkkopalvelut%20-%20OET%202.0/_sprints/backlog/Verkkopalvelut%20-%20OET%202.0%20Team/Verkkopalvelut%20-%20OET%202.0/Sprint%205"
fi

if [[ "$TMUX_SESSIONS" == "0" ]]; then
    tmux start-server
    tmux new-session -s $SESSION_NAME -n $WINDOW_NAME -c $PROJECT_DIR \; \
        attach-session -t . -c $PROJECT_DIR \; \
        send-keys "cd $PROJECT_DIR && nvim" C-m \; \
        split-window -h -p 25 \; \
        send-keys 'clear && git fetch --all' C-m \; \
        split-window -v -p 50 \; \
        send-keys 'clear' C-m \; \
        select-pane -t 0 \;
else
    tmux attach -t $SESSION_NAME
fi
