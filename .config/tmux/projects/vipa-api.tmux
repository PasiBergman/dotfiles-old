#!/usr/bin/env bash

PROJECT_DIR="$HOME/Code/Keva/ViPa-2.0/vipa-api"
SESSION_NAME="vipa-api"
WINDOW1_NAME="LunarVim"
WINDOW2_NAME="LazyGit"
ZSH="$(which zsh)"

DEVOPS="https://keva.visualstudio.com/Verkkopalvelut%20-%20ViPa%202.0/_workitems/recentlyupdated/"

API_CMD="dotnet watch --project src/ViPa.API run"

if [ -n "$1" ]; then
	API_CMD=""
fi

TMUX_SESSIONS=$(tmux list-sessions | grep $SESSION_NAME -c)

if [[ "$TMUX_SESSIONS" == "0" ]]; then
	if [[ "$OSTYPE" == "darwin"* ]]; then
		open $DEVOPS
	fi
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
