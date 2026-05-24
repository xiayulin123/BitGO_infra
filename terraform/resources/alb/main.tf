module "lb_controller_irsa" {
  source = "../../modules/lb-controller-irsa"

  cluster_name      = data.terraform_remote_state.eks.outputs.cluster_name
  oidc_provider_arn = data.terraform_remote_state.eks.outputs.oidc_provider_arn

  role_name = "${local.project_name}-${local.environment}-aws-lbc"

  service_account_namespace = var.service_account_namespace
  service_account_name      = var.service_account_name

  tags = merge(
    {
      Environment = local.environment
      AccountId   = local.account_id_selected
      Region      = local.aws_region
      ManagedBy   = "terraform"
      Component   = "aws-load-balancer-controller"
    },
    var.extra_tags
  )
}
