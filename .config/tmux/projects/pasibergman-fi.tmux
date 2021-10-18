#!/usr/bin/env bash

PROJECT_DIR="$HOME/Code/Self/pasibergman.fi/"
SESSION_NAME="pasibergman-fi"
WINDOW1_NAME="LunarVim"
WINDOW2_NAME="LazyGit"
UIURL="http://localhost:8080"

TMUX_SESSIONS=$(tmux list-sessions | grep $SESSION_NAME -c)

if [[ "$TMUX_SESSIONS" == "0" ]]; then
	if [[ "$OSTYPE" == "darwin"* ]]; then
		open -a "Google Chrome" $UIURL
	fi
	tmux start-server
	tmux new-session -s $SESSION_NAME -n $WINDOW1_NAME -c "$PROJECT_DIR" \; \
		attach-session -t . -c "$PROJECT_DIR" \; \
		send-keys "lvim" C-m \; \
		split-window -v -p 20 \; \
		send-keys 'clear && git fetch --all' C-m \; \
		send-keys 'npm run docs:dev' C-m \; \
		new-window -c "$PROJECT_DIR" -n "$WINDOW2_NAME" /usr/local/bin/zsh \; \
		new-window -c "$PROJECT_DIR" /usr/local/bin/zsh \; \
		select-window -t "$WINDOW1_NAME" \; \
		select-pane -t 0 \;
else
	tmux attach -t $SESSION_NAME
fi
