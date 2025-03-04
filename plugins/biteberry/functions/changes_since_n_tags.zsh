function list_prod_changes_since_n_tags() {
    n="${1:-1}"
    tags=$(git tag -l "prod-release-*")
    tags_count=$(echo "$tags" | wc -l | tr -d '[:space:]')

    if [ $tags_count -lt $n ]; then
        echo "Index out of bounds. Found only $tags_count 'prod-release-*' tags:"
        echo "$tags"
        return 1
    fi

    prev_tag=$(echo $tags | sort -V | tail -n $n | head -n 1)
    list_prod_changes_since_tag $prev_tag
}
