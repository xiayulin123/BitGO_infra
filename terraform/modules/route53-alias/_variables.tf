variable "domain_name" {
  description = "Hosted zone name (e.g. example.com)."
  type        = string
}

variable "create_zone" {
  description = "Create a new hosted zone. Set false when importing an existing zone (register in console)."
  type        = bool
  default     = false
}

variable "zone_id" {
  description = "Existing hosted zone ID when create_zone is false."
  type        = string
  default     = ""
}

variable "create_alb_alias_record" {
  description = "Create A (alias) record pointing to the ingress ALB."
  type        = bool
  default     = true
}

variable "record_name" {
  description = "Leave empty for apex. Or set subdomain label only (e.g. app)."
  type        = string
  default     = ""
}

variable "alb_dns_name" {
  description = "ALB DNS name from kubectl get ingress (ADDRESS)."
  type        = string
  default     = ""
}

variable "alb_zone_id" {
  description = "Hosted zone ID for ALB aliases in this region (us-east-1: Z35SXDOTRQ7X7K)."
  type        = string
  default     = "Z35SXDOTRQ7X7K"
}

variable "evaluate_target_health" {
  type    = bool
  default = true
}

variable "tags" {
  type    = map(string)
  default = {}
}
