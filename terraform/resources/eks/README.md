# EKS stack

Depends on **VPC stack** (`resources/vpc`) with the **same workspace** (e.g. `dev`).

## Apply

```bash
cd terraform/resources/eks
/opt/homebrew/bin/terraform init   # use ARM terraform on Apple Silicon
/opt/homebrew/bin/terraform workspace select dev
/opt/homebrew/bin/terraform plan
/opt/homebrew/bin/terraform apply
```

## After apply

```bash
$(terraform output -raw configure_kubectl)
kubectl get nodes
```
