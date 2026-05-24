variable "cluster_name" {
  description = "EKS cluster name."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID from the VPC stack (used for tagging/context)."
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for the EKS control plane and worker nodes."
  type        = list(string)
}

variable "kubernetes_version" {
  description = "Kubernetes control plane version."
  type        = string
  default     = "1.31"
}

variable "cluster_endpoint_public_access" {
  description = "Public API endpoint (needed for kubectl/helm from your laptop in dev)."
  type        = bool
  default     = true
}

variable "enabled_cluster_log_types" {
  description = "Control plane logs sent to CloudWatch (api, audit, authenticator, controllerManager, scheduler)."
  type        = list(string)
  default     = ["api", "audit"]
}

variable "node_capacity_type" {
  description = "ON_DEMAND or SPOT."
  type        = string
  default     = "ON_DEMAND"
}

variable "node_instance_types" {
  description = "EC2 instance types for the managed node group."
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_desired_size" {
  type    = number
  default = 2
}

variable "node_min_size" {
  type    = number
  default = 2
}

variable "node_max_size" {
  type    = number
  default = 4
}

variable "tags" {
  description = "Tags applied to EKS resources."
  type        = map(string)
  default     = {}
}
