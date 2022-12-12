#!/usr/bin/env bash

PROJECT_DIR="$HOME/Code/Self/aspnet-core-7/minimal-api/"
SESSION_NAME="minimal-api"
WINDOW1_NAME="LunarVim"
WINDOW2_NAME="LazyGit"
ZSH="$(which zsh)"

API_CMD="dotnet watch --project ./minimal-api/"

if [ -n "$1" ]; then
	API_CMD=""
fi

TMUX_SESSIONS=$(tmux list-sessions | grep $SESSION_NAME -c)

if [[ "$TMUX_SESSIONS" == "0" ]]; then
	tmux start-server
	tmux new-session -s "$SESSION_NAME" -n "$WINDOW1_NAME" -c "$PROJECT_DIR" \; \
		attach-session -t . -c "$PROJECT_DIR" \; \
		send-keys "lvim" C-m \; \
		split-window -v -p 20 \; \
		send-keys 'clear && git fetch --all' C-m \; \
		send-keys "$API_CMD" C-m \; \
		new-window -c "$PROJECT_DIR" -n "$WINDOW2_NAME" "$ZSH" \; \
		select-window -t "$WINDOW1_NAME" \; \
		select-pane -t 0 \;
else
	tmux attach -t $SESSION_NAME
fi
