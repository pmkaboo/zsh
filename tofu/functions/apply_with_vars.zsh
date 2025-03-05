function tofu_apply_with_vars() {
    tofu apply -auto-approve -var-file ${1:-'my.tfvars'}
}
