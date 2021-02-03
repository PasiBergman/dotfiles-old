# =============================
# Envs
# =============================

DOTFILES_DIR=".dotfiles"
dotfiles_dirs_to_monitor=( \
    "$HOME/.config/i3" \
    "$HOME/.config/nvim" \
    "$HOME/.config/setup" \
    "$HOME/.config/termite" \
    "$HOME/.config/tmux" \
    "$HOME/.config/zsh" \
)
dotfiles_igore_grep="\.\.\|undodir\|\/coc\/\|autoload\|\/viminfo"

# =============================
# Aliases
# =============================

# dotfiles alias
# https://github.com/PasiBergman/dotfiles
#
alias dotfiles="git --git-dir=$HOME/$DOTFILES_DIR/ --work-tree=$HOME"
alias dot="git --git-dir=$HOME/$DOTFILES_DIR/ --work-tree=$HOME"
alias .git="git --git-dir=$HOME/$DOTFILES_DIR/ --work-tree=$HOME"
alias dotuntracked='dotfiles ls-files --others --exclude-standard'

# =============================
# Functions
# =============================

check_dotfiles_status() {
    cd $1
    GIT_CLEAN=$(git --git-dir=$HOME/$DOTFILES_DIR/ --work-tree=$HOME \
        status --untracked-files=normal 2>/dev/null \
        | grep -v "$dotfiles_igore_grep" \
        | grep "nothing to commit, working tree clean" -c)
    echo "---------------------------------------------------"
    echo $1
    echo "---------------------------------------------------"
    if [[ "$GIT_CLEAN" == "0" ]]; then
        git --git-dir=$HOME/$DOTFILES_DIR/ --work-tree=$HOME status --untracked-files=normal \
            | grep -v "$dotfiles_igore_grep"
    fi
    echo ""
}

dot-status () {
    CURRENT_DIR=$(pwd)

    for i in $dotfiles_dirs_to_monitor; do
        [ -d $i ] && check_dotfiles_status "$i"
    done

    cd $CURRENT_DIR
}

autoload -Uz dot-status
