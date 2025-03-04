function list_prod_changes_since_tag() {
    prev_tag="${1:-$(git describe --tags --match "prod-release-*" --abbrev=0)}"

    if git tag -l | grep -q "^${prev_tag}$"; then

        new_commits=$(git rev-list --count $prev_tag..HEAD)
        if [ "$new_commits" -gt 0 ]; then
            git lg $prev_tag~..HEAD
        else
            echo "No changes since '$prev_tag'"
        fi
    else
        echo "Tag '$prev_tag' was not found!"
    fi
}
