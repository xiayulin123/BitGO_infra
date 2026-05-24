variable "name_prefix" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "alb_load_balancer_dimension" {
  description = "CloudWatch dimension value, e.g. app/k8s-default-scalable-xxx/608439848"
  type        = string
}

variable "create_5xx_alarm" {
  type    = bool
  default = true
}

variable "create_dashboard" {
  type    = bool
  default = true
}

variable "alarm_period_seconds" {
  type    = number
  default = 60
}

variable "alarm_evaluation_periods" {
  type    = number
  default = 1
}

variable "alarm_sns_topic_arns" {
  type    = list(string)
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}
