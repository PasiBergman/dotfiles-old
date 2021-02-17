# Path
export PATH="$HOME/.local/bin:$HOME/.dotnet:$HOME/.dotnet/tools:$PATH"

# Localization
export LC_CTYPE="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_MONETARY="fi_FI.UTF-8"
export LC_NAME="fi_FI.UTF-8"
export LC_ADDRESS="fi_FI.UTF-8"
export LC_TELEPHONE="fi_FI.UTF-8"
export LC_MEASUREMENT="fi_FI.UTF-8"
export LC_IDENTIFICATION="fi_FI.UTF-8"
export LC_ALL=
export LANG=en_US.UTF-8
export LANGUAGE=en_US
# Command history
SAVEHIST=50000
HISTSIZE=50000
HISTFILE=$HOME/.cache/.zsh_history
setopt appendhistory
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
# Default texteditor
export EDITOR=nvim
# .NET, dotnet, Azure Functions, VSCode
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT=1
export ASPNETCORE_ENVIRONMENT=Local
export DOTNET_ROOT=$HOME/.dotnet
export VSCODE=code
# Node & Nvm
export NODE_VERSION="14.15.5"
export NVM_DIR="$HOME/.nvm"
# Manual
export MANPAGER="nvim +Man!"
export MANWIDTH=999
# Temporary files direcotry
export TMP="/tmp"
# Parallels
export def_sysconfdir=/etc/init.d
# i3 blocks
export I3BLOCKS_SCRIPT_DIR=$HOME/.config/i3/i3blocks/scripts
# pfetch
export PF_INFO="ascii title os kernel uptime pkgs memory shell editor palette"
export PF_ALIGN="12"

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

# =========================
# Z configuration
# https://github.com/rupa/z
# =========================
export _Z_CMD="z"  # in .bashrc/.zshrc to change the command (default z).
export _Z_DATA="$HOME/.cache/.z"
if [[ "$(uname)" == "Darwin" ]] || [[ "$(uname -n)" == "lakka" ]]; then
    export _Z_OWNER="pbe"
else
    export _Z_OWNER="pasi"
fi
# set $_Z_MAX_SCORE             # lower to age entries out faster (default 9000).
# set $_Z_NO_RESOLVE_SYMLINKS   # to prevent symlink resolution.
# set $_Z_NO_PROMPT_COMMAND       # if you're handling PROMPT_COMMAND yourself.
# set $_Z_EXCLUDE_DIRS            # to an array of directories to exclude.
# to your username if you want use z while sudo with $HOME kept

