setopt PROMPT_SUBST

git_folder () {
    git rev-parse --git-dir >/dev/null 2>/dev/null
    return $?
}

git_commits_ahead () {
    if git_folder; then

    fi
}

git_dirty_count () {
    if git_folder; then
        git status --porcelain | wc -l
    fi
}

git_current_branch () {
    if git_folder; then
        git branch --show-current
    fi
}

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

export PS1='
%{%F{blue}%}%n%\@%m%{%f%} in %{%F{green}%}%{%B%}%~%{%b%}%{%f%}$(get_git_prompt)
$(get_virtualenv_info)$(get_prompt_char) '

