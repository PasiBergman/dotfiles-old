autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
precmd() {
    vcs_info
}
setopt PROMPT_SUBST

get_prompt_char () {
    git_folder && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo 'Hg' && return
    echo 'o'
}

get_virtualenv_info () {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

get_git_prompt () {
    if git_folder; then
        local branch=$(git_current_branch)
        local change_count=$(git_dirty_count)
        local git_change
        if [[  $change_count -gt 0 ]]; then
            git_change=`echo " %{%F{red}%}  ${change_count}%{%f%{%f%}%}"`
        fi
        echo " %{%F{yellow}%} $branch$git_change%{%f%}"
    fi
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

# export PS1='
# %{%F{blue}%}%n%\@%m%{%f%} in %{%F{green}%}%{%B%}%~%{%b%}%{%f%}$(get_git_prompt)
# $(get_virtualenv_info)$(get_prompt_char) '
export PS1='
${_blue}%n%\@%m${cend} in ${_green}${_bold}%~${_bold_reset}${_color_reset}${vcs_info_msg_0_}
$(get_virtualenv_info)$(get_prompt_char) '

#${_bold}%~${_bold_reset}${_color_reset}$(get_git_prompt)

