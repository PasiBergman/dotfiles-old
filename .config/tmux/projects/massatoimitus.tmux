#!/usr/bin/env bash

PROJECT_DIR="$HOME/Code/Keva/Avaintiedot-Massatoimitus"
SESSION_NAME="Massatoimitus"
WINDOW_NAME="nvim"
DEVOPS="https://keva.visualstudio.com/Verkkopalvelut-Avaintiedot/_sprints/backlog/Verkkopalvelut-Avaintiedot%20Team/Verkkopalvelut-Avaintiedot/Sprint_48"

TMUX_SESSIONS=`tmux list-sessions | grep $SESSION_NAME -c`

if [[ "$TMUX_SESSIONS" == "0" ]]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        open $DEVOPS
    fi
    tmux start-server
    tmux new-session -s $SESSION_NAME -n $WINDOW_NAME -c $PROJECT_DIR \; \
        attach-session -t . -c $PROJECT_DIR \; \
        send-keys "cd $PROJECT_DIR && nvim" C-m \; \
        split-window -v -p 15 \; \
        send-keys 'clear && git fetch --all && cd ./src/Massatoimitus.UI' C-m \; \
        send-keys 'npm run serve' C-m \; \
        split-window -h -p 50 \; \
        send-keys 'clear' C-m \; \
        send-keys 'dotnet watch --project ./src/Massatoimitus.API run' C-m \; \
        select-pane -t 0 \;
else
    tmux attach -t $SESSION_NAME
fi
