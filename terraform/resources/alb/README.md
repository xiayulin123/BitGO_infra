# ALB stack — Load Balancer Controller IRSA

Creates the **IAM role + policy** so the AWS Load Balancer Controller pod can create ALBs in your account. Does **not** install Helm/Kubernetes resources (run Helm after apply).

Depends on **EKS stack** (`resources/eks`) with the **same workspace** (e.g. `dev`).

## Apply

```bash
cd terraform/resources/alb
/opt/homebrew/bin/terraform init
/opt/homebrew/bin/terraform workspace select dev   # or: workspace new dev
/opt/homebrew/bin/terraform plan
/opt/homebrew/bin/terraform apply
```

## Outputs

```bash
terraform output load_balancer_controller_role_arn
terraform output -raw helm_install_example
```

## Install controller (after Terraform)

```bash
# From repo root; replace VPC_ID
export VPC_ID=$(terraform -chdir=terraform/resources/vpc output -raw vpc_id)
export CLUSTER=$(terraform -chdir=terraform/resources/eks output -raw cluster_name)
export ROLE_ARN=$(terraform -chdir=terraform/resources/alb output -raw load_balancer_controller_role_arn)

helm repo add eks https://aws.github.io/eks-charts
helm repo update

helm upgrade --install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName="$CLUSTER" \
  --set region=us-east-1 \
  --set vpcId="$VPC_ID" \
  --set serviceAccount.create=true \
  --set serviceAccount.name=aws-load-balancer-controller \
  --set serviceAccount.annotations."eks\.amazonaws\.com/role-arn"="$ROLE_ARN"

kubectl get deployment -n kube-system aws-load-balancer-controller
```

## Verify IRSA

```bash
kubectl describe sa -n kube-system aws-load-balancer-controller | grep role-arn
```

The annotation must match `load_balancer_controller_role_arn`.
