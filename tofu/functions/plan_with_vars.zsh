function tofu_plan_with_vars() {
    tofu plan -var-file ${1:-'my.tfvars'}
}
