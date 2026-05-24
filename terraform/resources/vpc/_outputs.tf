output "workspace" {
  description = "Active Terraform workspace."
  value       = terraform.workspace
}

output "aws_account_id" {
  description = "Target AWS account for this workspace."
  value       = local.account_id_selected
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr" {
  value = module.vpc.vpc_cidr
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "availability_zones" {
  value = module.vpc.availability_zones
}

output "nat_gateway_id" {
  value = module.vpc.nat_gateway_id
}
