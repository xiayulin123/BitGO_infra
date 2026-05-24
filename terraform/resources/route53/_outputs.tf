output "zone_id" {
  value = module.dns.zone_id
}

output "alb_record_fqdn" {
  value = module.dns.alb_record_fqdn
}

output "import_zone_command" {
  description = "When create_zone=false, import with: terraform import module.dns.aws_route53_zone.this[0] ZONE_ID"
  value       = "terraform import 'module.dns.aws_route53_zone.this[0]' <ZONE_ID>  # only if create_zone=true"
}
