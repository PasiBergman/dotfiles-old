#!/usr/bin/env bash

PROJECT_DIR="$HOME/Documents/Garbage/"
SESSION_NAME="Daily"
WINDOW1_NAME="Notes"
WINDOW2_NAME="SQL"

SHELL_PATH="/opt/homebrew/bin/zsh"

TMUX_SESSIONS=$(tmux list-sessions | grep $SESSION_NAME -c)

if [[ "$TMUX_SESSIONS" == "0" ]]; then
	tmux start-server
	tmux new-session -s "$SESSION_NAME" -n "$WINDOW1_NAME" -c "$PROJECT_DIR" \; \
		attach-session -t . -c "$PROJECT_DIR" \; \
		send-keys 'lvim notes_2022.md' C-m \; \
		new-window -c "$PROJECT_DIR" -n "$WINDOW2_NAME" "$SHELL_PATH" \; \
		send-keys 'lvim notes_2022.sql' C-m \; \
		select-window -t "$WINDOW1_NAME" \; \
		select-pane -t 0 \;
else
	tmux attach -t $SESSION_NAME
fi
