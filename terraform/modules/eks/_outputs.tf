output "cluster_name" {
  description = "EKS cluster name."
  value       = aws_eks_cluster.this.name
}

output "cluster_arn" {
  description = "EKS cluster ARN."
  value       = aws_eks_cluster.this.arn
}

output "cluster_endpoint" {
  description = "Kubernetes API server endpoint."
  value       = aws_eks_cluster.this.endpoint
}

output "cluster_certificate_authority_data" {
  description = "Base64 CA for kubectl."
  value       = aws_eks_cluster.this.certificate_authority[0].data
}

output "cluster_security_group_id" {
  description = "Cluster security group created by EKS."
  value       = aws_eks_cluster.this.vpc_config[0].cluster_security_group_id
}

output "oidc_provider_arn" {
  description = "OIDC provider ARN for IRSA (pods assume IAM roles without static keys)."
  value       = aws_iam_openid_connect_provider.eks.arn
}

output "node_role_arn" {
  description = "IAM role ARN attached to worker nodes."
  value       = aws_iam_role.node.arn
}

output "cluster_role_arn" {
  description = "IAM role ARN for the EKS control plane."
  value       = aws_iam_role.cluster.arn
}
