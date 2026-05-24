output "alb_arn" {
  value = data.aws_lb.ingress.arn
}

output "alb_load_balancer_dimension" {
  description = "Use in debugging CloudWatch metrics."
  value       = local.alb_load_balancer_dimension
}

output "alarm_arn" {
  value = module.alb_monitoring.alarm_arn
}

output "dashboard_name" {
  value = module.alb_monitoring.dashboard_name
}
