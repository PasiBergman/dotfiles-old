#!/usr/bin/env bash

PROJECT_DIR="$HOME/Code/Keva/Avaintiedot/Avaintiedot-Massatoimitus"
SESSION_NAME="Massatoimitus"
WINDOW1_NAME="LunarVim"
WINDOW2_NAME="LazyGit"

DEVOPS="https://keva.visualstudio.com/Verkkopalvelut-Avaintiedot/_sprints/backlog/Verkkopalvelut-Avaintiedot%20Team/Verkkopalvelut-Avaintiedot/Sprint_60"

TMUX_SESSIONS=$(tmux list-sessions | grep $SESSION_NAME -c)

if [[ "$TMUX_SESSIONS" == "0" ]]; then
	if [[ "$OSTYPE" == "darwin"* ]]; then
		open $DEVOPS
	fi
	tmux start-server
	tmux new-session -s "$SESSION_NAME" -n "$WINDOW1_NAME" -c "$PROJECT_DIR" \; \
		attach-session -t . -c "$PROJECT_DIR" \; \
		send-keys "cd ./src && lvim" C-m \; \
		split-window -v -p 20 \; \
		send-keys 'cd ./src/Massatoimitus.UI && npm run serve' C-m \; \
		split-window -h -p 66 \; \
		send-keys 'killall dotnet; dotnet watch --project ./src/Massatoimitus.API run' C-m \; \
		new-window -c "$PROJECT_DIR" -n "$WINDOW2_NAME" /usr/local/bin/zsh \; \
		send-keys "lazygit" C-m \; \
		select-window -t "$WINDOW1_NAME" \; \
		select-pane -t 0 \;
else
	tmux attach -t $SESSION_NAME
fi
