function tofu_apply_plan_with_vars() {
    tofu apply -auto-approve -var-file ${1:-'my.tfvars'} ${2=:-'tofu.plan'}
}
