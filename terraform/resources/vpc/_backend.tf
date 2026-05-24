# Optional S3 backend — isolated state per resource stack.
#
# terraform {
#   backend "s3" {
#     bucket         = "bitgo-infraops-tfstate-UNIQUE"
#     key            = "vpc/${terraform.workspace}/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "bitgo-infraops-tf-lock"
#     encrypt        = true
#   }
# }
