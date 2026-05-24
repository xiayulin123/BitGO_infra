# Shared configuration

When account IDs or role ARNs change, update `_workspaces.tf` in **each** stack you use:

- `resources/vpc/_workspaces.tf`
- `resources/eks/_workspaces.tf`
- `resources/alb/_workspaces.tf`
- `resources/route53/_workspaces.tf`
- `resources/acm/_workspaces.tf`
- `resources/cloudwatch/_workspaces.tf`

Each resource stack is fully independent for `plan` / `apply`.
