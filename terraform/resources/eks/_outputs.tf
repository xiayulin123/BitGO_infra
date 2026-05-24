output "workspace" {
  value = terraform.workspace
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  value     = module.eks.cluster_certificate_authority_data
  sensitive = true
}

output "oidc_provider_arn" {
  description = "Use for IRSA when installing AWS Load Balancer Controller."
  value       = module.eks.oidc_provider_arn
}

output "configure_kubectl" {
  description = "Run after apply to use kubectl locally."
  value       = "aws eks update-kubeconfig --region ${local.aws_region} --name ${module.eks.cluster_name} --profile ${local.aws_profile}"
}
