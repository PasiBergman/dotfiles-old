alias ls="ls --color=auto"

# Nvim
alias vim="nvim"
alias vi="nvim"

# Reverse aliases. Open these filetypes with nvim
alias -s {cs,ts,js,html,htm,md,json,yml,yaml,vue}=nvim

# Utils
alias cpu-info="$HOME/.config/zsh/script/cpu-info.sh"
alias mem=$'ps axc -o cmd,%mem --sort=-%mem | head -15 | awk \'{printf("%-20s %5s%\\n", $1, $2)}\''
alias cpu=$'ps axc -o cmd,%cpu --sort=-%cpu | head -15 | awk \'{printf("%-20s %5s%\\n", $1, $2)}\''
