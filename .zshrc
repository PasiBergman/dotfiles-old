
# fpath=(/usr/share/licenses/zsh-completions $fpath)

# Aliases
[ -f $HOME/.config/zsh/script/alias.sh ] && source $HOME/.config/zsh/script/alias.sh

# Aliases for tmux projects
[ -f $HOME/.config/tmux/aliases.sh ] && source $HOME/.config/tmux/aliases.sh

# Z
[ -f $HOME/.config/zsh/script/z.sh ] && source $HOME/.config/zsh/script/z.sh

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

# Block cursor when in vi mode
# [ -f $HOME/.config/zsh/script/vi-mode.sh ] && source $HOME/.config/zsh/script/vi-mode.sh

# Use ranger to change directory
rgcd () {
    tmp="$(mktemp)"
    ranger --choosedir="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

# Source files
if [[ $(uname) == "Darwin" ]]; then
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && source "/usr/local/opt/nvm/nvm.sh"
    [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && source "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
else
    [ -f "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -f "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] \
    && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] \
    && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Use specified node version
nvm use $NODE_VERSION 1>/dev/null
# System information
echo " " && pfetch
