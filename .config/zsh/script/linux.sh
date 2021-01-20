# Linux specific aliases
#
if [[ "$(uname)" != "Linux" ]]; then return; fi

# =============================
# Aliases
# =============================

alias ls='ls --color=auto'

# =============================
# Functions
# =============================

packages() {
    FILENAME=$(echo $HOST | sed -e 's/afrodite-//g')
    case "$HOST" in
        afrodite-arch)
            SETUP_FOLDER="$HOME/.config/setup/arch"
            ;;
        afrodite-raspi3)
            SETUP_FOLDER="$HOME/.config/setup/raspi"
            ;;
        *)
            echo "Unknown host. Exiting."
            return
            ;;
    esac

    echo "List of explicit packages from main repository"
    echo "----------------------------------------------"
    pacman -Qqen | tee "${SETUP_FOLDER}/${FILENAME}-pacman-Qqn.txt"
    echo ""
    echo "List of explicit packages from AUR"
    echo "----------------------------------------------"
    pacman -Qqem | tee "${SETUP_FOLDER}/${FILENAME}-pacman-Qqm.txt"
    echo ""
    echo "# List of unneeded dependencies (orphans)"
    echo "# ----------------------------------------------"
    pacman -Qdt | tee "${SETUP_FOLDER}/${FILENAME}-pacman-Qdt.txt"
}


# =============================
# Sources
# =============================

# Load Raspberry Pi specific file
[ -f $HOME/.config/zsh/script/raspi.sh ] && source $HOME/.config/zsh/script/raspi.sh

