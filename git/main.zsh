for f in $(dirname "$0")/functions/*; do source $f; done

alias gf="git fetch"

alias gs="git status"
alias ga="git add"
alias gr="git reset"
alias grs=git_soft_reset
alias gc="git commit -m"

alias gb="git branch"
alias gbd="git branch -D"
alias gbda=git_delete_all_branches
alias gco="git checkout"

alias gpl="git pull"

alias gps="git push origin HEAD"
alias gpsf="git push -f origin HEAD"

alias gcp=git_cherry_pick

alias gp="echo 'nope. use gpl or gps'"

alias gl=git_log_pretty
alias glg="gl -10000 |grep "

alias gd="git diff"
