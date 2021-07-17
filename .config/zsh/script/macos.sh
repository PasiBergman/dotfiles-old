# macOS specific envs, settings, functions and aliases
#
if [[ "$(uname)" != "Darwin" ]]; then return; fi

# ====================
# Envs and settings
# ====================

bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line


# ====================
# Aliases
# ====================

# Packet capture
alias pcap="sudo tcpdump -i en0 -s 0 -B 524288 -w /Users/pasi/Desktop/DumpFile01.pcap"
# View captured packed file
alias view-pcap="tcpdump -s 0 -n -e -x -vvv -r /Users/pasi/Desktop/DumpFile01.pcap"
# Colors
alias ls="ls -G"

alias azure-access="$HOME/.config/zsh/script/azure-access-grant.sh"
alias azure-access-pasi="$HOME/.config/zsh/script/azure-access-pasi.sh"

# Temporary Neovim
# alias nvim="$HOME/bin/nvim-5/bin/nvim"
# alias vim="$HOME/bin/nvim-5/bin/nvim"
# alias vi="$HOME/bin/nvim-5/bin/nvim"
# alias v="$HOME/bin/nvim-5/bin/nvim"


# ====================
# Functions
# ====================

# search Chrome history
# Requires full disk access for iTerm2/Terminal
chromehistory() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  cp -f ~/Library/Application\ Support/Google/Chrome/Default/History /tmp/chromehdefault

  sqlite3 -separator $sep /tmp/chromehdefault \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time DESC" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open -a /Applications/Google\ Chrome.app
  rm -f /tmp/chromehdefault
}

# browse Safari history
# Requires full disk access for iTerm2/Terminal
safarihistory() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  cp -f ~/Library/Safari/History.db /tmp/s

  sqlite3 -separator $sep /tmp/s \
    "select substr(v.title,1,$cols),i.url
     from history_items i, history_visits v
     where i.id=v.history_item and v.load_successful=1
     order by v.visit_time DESC" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
  rm -f /tmp/s
}

# Change directory usig fd and fzf
zf() {
    cd "$HOME" && \
        cd "$(fd -t d --max-depth 10 | fzf --preview='tree -L 1 {}' --bind='space:toggle-preview' --preview-window=:hidden)" && \
        echo "$PWD" && \
        tree -L 1
}

packages() {
    SETUP_FOLDER="$HOME/.config/setup/macos"
    [ -d "$SETUP_FOLDER" ] || mkdir -p "$SETUP_FOLDER"

    brew bundle dump --file="$SETUP_FOLDER/macos-brew-bundle-dump.txt" --force
    echo "Brew bundle dump"
    echo "----------------------------------------------"
    cat "$SETUP_FOLDER/macos-brew-bundle-dump.txt"
    # echo ""
    # echo "List of brew bundle dump"
    # echo "----------------------------------------------"
    # brew leaves | tee "${SETUP_FOLDER}/macos-brew-leaves.txt"
    # echo ""
    # echo "List of brew --cask"
    # echo "----------------------------------------------"
    # brew list --cask -1 | tee "${SETUP_FOLDER}/macos-brew-list--cask-1.txt"
    echo ""
    echo "List of App Store apps"
    echo "----------------------------------------------"
    mas list | tee "${SETUP_FOLDER}/macos-mas-list.txt"
    echo ""
    echo "List of Setapp apps"
    echo "----------------------------------------------"
    ls -1 /Applications/Setapp | grep "\.app" | tee "${SETUP_FOLDER}/macos-setapp.txt"
    echo ""
    echo "List of NPM global applications"
    echo "----------------------------------------------"
    npm list -g --depth 0 | tee "${SETUP_FOLDER}/macos-npm-global-packages.txt"
    echo ""
    echo "List of Python 3 libraries"
    echo "----------------------------------------------"
    python3 -m pip list --format freeze | tee "${SETUP_FOLDER}/macos-python3-pip.txt"
    echo ""
    echo "List of Lua packages (luarocks)"
    echo "----------------------------------------------"
    luarocks list | tee "${SETUP_FOLDER}/macos-luarocks.txt"
    echo ""
    echo "List Rust Cargo packages"
    echo "----------------------------------------------"
    cargo install --list | tee "${SETUP_FOLDER}/macos-rust-cargo.txt"
    echo ""
}

packages-install () {
    SETUP_FOLDER="$HOME/.config/setup/macos"
    [ -d "$SETUP_FOLDER" ] || mkdir -p "$SETUP_FOLDER"
    echo ""
    # echo "Installing Homebrew apps"
    # brew bundle --file=$SETUP_FOLDER/macos-brew-bundle-dump.txt
    # echo ""
    # echo "Installing Mac App Store apps:"
    while read -r p; do
        grep "$p" "$SETUP_FOLDER/macos-mas-list.txt"
        echo "$p"
        mas install "$p"
      done <<< $(awk '{print $1}' "$SETUP_FOLDER/macos-mas-list.txt")
}

packages-cleanup () {
    SETUP_FOLDER="$HOME/.config/setup/macos"
    [ -d "$SETUP_FOLDER" ] || mkdir -p "$SETUP_FOLDER"

    brew bundle cleanup --file "$SETUP_FOLDER/macos-brew-bundle-dump.txt" --verbose
    read -s -k -r '?Press any key to continue with uninstallation or ctrl-c to stop.'
    brew bundle cleanup --file "$SETUP_FOLDER/macos-brew-bundle-dump.txt" --verbose --force
}

