locals {
  aws_region    = "us-east-1"
  aws_profile   = "bitgo"
  project_name  = "bitgo-infraops"
  iam_user_name = "Bitgo"

  assume_role_arns = {
    dev = "arn:aws:iam::${var.aws_account_id}:role/TerraformAdmin"
  }

  domain_name = var.domain_name
}
