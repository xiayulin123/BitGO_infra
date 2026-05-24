# Optional S3 backend:
# terraform {
#   backend "s3" {
#     bucket         = "bitgo-infraops-tfstate-UNIQUE"
#     key            = "acm/${terraform.workspace}/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "bitgo-infraops-tf-lock"
#     encrypt        = true
#   }
# }
