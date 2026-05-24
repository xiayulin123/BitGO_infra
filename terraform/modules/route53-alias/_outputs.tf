output "zone_id" {
  value = local.zone_id
}

output "zone_name_servers" {
  value = var.create_zone ? aws_route53_zone.this[0].name_servers : null
}

output "alb_record_fqdn" {
  value = var.create_alb_alias_record ? aws_route53_record.alb_alias[0].fqdn : null
}
