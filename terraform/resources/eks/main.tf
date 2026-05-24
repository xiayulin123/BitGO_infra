module "eks" {
  source = "../../modules/eks"

  cluster_name       = "${local.project_name}-${local.environment}"
  vpc_id             = data.terraform_remote_state.vpc.outputs.vpc_id
  private_subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnet_ids

  kubernetes_version = var.kubernetes_version

  node_desired_size = var.node_desired_size
  node_min_size     = var.node_min_size
  node_max_size     = var.node_max_size
  node_instance_types = var.node_instance_types

  tags = merge(
    {
      Environment = local.environment
      AccountId   = local.account_id_selected
      Region      = local.aws_region
      ManagedBy   = "terraform"
    },
    var.extra_tags
  )
}
