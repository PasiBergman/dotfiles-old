# Linux specific aliases
#
if [[ "$(uname)" != "Linux" ]]; then return; fi

# =============================
# Aliases
# =============================

alias ls='ls --color=auto'

# Load Raspberry Pi specific file
[ -f $HOME/.config/zsh/script/raspi.sh ] && source $HOME/.config/zsh/script/raspi.sh
