locals {
  azs = slice(data.aws_availability_zones.available.names, 0, var.az_count)

  public_subnet_cidrs = [
    for i in range(var.az_count) : cidrsubnet(var.vpc_cidr, 8, i)
  ]

  private_subnet_cidrs = [
    for i in range(var.az_count) : cidrsubnet(var.vpc_cidr, 8, i + 10)
  ]

  common_tags = merge(
    {
      Name   = var.name_prefix
      Module = "vpc"
    },
    var.tags
  )
}
