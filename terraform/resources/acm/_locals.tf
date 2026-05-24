locals {
  aws_region    = "us-east-1"
  aws_profile   = "bitgo"
  project_name  = "bitgo-infraops"
  iam_user_name = "Bitgo"

  assume_role_arns = {
    dev = "arn:aws:iam::${var.aws_account_id}:role/TerraformAdmin"
  }

  domain_name = var.domain_name

  route53_state_path = (
    terraform.workspace == "default"
    ? "${path.module}/../route53/terraform.tfstate"
    : "${path.module}/../route53/terraform.tfstate.d/${terraform.workspace}/terraform.tfstate"
  )
}
