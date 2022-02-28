#!/usr/bin/env bash

PROJECT_DIR="$HOME/Code/Keva/OET-2.0/oet-api"
SESSION_NAME="oet-api"
WINDOW1_NAME="LunarVim"
WINDOW2_NAME="LazyGit"

DEVOPS="https://keva.visualstudio.com/Verkkopalvelut%20-%20OET%202.0/_sprints/backlog/Verkkopalvelut%20-%20OET%202.0%20Team/Verkkopalvelut%20-%20OET%202.0/Sprint%2026"

API_CMD="killall dotnet; dotnet watch --project src/Skylla.BE.API run"
UI_CMD="killall npm; npm run serve"
SHELL_PATH="/opt/homebrew/bin/zsh"

if [ -n "$1" ]; then
	API_CMD=""
	UI_CMD=""
fi

TMUX_SESSIONS=$(tmux list-sessions | grep $SESSION_NAME -c)

if [[ "$TMUX_SESSIONS" == "0" ]]; then
	if [[ "$OSTYPE" == "darwin"* ]]; then
		open $DEVOPS
	fi
	if [ -n "$1" ]; then
		API_CMD=""
		UI_CMD=""
	fi
	tmux start-server
	tmux new-session -s "$SESSION_NAME" -n "$WINDOW1_NAME" -c "$PROJECT_DIR" \; \
		attach-session -t . -c "$PROJECT_DIR" \; \
		send-keys "lvim" C-m \; \
		split-window -v -p 20 \; \
		send-keys 'clear && git fetch --all' C-m \; \
		send-keys "$API_CMD" C-m \; \
		split-window -h -p 35 \; \
		send-keys 'clear && cd ../oet-ui/' C-m \; \
		send-keys "$UI_CMD" C-m \; \
		new-window -c "$PROJECT_DIR" -n "$WINDOW2_NAME" "$SHELL_PATH" \; \
		select-window -t "$WINDOW1_NAME" \; \
		select-pane -t 0 \;
else
	tmux attach -t $SESSION_NAME
fi
