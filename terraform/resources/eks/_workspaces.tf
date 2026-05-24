# Workspace → environment name and path to VPC remote state.
# Provider/account locals are in _locals.tf; provider block is in _providers.tf.

locals {
  environment = terraform.workspace

  account_id_selected = data.aws_caller_identity.current.account_id

  vpc_state_path = (
    terraform.workspace == "default"
    ? "${path.module}/../vpc/terraform.tfstate"
    : "${path.module}/../vpc/terraform.tfstate.d/${terraform.workspace}/terraform.tfstate"
  )
}
