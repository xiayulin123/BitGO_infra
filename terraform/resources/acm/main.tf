locals {
  route53_zone_id = coalesce(
    var.route53_zone_id != "" ? var.route53_zone_id : null,
    try(data.terraform_remote_state.route53.outputs.zone_id, null)
  )
}

module "certificate" {
  source = "../../modules/acm-certificate"

  domain_name               = local.domain_name
  route53_zone_id           = local.route53_zone_id
  create_validation_records = var.create_validation_records
  wait_for_validation       = var.wait_for_validation

  tags = merge(
    {
      Environment = local.environment
      ManagedBy   = "terraform"
    },
    var.extra_tags
  )
}
