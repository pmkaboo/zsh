function git_delete_all_branches() {
    git branch | grep -v  \* | xargs git branch -D
}
