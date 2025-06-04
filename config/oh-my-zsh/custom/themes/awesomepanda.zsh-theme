# the svn plugin has to be activated for this to work.
PROMPT='%{$fg_bold[magenta]%}> %{$reset_color%}'

RPROMPT='%{$fg[green]%}%~ %{$fg_bold[blue]%}$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="<"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[blue]%}>%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}*%{$reset_color%}%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[red]%}"

ZSH_PROMPT_BASE_COLOR="%{$fg_bold[blue]%}"
ZSH_THEME_REPO_NAME_COLOR="%{$fg_bold[red]%}"
