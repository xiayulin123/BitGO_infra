# Terraform layout

```text
terraform/
├── config/                 # Reference: workspace → account mapping (sync manually)
├── modules/                # Reusable modules — never apply here
│   ├── vpc/
│   └── eks/
└── resources/              # One root per resource — apply here
    ├── vpc/                # VPC only
    └── eks/                # EKS only (reads vpc state)
```

## Apply VPC

```bash
cd terraform/resources/vpc
terraform init
terraform workspace new dev
terraform workspace select dev
terraform apply
```

## Apply EKS (after vpc, same workspace)

```bash
cd terraform/resources/eks
terraform init
terraform workspace select dev
terraform apply
```

Each `resources/*` folder has its own provider, workspace, and state.
