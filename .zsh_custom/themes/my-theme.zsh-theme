function get_git_status() { 
    if [[ -n $(git rev-parse --is-inside-work-tree 2>/dev/null) ]]; then 
        local git_status="$(git_prompt_status)" 
        if [[ -n $git_status ]]; then 
            git_status="($git_status%{$reset_color%}) "
        fi 
        echo $git_status 
    fi 
}
DIR_PATH='%25<...<%~%<<'
PROMPT='%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}:%{$fg[white]%}$DIR_PATH%{$reset_color%}$(git_prompt_info)$(get_git_status)%(!.#.|>) ' 


ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[white]%}(%{$fg[blue]%}" 
ZSH_THEME_GIT_PROMPT_SUFFIX=" %{$reset_color%}" 
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$fg[white]%})%{$reset_color%}" 
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✓%{$fg[white]%})%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}+%{$reset_color%}" 
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}-%{$reset_color%}" 
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[magenta]%}*%{$reset_color%}" 
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}>%{$reset_color%}" 
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}=%{$reset_color%}" 
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}?%{$reset_color%}"
