# =====================
# Functions
# =====================

b64() {
    echo "$1 base64 encoded:"
    echo -n $1 | base64
}
b64d() {
    echo "$1 decoded from base64:"
    echo -n $1 | base64 -D
}

sha256() {
    /usr/bin/shasum -a 256 $1
}

# =====================
# Aliases
# =====================

# Reverse aliases. Open these filetypes with nvim
alias -s {cs,ts,js,html,htm,md,json,yml,yaml,vue}=nvim

# Nvim
alias vim="nvim"
alias vi="nvim"

# Hardware
alias cpu-info="$HOME/.config/zsh/script/cpu-info.sh"
alias mem=$'ps axc -o cmd,%mem --sort=-%mem | head -n 15 | awk \'{printf("%-20s %5s%\\n", $1, $2)}\''
alias cpu=$'ps axc -o cmd,%cpu --sort=-%cpu | head -n 15 | awk \'{printf("%-20s %5s%\\n", $1, $2)}\''

# Utils
alias sää='curl -s "https://wttr.in/Kukkumäki,Espoo?MF1&lang=fi"'

# Fzf
alias historyfzf="history 0 | fzf"
alias fzfhistory="history 0 | fzf"
alias fzfhist="history 0 | fzf"
batfz() {
    bat `fd -t file | fzf`
}

# dotnet
alias dotnetclean="find . -name bin -exec rm -R -f {} \; 2>/dev/null && find . -name obj -exec rm -R -f {} \; 2>/dev/null && dotnet clean 2>/dev/null"

# Lazygit
alias lazygit="lazygit -ucd $HOME/.config/lazygit"
alias lg="lazygit -ucd $HOME/.config/lazygit"
