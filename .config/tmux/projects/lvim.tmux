#!/usr/bin/env bash

PROJECT_DIR="$HOME/.config/lvim"
SESSION_NAME="lvim"
WINDOW1_NAME="LunarVim"
WINDOW2_NAME="LazyGit"
ZSH="$(which zsh)"

TMUX_SESSIONS=$(tmux list-sessions | grep $SESSION_NAME -c)

if [[ "$TMUX_SESSIONS" == "0" ]]; then
	tmux start-server
	tmux new-session -s $SESSION_NAME -n $WINDOW1_NAME -c "$PROJECT_DIR" \; \
		attach-session -t . -c "$PROJECT_DIR" \; \
		send-keys "lvim" C-m \; \
		new-window -c "$PROJECT_DIR" -n "$WINDOW2_NAME" "$ZSH" \; \
		send-keys "lg" C-m \; \
		select-window -t "$WINDOW1_NAME" \; \
		select-pane -t 0 \;
else
	tmux attach -t $SESSION_NAME
fi
