module "vpc" {
  source = "../../modules/vpc"

  name_prefix = "${local.project_name}-${local.environment}"
  vpc_cidr    = local.vpc_cidr_selected
  az_count    = var.az_count

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
