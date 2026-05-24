variable "cluster_name" {
  description = "EKS cluster name (used to read OIDC issuer URL)."
  type        = string
}

variable "oidc_provider_arn" {
  description = "OIDC provider ARN from the EKS stack (IRSA trust)."
  type        = string
}

variable "role_name" {
  description = "IAM role name for the AWS Load Balancer Controller service account."
  type        = string
}

variable "service_account_namespace" {
  description = "Kubernetes namespace of the controller ServiceAccount."
  type        = string
  default     = "kube-system"
}

variable "service_account_name" {
  description = "Kubernetes ServiceAccount name used by Helm."
  type        = string
  default     = "aws-load-balancer-controller"
}

variable "tags" {
  description = "Tags applied to IAM role and policy."
  type        = map(string)
  default     = {}
}
