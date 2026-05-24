variable "domain_name" {
  type = string
}

variable "subject_alternative_names" {
  type    = list(string)
  default = []
}

variable "route53_zone_id" {
  description = "Hosted zone ID for DNS validation records."
  type        = string
}

variable "create_validation_records" {
  description = "Set false when importing existing validation records managed elsewhere."
  type        = bool
  default     = true
}

variable "wait_for_validation" {
  description = "Wait until ACM status is ISSUED. Set false when importing an already-issued cert."
  type        = bool
  default     = true
}

variable "tags" {
  type    = map(string)
  default = {}
}
