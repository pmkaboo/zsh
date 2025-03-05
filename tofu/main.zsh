for f in $(dirname "$0")/functions/*; do source $f; done

alias ti="tofu init"
alias tiu="tofu init -upgrade"

alias tp="tofu plan"
alias tpo=tofu_plan_out

alias ta="tofu apply -auto-approve"
alias tav=tofu_apply_with_vars
alias tap=tofu_apply_plan
alias tapv=tofu_apply_plan_with_vars

alias tt="tofu taint"
