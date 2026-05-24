# Optional S3 backend — separate key from vpc/eks stacks.
#
# terraform {
#   backend "s3" {
#     bucket         = "bitgo-infraops-tfstate-UNIQUE"
#     key            = "alb/${terraform.workspace}/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "bitgo-infraops-tf-lock"
#     encrypt        = true
#   }
# }
