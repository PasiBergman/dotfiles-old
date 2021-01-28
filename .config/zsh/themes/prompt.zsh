
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
precmd() {
    vcs_info
}
setopt PROMPT_SUBST

_blue="%{$fg[blue]%}"
_green="%{$fg[green]%}"
_grey="%{$fg[grey]%}"
_red="%{$fg[red]%}"
_yellow="%{$fg[yellow]%}"
_color_reset="%{%f%}"
_bold="%{%B%}"
_bold_reset="%{%b%}"

# Show [sudo] in prompt if there is an active sudo session
is_sudo() {
    SUDO_SESSION=$(sudo -n uptime 2>&1 | grep "load" | wc -l)
    if [ ${SUDO_SESSION} -gt 0 ]; then
        echo "${_red}[sudo]${_color_reset} "
    fi
}

# Show exit code of the last command if there was an error 
# i.e. exit code > 0
last_status_code() {
    LAST_EXIT=${?}
    if [ ${LAST_EXIT} -gt 0 ]; then
        echo "${_red}[exit:${LAST_EXIT}]${_color_reset} "
    fi
}

git_folder () {
    git rev-parse --git-dir >/dev/null 2>/dev/null
    return $?
}

get_prompt_char () {
    # git_folder && echo '±' && return
    echo 'o'
}

get_virtualenv_info () {
    [ $VIRTUAL_ENV ] && echo '['`basename $VIRTUAL_ENV`'] '
}


zstyle ':vcs_info:git*' formats " on ${_yellow} %b ${_red}  %u%c%m${_color_reset}"
zstyle ':vcs_info:git*' actionformats "%s  %r/%S %b (%a) %m%u%c "

export PS1='
${_blue}%n%\@%m${cend} in ${_green}${_bold}%~${_bold_reset}${_color_reset}${vcs_info_msg_0_}
$(last_status_code)$(is_sudo)$(get_virtualenv_info)$(get_prompt_char) '

