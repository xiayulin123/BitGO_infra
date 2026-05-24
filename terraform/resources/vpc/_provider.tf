# AWS provider only — locals live in _locals.tf

provider "aws" {
  region  = local.aws_region
  profile = local.aws_profile

  dynamic "assume_role" {
    for_each = var.use_assume_role ? [1] : []
    content {
      role_arn = local.assume_role_arns[terraform.workspace]
    }
  }

  default_tags {
    tags = {
      Environment = local.environment
      Project     = local.project_name
      IamUser     = local.iam_user_name
    }
  }
}
