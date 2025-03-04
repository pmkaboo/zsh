source "$(dirname "$0")/changes_since_tag.zsh"

function prepare_release() {
    trap 'return 1' ERR

    date=$1
    if [ -z "$date" ]; then
        echo "Release date is missing! 'rlpp YYYY-MM-DD'"
        return 1
    fi

    prev_tag="${2:-$(git describe --tags --match "prod-release-*" --abbrev=0)}"
    echo "Found previous release '$prev_tag'"

    echo
    echo "Pulling latest 'main'"
    git checkout main
    git pull origin main

    new_commits=$(git rev-list --count $prev_tag..HEAD)

    if [ "$new_commits" -gt 0 ]; then
        echo "There are $new_commits commits since $prev_tag. Preparing release"

        next_tag="prod-release-$date"

        echo
        echo "Tagging last commit as '$next_tag'"
        if git tag -a $next_tag -m "Production release $date"; then
            git push --tags
        else
            echo "Tag '$next_tag' already exists, moving on"
        fi

        echo
        echo "Pulling latest 'release'"
        git checkout release
        git pull origin release

        echo
        backup_branch="release-backup-$date"
        echo "Creating backup branch '$backup_branch'"
        if git checkout -b $backup_branch; then
            git push origin HEAD
        else
            echo "Backup branch '$backup_branch' already exists, moving on"
        fi

        echo
        git checkout release
        echo "List of changes on 'release' since '$prev_tag', hotfixes and reverts"
        list_prod_changes_since_tag $prev_tag

        echo
        echo
        git checkout main
        echo "List of new changes on 'main' since '$prev_tag'"
        list_prod_changes_since_tag $prev_tag

        echo
        echo
        temp_branch="${3:-temp-release}"
        echo "Creating temp branch '$temp_branch' branch"
        if ! git checkout -b "$temp_branch"; then
            git branch -D "$temp_branch"
            git checkout -b temp-release
        fi

        echo
        echo "Next steps:"
        echo " - check status of all new commits on 'main', revert those that are not 'QA passed'"
        echo " - if something is not revertable (there are conflicts), let others know that its a release blocker"
        echo " - once everything on '$temp_branch' is ready, push to release with 'rlps'"
    else
        echo
        echo "No new commits since $prev_tag, skipping release"
    fi

    trap '' ERR
}
