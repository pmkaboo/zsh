function tofu_apply_plan() {
    tofu apply -auto-approve "${1:-'tofu.plan'}"
}
