variable "aws_account_id" {
  type    = string
  default = ""
}

variable "use_assume_role" {
  type    = bool
  default = false
}

variable "domain_name" {
  description = "Registered domain / hosted zone name."
  type        = string
  default     = "yulin-xia-bitgo-infra-web-services.com"
}

variable "hosted_zone_id" {
  description = "Existing Route53 hosted zone ID (required when create_zone=false)."
  type        = string
  default     = ""
}

variable "create_zone" {
  description = "false when domain already registered — import existing hosted zone."
  type        = bool
  default     = false
}

variable "alb_dns_name" {
  description = "Ingress ALB hostname (kubectl get ingress ADDRESS)."
  type        = string
  default     = "k8s-default-scalable-78417c9b8f-608439848.us-east-1.elb.amazonaws.com"
}

variable "create_alb_alias_record" {
  type    = bool
  default = true
}

variable "extra_tags" {
  type    = map(string)
  default = {}
}
