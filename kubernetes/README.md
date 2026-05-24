# Kubernetes manifests

## Apply (runs on EKS, not your laptop)

```bash
# Confirm context points to EKS (not docker-desktop)
kubectl config current-context

aws eks update-kubeconfig --region us-east-1 --name bitgo-infraops-dev --profile bitgo

kubectl apply -f kubernetes/deployment.yaml -f kubernetes/service.yaml
kubectl apply -f kubernetes/ingress.yaml
kubectl apply -f kubernetes/hpa.yaml

kubectl get pods -o wide
kubectl get ingress -w
```

## Route53 (after Ingress has an ADDRESS)

1. `kubectl get ingress scalable-web-service` → copy the ALB hostname (e.g. `k8s-....elb.amazonaws.com`).
2. Route53 → Hosted zone `yulin-xia-bitgo-infra-web-services.com` → Create record:
   - **Record name**: leave blank (apex) or match your ACM FQDN
   - **Type**: CNAME (or Alias to ALB if offered)
   - **Value**: ALB hostname from Ingress
3. Test: `curl https://yulin-xia-bitgo-infra-web-services.com/health`

Live URL for README: `https://yulin-xia-bitgo-infra-web-services.com`

## Temporary local test (optional)

`port-forward` only opens a tunnel from your laptop to a Service **already running in EKS**:

```bash
kubectl port-forward svc/scalable-web-service 8080:8080
# In another terminal:
curl http://localhost:8080/health
```

Stop with Ctrl+C. This does not run the app locally.
