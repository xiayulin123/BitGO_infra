output "certificate_arn" {
  value = aws_acm_certificate.this.arn
}

output "certificate_status" {
  value = aws_acm_certificate.this.status
}

output "domain_validation_options" {
  value = aws_acm_certificate.this.domain_validation_options
}
