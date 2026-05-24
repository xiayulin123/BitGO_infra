module "dns" {
  source = "../../modules/route53-alias"

  domain_name    = local.domain_name
  create_zone    = var.create_zone
  zone_id        = var.hosted_zone_id
  alb_dns_name   = var.alb_dns_name
  record_name    = ""
  create_alb_alias_record = var.create_alb_alias_record

  tags = merge(
    {
      Environment = local.environment
      ManagedBy   = "terraform"
    },
    var.extra_tags
  )
}
