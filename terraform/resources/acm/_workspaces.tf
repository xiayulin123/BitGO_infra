locals {
  environment = terraform.workspace

  account_id_selected = data.aws_caller_identity.current.account_id
}
