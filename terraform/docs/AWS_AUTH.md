# AWS authentication

Credentials stay in `~/.aws/credentials` (profile `bitgo` for IAM user Bitgo).

Provider settings are in each stack's `_provider.tf` / `_providers.tf`:

- `region` = `us-east-1`
- `profile` = `bitgo`

No `terraform.tfvars` required. Edit `_provider.tf` if you need to change region or profile.

```bash
aws configure --profile bitgo
aws sts get-caller-identity --profile bitgo

cd terraform/resources/vpc
terraform init
terraform workspace select dev
terraform plan
```
