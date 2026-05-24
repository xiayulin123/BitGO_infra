variable "aws_account_id" {
  type    = string
  default = ""
}

variable "use_assume_role" {
  type    = bool
  default = false
}

variable "cluster_name" {
  description = "EKS cluster name for discovering ingress ALB tags."
  type        = string
  default     = ""
}

variable "alb_arn" {
  description = "Override ALB ARN if multiple LBs match cluster tag."
  type        = string
  default     = ""
}

variable "alb_load_balancer_dimension" {
  description = "Override CloudWatch LoadBalancer dimension (app/name/id)."
  type        = string
  default     = ""
}

variable "create_5xx_alarm" {
  type    = bool
  default = true
}

variable "create_dashboard" {
  type    = bool
  default = true
}

variable "alarm_sns_topic_arns" {
  type    = list(string)
  default = []
}

variable "extra_tags" {
  type    = map(string)
  default = {}
}
