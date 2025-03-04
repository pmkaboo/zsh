PROMPT="%B%F{238}%1~%f%b %(?.%F{green}.%F{red})→%f "
RPROMPT="%F{238}$(parse_git_dirty)$(git_current_branch) $(ruby_prompt_info)%f"

# ZSH_THEME_GIT_PROMPT_PREFIX="%F{235}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_RUBY_PROMPT_PREFIX="["
ZSH_THEME_RUBY_PROMPT_SUFFIX="]"
ZSH_THEME_RVM_PROMPT_OPTIONS="v g"
