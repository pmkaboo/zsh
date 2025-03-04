for f in $(dirname "$0")/functions/*; do source $f; done

alias rlpp=prepare_release
alias rlps=push_release
alias pc=list_prod_changes_since_n_tags
alias pct=list_prod_changes_since_tag
