#!/usr/bin/env bash

WINDOW_EDITOR="Editor"
WINDOW_GIT="Git"

ZSH="$(which zsh)"

start_tmux_session() {
	S_NAME="$1"
	P_DIR="$2"
	tmux new-session -ds "$S_NAME" -n "$WINDOW_EDITOR" -c "$P_DIR"
	tmux send-keys -t "$S_NAME" "lvim" C-m
	tmux split-window -t "$S_NAME" -v -p 20 -c "$P_DIR"
	tmux send-keys -t "$S_NAME" 'clear && git fetch --all' C-m
	tmux new-window -t "$S_NAME" -c "$P_DIR" -n "$WINDOW_GIT" "$ZSH"
	tmux send-keys -t "$S_NAME" "lazygit" C-m
	# If not in a tmux session, attach to the session
	# else switch client to the session
	if [[ -z "$TMUX" ]]; then
		tmux attach-session -t "$S_NAME" \; \
			select-window -t "$WINDOW_EDITOR" \; \
			select-pane -t 0 \;
	else
		tmux switch -t "$S_NAME" \; \
			select-window -t "$WINDOW_EDITOR" \; \
			select-pane -t 0 \;
	fi
}

if [[ $# -eq 1 ]]; then
	PROJECT_DIR=$1
else
	# Find all directories containing .git repoistory/folder
	PROJECT_DIR=$(find ~/.config ~/Code/Personal ~/Code/Work -maxdepth 4 -name ".git" -type d |
		sed 's/\/\.git//' |
		fzf --height 40% --layout=reverse --preview 'tree -C {} | head -200')
fi

if [[ -z $PROJECT_DIR ]]; then
	exit 0
fi

PROJECT_NAME=$(basename "$PROJECT_DIR" | tr . _)
TMUX_RUNNING=$(pgrep tmux)

# Not in a tmux session AND tmux is not running
if [[ -z $TMUX ]] && [[ -z $TMUX_RUNNING ]]; then
	start_tmux_session "$PROJECT_NAME" "$PROJECT_DIR"
	exit 0
fi

if ! tmux has-session -t="$PROJECT_NAME" 2>/dev/null; then
	start_tmux_session "$PROJECT_NAME" "$PROJECT_DIR"
	exit 0
fi

# If not in a tmux session, attach to the session
# else switch client to the session
if [[ -z $TMUX ]]; then
	tmux attach -t "$PROJECT_NAME"
else
	tmux switch -t "$PROJECT_NAME"
fi
