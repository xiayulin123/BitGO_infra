locals {
  aws_region    = "us-east-1"
  aws_profile   = "bitgo"
  project_name  = "bitgo-infraops"
  iam_user_name = "Bitgo"

  assume_role_arns = {
    dev = "arn:aws:iam::${var.aws_account_id}:role/TerraformAdmin"
  }

  name_prefix = "${local.project_name}-${local.environment}"

  eks_state_path = (
    terraform.workspace == "default"
    ? "${path.module}/../eks/terraform.tfstate"
    : "${path.module}/../eks/terraform.tfstate.d/${terraform.workspace}/terraform.tfstate"
  )
}
