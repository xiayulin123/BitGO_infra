locals {
  aws_region    = "us-east-1"
  aws_profile   = "bitgo"
  project_name  = "bitgo-infraops"
  iam_user_name = "bitgo"

  assume_role_arns = {
    dev = "arn:aws:iam::${var.aws_account_id}:role/TerraformAdmin"
    # staging = "arn:aws:iam::${var.aws_account_id}:role/TerraformAdmin"
    # prod    = "arn:aws:iam::${var.aws_account_id}:role/TerraformAdmin"
  }
}
