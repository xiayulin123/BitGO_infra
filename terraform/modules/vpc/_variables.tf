variable "name_prefix" {
  description = "Prefix for VPC resource names and tags."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "az_count" {
  description = "Number of availability zones to use."
  type        = number
  default     = 2
}

variable "tags" {
  description = "Additional tags applied to all VPC resources."
  type        = map(string)
  default     = {}
}
