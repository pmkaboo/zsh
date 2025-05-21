PROMPT="%B%F{238}%1~%f%b %(?.%F{green}.%F{red})→%f "

function omz_rprompt() {
    RPROMPT="%F{238}$(parse_git_dirty)$(git_current_branch) [$(rvm-prompt)]%f"
}

ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_RVM_PROMPT_OPTIONS="v g"

autoload -U add-zsh-hook
add-zsh-hook precmd omz_rprompt
