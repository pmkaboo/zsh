function tofu_plan_out_with_vars() {
    tofu plan -var-file ${1:-'my.tfvars'} -out ${2:-'tofu.plan'}
}
