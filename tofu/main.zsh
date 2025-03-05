for f in $(dirname "$0")/functions/*; do source $f; done

alias ti="tofu init"
alias tiu="tofu init -upgrade"

alias tp="tofu plan"
alias tpv=tofu_plan_with_vars
alias tpo=tofu_plan_out
alias tpov=tofu_plan_out_with_vars

alias ta="tofu apply -auto-approve"
alias tav=tofu_apply_with_vars
alias tap=tofu_apply_plan
alias tapv=tofu_apply_plan_with_vars

alias tt="tofu taint"
