module "alb_monitoring" {
  source = "../../modules/cloudwatch-alb"

  name_prefix                 = local.name_prefix
  aws_region                  = local.aws_region
  alb_load_balancer_dimension = local.alb_load_balancer_dimension
  create_5xx_alarm            = var.create_5xx_alarm
  create_dashboard            = var.create_dashboard
  alarm_sns_topic_arns        = var.alarm_sns_topic_arns

  tags = merge(
    {
      Environment = local.environment
      ManagedBy   = "terraform"
    },
    var.extra_tags
  )
}
