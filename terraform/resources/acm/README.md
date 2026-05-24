# ACM stack

TLS certificate for `yulin-xia-bitgo-infra-web-services.com`. Uses `route53` stack `zone_id` for DNS validation records.

**Import existing Issued cert:** see `IMPORT.md`, set `create_validation_records = false`.

```bash
cp terraform.tfvars.example terraform.tfvars
terraform init && terraform workspace select dev
terraform import 'module.certificate.aws_acm_certificate.this' arn:aws:acm:us-east-1:ACCOUNT:certificate/ID
terraform plan
```
