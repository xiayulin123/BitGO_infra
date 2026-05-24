output "alarm_arn" {
  value = var.create_5xx_alarm ? aws_cloudwatch_metric_alarm.target_5xx[0].arn : null
}

output "dashboard_name" {
  value = var.create_dashboard ? aws_cloudwatch_dashboard.alb[0].dashboard_name : null
}
