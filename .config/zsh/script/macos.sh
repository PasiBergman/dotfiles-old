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
    cd $HOME && \
        cd "$(fd -t d --max-depth 10 | fzf --preview='tree -L 1 {}' --bind='space:toggle-preview' --preview-window=:hidden)" && \
        echo "$PWD" && \
        tree -L 1
}
