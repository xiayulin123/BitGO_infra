variable "aws_account_id" {
  type    = string
  default = ""
}

variable "use_assume_role" {
  type    = bool
  default = false
}

variable "domain_name" {
  type    = string
  default = "yulin-xia-bitgo-infra-web-services.com"
}

variable "route53_zone_id" {
  description = "Override zone ID; default reads route53 stack output."
  type        = string
  default     = ""
}

variable "create_validation_records" {
  description = "false after importing existing ACM + validation CNAMEs."
  type        = bool
  default     = false
}

variable "wait_for_validation" {
  description = "false when importing an already-issued certificate."
  type        = bool
  default     = false
}

variable "extra_tags" {
  type    = map(string)
  default = {}
}
