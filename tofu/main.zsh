for f in $(dirname "$0")/functions/*; do source $f; done

alias ti="tofu init"
alias tiu="tofu init -upgrade"

alias tp="tofu plan"
alias tpo=tofu_plan_out

alias ta="tofu apply -auto-approve"
alias tap=tofu_apply_plan
