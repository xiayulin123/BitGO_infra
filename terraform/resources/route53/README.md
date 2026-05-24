# Route53 stack

Manages **hosted zone reference** and **apex A (alias)** record → Ingress ALB.

Domain registration in Route53 console is **not** recreated here when `create_zone = false` — pass `hosted_zone_id` and use `IMPORT.md`.

```bash
cp terraform.tfvars.example terraform.tfvars
# Edit hosted_zone_id from console

terraform init
terraform workspace select dev
terraform plan
# Import apex record per IMPORT.md, then plan again
```
