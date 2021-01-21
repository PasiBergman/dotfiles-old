autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
precmd() {
    vcs_info
}
setopt PROMPT_SUBST

git_folder () {
    git rev-parse --git-dir >/dev/null 2>/dev/null
    return $?
}

get_prompt_char () {
    git_folder && echo '±' && return
    echo 'o'
}

get_virtualenv_info () {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

_blue="%{$fg[blue]%}"
_green="%{$fg[green]%}"
_grey="%{$fg[grey]%}"
_red="%{$fg[red]%}"
_yellow="%{$fg[yellow]%}"
_color_reset="%{%f%}"
_bold="%{%B%}"
_bold_reset="%{%b%}"

zstyle ':vcs_info:git*' formats " on ${_yellow} %b ${_red}  %u%c%m${_color_reset}"
zstyle ':vcs_info:git*' actionformats "%s  %r/%S %b (%a) %m%u%c "

export PS1='
${_blue}%n%\@%m${cend} in ${_green}${_bold}%~${_bold_reset}${_color_reset}${vcs_info_msg_0_}
$(get_virtualenv_info)$(get_prompt_char) '

