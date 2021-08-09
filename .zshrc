source $HOME/.zshenv
# Completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Autoload colors (for prompt)
autoload -U colors && colors
# Prompt theme
[ -f $HOME/.config/zsh/themes/prompt.zsh ] && source $HOME/.config/zsh/themes/prompt.zsh

# Auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# vi mode
bindkey -v
# export KEYTIMEOUT=1

# vi keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# ------------
# Source files
# ------------

# Aliases
[ -f "$HOME/.config/zsh/script/alias.sh" ] && \
    source "$HOME/.config/zsh/script/alias.sh"

# Tmux projects
[ -f "$HOME/.config/tmux/aliases.sh" ] && \
    source "$HOME/.config/tmux/aliases.sh"

# Z
[ -f "$HOME/.config/zsh/script/z.sh" ] && \
    source "$HOME/.config/zsh/script/z.sh"


# macOS vs. Linux
if [[ $(uname) == "Darwin" ]]; then
   ZSH_PLUGINS_DIR="/usr/local/share"
elif [[ $(uname -n) == "lakka" ]]; then
    ZSH_PLUGINS_DIR="$HOME/.local/share"
else
    # i.e. Linux
    ZSH_PLUGINS_DIR="/usr/share/zsh/plugins"
fi

# fnm (node version manager)
which fnm 1>/dev/null 2>&1 && eval "$(fnm env)"
# nvm (node version manager)
[ -f "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

# Syntax highlighting
[ -f "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && \
    source "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
# Autosuggestions
[ -f "$ZSH_PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && \
    source "$ZSH_PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh"

# System information
[ -f $HOME/.config/zsh/script/truecolor-test.sh ] && $HOME/.config/zsh/script/truecolor-test.sh

# If not TMUX session and neofetch is installed, show system info
[ -z "$TMUX" ] &&  which neofetch 1>/dev/null 2>&1 && echo " " && neofetch
