#!/usr/bin/env bash

PROJECT_DIR="$HOME/Code/Keva/oet-api"
SESSION_NAME="oet-api"
WINDOW1_NAME="nvim"
WINDOW2_NAME="lazygit"
DEVOPS="https://keva.visualstudio.com/Verkkopalvelut%20-%20OET%202.0/_sprints/backlog/Verkkopalvelut%20-%20OET%202.0%20Team/Verkkopalvelut%20-%20OET%202.0/Sprint%208"

TMUX_SESSIONS=$(tmux list-sessions | grep $SESSION_NAME -c)

if [[ "$TMUX_SESSIONS" == "0" ]]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        open $DEVOPS
    fi
    tmux start-server
    tmux new-session -s "$SESSION_NAME" -n "$WINDOW1_NAME" -c "$PROJECT_DIR" \; \
        attach-session -t . -c "$PROJECT_DIR" \; \
        send-keys "cd $PROJECT_DIR && $WINDOW1_NAME" C-m \; \
        split-window -v -p 15 \; \
        send-keys 'clear && git fetch --all' C-m \; \
        send-keys 'dotnet watch --project src/Skylla.BE.API run' C-m \; \
        split-window -h -p 50 \; \
        send-keys 'clear && cd ../oet-ui/' C-m \; \
        send-keys 'npm run serve' C-m \; \
        new-window -c "$PROJECT_DIR" -n "$WINDOW2_NAME" /usr/local/bin/zsh \; \
        send-keys "$WINDOW2_NAME" C-m \; \
        select-window -t "$WINDOW1_NAME" \; \
        select-pane -t 0 \;
else
    tmux attach -t $SESSION_NAME
fi
