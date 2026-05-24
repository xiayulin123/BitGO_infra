# Workspace → environment name, VPC CIDR per workspace.
# Account/role switching is in _provider.tf (profile or assume_role).

locals {
  environment = terraform.workspace

  vpc_cidr = {
    dev     = "10.0.0.0/16"
    staging = "10.10.0.0/16"
    prod    = "10.20.0.0/16"
  }

  vpc_cidr_selected = local.vpc_cidr[terraform.workspace]

  # Filled from data.aws_caller_identity after apply/plan (your xiayulin account)
  account_id_selected = data.aws_caller_identity.current.account_id
}
