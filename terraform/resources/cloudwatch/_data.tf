data "aws_caller_identity" "current" {}

# Ingress ALB created by AWS Load Balancer Controller (tagged with cluster name)
data "aws_lbs" "ingress" {
  tags = {
    "elbv2.k8s.aws/cluster" = local.cluster_name
  }
}

data "aws_lb" "ingress" {
  arn = var.alb_arn != "" ? var.alb_arn : one(data.aws_lbs.ingress.arns)
}

locals {
  alb_load_balancer_dimension = var.alb_load_balancer_dimension != "" ? var.alb_load_balancer_dimension : element(
    split("loadbalancer/", data.aws_lb.ingress.arn),
    1
  )
}
