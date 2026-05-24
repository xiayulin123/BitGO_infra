# Workspace → environment and path to EKS remote state.

locals {
  environment = terraform.workspace

  account_id_selected = data.aws_caller_identity.current.account_id

  eks_state_path = (
    terraform.workspace == "default"
    ? "${path.module}/../eks/terraform.tfstate"
    : "${path.module}/../eks/terraform.tfstate.d/${terraform.workspace}/terraform.tfstate"
  )
}
