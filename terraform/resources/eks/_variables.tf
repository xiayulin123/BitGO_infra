variable "aws_account_id" {
  description = "Only required when use_assume_role is true."
  type        = string
  default     = ""
}

variable "use_assume_role" {
  type    = bool
  default = false
}

variable "kubernetes_version" {
  type    = string
  default = "1.31"
}

variable "node_desired_size" {
  description = "Worker nodes (>=2 for HA across AZs)."
  type        = number
  default     = 2
}

variable "node_min_size" {
  type    = number
  default = 2
}

variable "node_max_size" {
  type    = number
  default = 4
}

variable "node_instance_types" {
  type    = list(string)
  default = ["t3.medium"]
}

variable "extra_tags" {
  type    = map(string)
  default = {}
}
