# CloudWatch stack

ALB **dashboard** (`bitgo-infraops-dev-alb`) and **5xx alarm**. Auto-discovers Ingress ALB via `elbv2.k8s.aws/cluster` tag.

```bash
terraform init && terraform workspace select dev
terraform apply
```

See `IMPORT.md` if importing an existing console dashboard.
