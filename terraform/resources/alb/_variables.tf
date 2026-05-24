variable "aws_account_id" {
  description = "Only required when use_assume_role is true."
  type        = string
  default     = ""
}

variable "use_assume_role" {
  type    = bool
  default = false
}

variable "service_account_namespace" {
  description = "Must match Helm install namespace for the controller."
  type        = string
  default     = "kube-system"
}

variable "service_account_name" {
  description = "Must match Helm serviceAccount.name."
  type        = string
  default     = "aws-load-balancer-controller"
}

variable "extra_tags" {
  type    = map(string)
  default = {}
}
