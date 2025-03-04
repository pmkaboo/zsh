function push_release() {
    trap 'return 1' ERR

    temp_branch="${1:-temp-release}"
    echo "Switching to '$temp_branch'"
    git checkout $temp_branch

    echo
    echo "Pushing to 'release'"
    git branch -D release
    git checkout -b release
    git push -f origin HEAD

    echo "Deleting temp branch '$temp_branch'"
    git branch -D $temp_branch

    echo ">>> ALL DONE! <<<"

    trap '' ERR
}
