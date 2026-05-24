output "role_arn" {
  description = "IAM role ARN — pass to Helm serviceAccount annotation."
  value       = aws_iam_role.load_balancer_controller.arn
}

output "role_name" {
  description = "IAM role name."
  value       = aws_iam_role.load_balancer_controller.name
}

output "policy_arn" {
  description = "Attached IAM policy ARN."
  value       = aws_iam_policy.load_balancer_controller.arn
}

output "service_account_subject" {
  description = "OIDC subject bound to this role (must match Helm ServiceAccount)."
  value       = local.sa_subject
}
