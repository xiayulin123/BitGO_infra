locals {
  alarm_name = "${var.name_prefix}-alb-target-5xx"
}

resource "aws_cloudwatch_metric_alarm" "target_5xx" {
  count = var.create_5xx_alarm ? 1 : 0

  alarm_name          = local.alarm_name
  alarm_description   = "ALB target 5xx for ${var.name_prefix}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.alarm_evaluation_periods
  metric_name         = "HTTPCode_Target_5XX_Count"
  namespace           = "AWS/ApplicationELB"
  period              = var.alarm_period_seconds
  statistic           = "Sum"
  threshold           = 0
  treat_missing_data  = "notBreaching"

  dimensions = {
    LoadBalancer = var.alb_load_balancer_dimension
  }

  alarm_actions = var.alarm_sns_topic_arns
  ok_actions    = var.alarm_sns_topic_arns

  tags = var.tags
}

resource "aws_cloudwatch_dashboard" "alb" {
  count = var.create_dashboard ? 1 : 0

  dashboard_name = "${var.name_prefix}-alb"
  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6
        properties = {
          title  = "ALB Requests"
          region = var.aws_region
          metrics = [
            ["AWS/ApplicationELB", "RequestCount", "LoadBalancer", var.alb_load_balancer_dimension]
          ]
          stat   = "Sum"
          period = 60
        }
      },
      {
        type   = "metric"
        x      = 12
        y      = 0
        width  = 12
        height = 6
        properties = {
          title  = "Target Response Time"
          region = var.aws_region
          metrics = [
            ["AWS/ApplicationELB", "TargetResponseTime", "LoadBalancer", var.alb_load_balancer_dimension]
          ]
          stat   = "Average"
          period = 60
        }
      },
      {
        type   = "metric"
        x      = 0
        y      = 6
        width  = 12
        height = 6
        properties = {
          title  = "Target 5XX"
          region = var.aws_region
          metrics = [
            ["AWS/ApplicationELB", "HTTPCode_Target_5XX_Count", "LoadBalancer", var.alb_load_balancer_dimension]
          ]
          stat   = "Sum"
          period = 60
        }
      },
      {
        type   = "metric"
        x      = 12
        y      = 6
        width  = 12
        height = 6
        properties = {
          title  = "Healthy Hosts"
          region = var.aws_region
          metrics = [
            ["AWS/ApplicationELB", "HealthyHostCount", "LoadBalancer", var.alb_load_balancer_dimension]
          ]
          stat   = "Average"
          period = 60
        }
      }
    ]
  })
}
