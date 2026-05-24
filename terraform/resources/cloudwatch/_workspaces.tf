locals {
  environment = terraform.workspace

  account_id_selected = data.aws_caller_identity.current.account_id

  cluster_name = coalesce(
    var.cluster_name != "" ? var.cluster_name : null,
    try(data.terraform_remote_state.eks.outputs.cluster_name, "bitgo-infraops-dev")
  )
}
