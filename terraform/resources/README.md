# Resource stacks — one folder per resource domain

Each folder is an **independent Terraform root**:

- Own `provider` + `_workspaces.tf` (switch account/role per workspace)
- Own `terraform plan` / `apply`
- Own state file (local or S3 key per stack)

| Stack | Apply from | State (local example) |
|-------|------------|------------------------|
| `vpc/` | `cd vpc && terraform apply` | `vpc/terraform.tfstate.d/<ws>/...` |
| `eks/` | `cd eks && terraform apply` | `eks/terraform.tfstate.d/<ws>/...` |
| `alb/` | `cd alb && terraform apply` | `alb/terraform.tfstate.d/<ws>/...` |
| `route53/` | `cd route53 && terraform apply` | DNS zone + apex alias → ALB |
| `acm/` | `cd acm && terraform apply` | ACM cert (import if console-created) |
| `cloudwatch/` | `cd cloudwatch && terraform apply` | ALB dashboard + 5xx alarm |

## Dependencies

- `eks` reads `vpc` outputs via `terraform_remote_state` (same workspace name in both stacks).
- `alb` reads `eks` outputs (`cluster_name`, `oidc_provider_arn`) for Load Balancer Controller IRSA.
- `route53` — hosted zone + apex **A (alias)** to Ingress ALB (`IMPORT.md` for console-created zone).
- `acm` reads `route53` `zone_id`; cert for HTTPS (`IMPORT.md`).
- `cloudwatch` discovers ALB by EKS cluster tag; dashboard + alarm.

Apply order: **vpc** → **eks** → **alb** → Helm → Ingress → **route53** → **acm** (import) → **cloudwatch**.

## Parallel work

| Developer | Stack | No conflict because |
|-----------|-------|---------------------|
| Alice | `resources/vpc/` | Separate state |
| Bob | `resources/eks/` | Separate state |

## Add more resources

Copy the pattern: `resources/<name>/` with `_workspaces.tf`, `versions.tf`, `main.tf` → `modules/<name>`.
