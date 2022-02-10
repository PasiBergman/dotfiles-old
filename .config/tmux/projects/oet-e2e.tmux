#!/usr/bin/env bash

PROJECT_DIR="$HOME/Code/Keva/OET-2.0/oet-e2e"
SESSION_NAME="oet-e2e"
WINDOW1_NAME="LunarVim"
WINDOW2_NAME="OET 2.0"
WINDOW3_NAME="LazyGit"
DEVOPS="https://keva.visualstudio.com/Verkkopalvelut%20-%20OET%202.0/_sprints/backlog/Verkkopalvelut%20-%20OET%202.0%20Team/Verkkopalvelut%20-%20OET%202.0/Sprint%2023"
UIURL="https://localhost:8080"

TMUX_SESSIONS=$(tmux list-sessions | grep $SESSION_NAME -c)

if [[ "$TMUX_SESSIONS" == "0" ]]; then
	if [[ "$OSTYPE" == "darwin"* ]]; then
		open $DEVOPS
		open -a "Google Chrome" $UIURL
	fi
	tmux start-server
	tmux new-session -s $SESSION_NAME -n $WINDOW1_NAME -c "$PROJECT_DIR" \; \
		attach-session -t . -c "$PROJECT_DIR" \; \
		send-keys "lvim" C-m \; \
		split-window -v -p 30 \; \
		new-window -c "$PROJECT_DIR" -n "$WINDOW2_NAME" /usr/local/bin/zsh \; \
		send-keys 'clear && git fetch --all' C-m \; \
		send-keys 'dotnet watch --project src/Skylla.BE.API run' C-m \; \
		split-window -h -p 50 \; \
		send-keys 'clear && cd ../oet-ui/' C-m \; \
		send-keys 'npm run serve' C-m \; \
		new-window -c "$PROJECT_DIR" -n "$WINDOW3_NAME" /usr/local/bin/zsh \; \
		select-window -t "$WINDOW1_NAME" \; \
		select-pane -t 0 \;
else
	tmux attach -t $SESSION_NAME
fi
