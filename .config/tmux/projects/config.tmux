#!/usr/bin/env bash

PROJECT_DIR="$HOME/.config"
SESSION_NAME="Config"
WINDOW1_NAME="nvim"
WINDOW2_NAME="lazygit"
WINDOW3_NAME="xplr"

TMUX_SESSIONS=$(tmux list-sessions | grep $SESSION_NAME -c)

if [[ "$TMUX_SESSIONS" == "0" ]]; then
    tmux start-server
    tmux new-session -s "$SESSION_NAME" -n "$WINDOW1_NAME" -c "$PROJECT_DIR" \; \
        attach-session -t . -c "$PROJECT_DIR" \; \
        send-keys $WINDOW1_NAME C-m \; \
        new-window -c "$PROJECT_DIR" -n "$WINDOW2_NAME" /usr/local/bin/zsh \; \
        send-keys "lazygit --git-dir=$HOME/.dotfiles --work-tree=$HOME" C-m \; \
        new-window -c "$PROJECT_DIR" -n "$WINDOW3_NAME" /usr/local/bin/zsh \; \
        send-keys $WINDOW3_NAME C-m \; \
        select-window -t "$WINDOW1_NAME" \; \
        select-pane -t 0 \;
else
    tmux attach -t $SESSION_NAME
fi
