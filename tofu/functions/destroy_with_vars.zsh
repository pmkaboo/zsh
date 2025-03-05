function tofu_destroy_with_vars() {
    tofu destroy -var-file ${1:-'my.tfvars'}
}
