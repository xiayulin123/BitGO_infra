variable "aws_account_id" {
  description = "Only required when use_assume_role is true."
  type        = string
  default     = ""
}

variable "use_assume_role" {
  description = "If false, use aws_profile from _provider.tf (IAM user Bitgo)."
  type        = bool
  default     = false
}

variable "az_count" {
  description = "Number of AZs for the VPC."
  type        = number
  default     = 2
}

variable "extra_tags" {
  description = "Additional tags passed to the VPC module."
  type        = map(string)
  default     = {}
}
