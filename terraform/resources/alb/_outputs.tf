output "workspace" {
  value = terraform.workspace
}

output "cluster_name" {
  description = "EKS cluster name (from remote state)."
  value       = data.terraform_remote_state.eks.outputs.cluster_name
}

output "load_balancer_controller_role_arn" {
  description = "IRSA role ARN for Helm: serviceAccount.annotations.eks.amazonaws.com/role-arn"
  value       = module.lb_controller_irsa.role_arn
}

output "service_account_subject" {
  description = "OIDC subject bound to the role (must match Helm ServiceAccount)."
  value       = module.lb_controller_irsa.service_account_subject
}

output "helm_install_example" {
  description = "Run after apply (set vpcId from: terraform -chdir=../vpc output -raw vpc_id)"
  value       = <<-EOT
    helm repo add eks https://aws.github.io/eks-charts
    helm repo update
    helm upgrade --install aws-load-balancer-controller eks/aws-load-balancer-controller \
      -n kube-system \
      --set clusterName=${data.terraform_remote_state.eks.outputs.cluster_name} \
      --set region=${data.aws_region.current.name} \
      --set vpcId=<VPC_ID_FROM_VPC_STACK> \
      --set serviceAccount.create=true \
      --set serviceAccount.name=${var.service_account_name} \
      --set serviceAccount.annotations."eks\.amazonaws\.com/role-arn"=${module.lb_controller_irsa.role_arn}
  EOT
}
