#!/usr/bin/env bash

PROJECT_DIR="$HOME/Code/Keva/Tyokykypolkuja-oppimispeli/Tyokykypolkuja.WebAPI"
SESSION_NAME="Peli-API"
WINDOW1_NAME="lvim"
WINDOW2_NAME="lazygit"
WINDOW3_NAME="xplr"
DEVOPS="https://keva.visualstudio.com/Tyokykypolkuja/_sprints/backlog/Tyokykypolkuja%20Team/Tyokykypolkuja/Sprint%2014"

TMUX_SESSIONS=$(tmux list-sessions | grep $SESSION_NAME -c)

if [[ "$TMUX_SESSIONS" == "0" ]]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        open $DEVOPS
    fi
    tmux start-server
    tmux new-session -s "$SESSION_NAME" -n "$WINDOW1_NAME" -c "$PROJECT_DIR" \; \
        attach-session -t . -c "$PROJECT_DIR" \; \
        send-keys "cd $PROJECT_DIR && lvim" C-m \; \
        split-window -v -p 15 \; \
        send-keys 'clear && git fetch --all' C-m \; \
        split-window -h -p 50 \; \
        send-keys 'clear' C-m \; \
        new-window -c "$PROJECT_DIR" -n "$WINDOW2_NAME" /usr/local/bin/zsh \; \
        send-keys "$WINDOW2_NAME" C-m \; \
        new-window -c "$PROJECT_DIR" -n "$WINDOW3_NAME" /usr/local/bin/zsh \; \
        send-keys $WINDOW3_NAME C-m \; \
        select-window -t "$WINDOW1_NAME" \; \
        select-pane -t 0 \;
else
    tmux attach -t $SESSION_NAME
fi
