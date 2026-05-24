resource "aws_route53_zone" "this" {
  count = var.create_zone ? 1 : 0

  name = var.domain_name

  tags = merge(var.tags, {
    Name = var.domain_name
  })
}

locals {
  zone_id = var.create_zone ? aws_route53_zone.this[0].zone_id : var.zone_id

  # Console/imported alias records use the dualstack ALB hostname.
  alb_alias_target = startswith(var.alb_dns_name, "dualstack.") ? var.alb_dns_name : "dualstack.${var.alb_dns_name}"
}

# Apex (or subdomain) A record alias → ALB
resource "aws_route53_record" "alb_alias" {
  count = var.create_alb_alias_record ? 1 : 0

  zone_id = local.zone_id
  name    = var.record_name # empty string = apex record
  type    = "A"

  alias {
    name                   = local.alb_alias_target
    zone_id                = var.alb_zone_id
    evaluate_target_health = var.evaluate_target_health
  }

  lifecycle {
    # After import, AWS may store apex as FQDN in state; empty name is equivalent.
    ignore_changes = [name]
  }
}
