#!/usr/bin/env bash

NOSTART=""
if [ $# -gt 0 ]; then
	NOSTART=$1
fi

PROJECT_DIR="$HOME/Code/Keva/OET-2.0/oet-api"
SESSION_NAME="oet-api"
WINDOW1_NAME="LunarVim"
WINDOW2_NAME="LazyGit"
DEVOPS="https://keva.visualstudio.com/Verkkopalvelut%20-%20OET%202.0/_sprints/backlog/Verkkopalvelut%20-%20OET%202.0%20Team/Verkkopalvelut%20-%20OET%202.0/Sprint%2023"
START_CMD_UI="killall npm; npm run serve"
START_CMD_API="killall dotnet; dotnet watch --project src/Skylla.BE.API run"

TMUX_SESSIONS=$(tmux list-sessions | grep $SESSION_NAME -c)

if [[ "$TMUX_SESSIONS" == "0" ]]; then
	if [[ "$OSTYPE" == "darwin"* ]]; then
		open $DEVOPS
	fi
	if [ "$NOSTART" == "nostart" ]; then
		START_CMD_UI="echo 'Skipped start'"
		START_CMD_API="echo 'Skipped start'"
	fi
	tmux start-server
	tmux new-session -s "$SESSION_NAME" -n "$WINDOW1_NAME" -c "$PROJECT_DIR" \; \
		attach-session -t . -c "$PROJECT_DIR" \; \
		send-keys "lvim" C-m \; \
		split-window -v -p 20 \; \
		send-keys 'clear && git fetch --all' C-m \; \
		send-keys "$START_CMD_API" C-m \; \
		split-window -h -p 35 \; \
		send-keys 'clear && cd ../oet-ui/' C-m \; \
		send-keys "$START_CMD_UI" C-m \; \
		new-window -c "$PROJECT_DIR" -n "$WINDOW2_NAME" /usr/local/bin/zsh \; \
		select-window -t "$WINDOW1_NAME" \; \
		select-pane -t 0 \;
else
	tmux attach -t $SESSION_NAME
fi
