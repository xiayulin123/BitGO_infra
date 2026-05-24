# Architecture — BitGo InfraOps Assessment

## High-level diagram (Mermaid)

```mermaid
flowchart TB
    subgraph Internet
        Users[Users / Graders]
    end

    subgraph AWS["AWS Account (us-east-1)"]
        subgraph Public["Public Subnets (2 AZs)"]
            ALB[Application Load Balancer<br/>HTTPS :443]
            NAT[NAT Gateway]
        end

        subgraph Private["Private Subnets (2 AZs)"]
            subgraph EKS["Amazon EKS"]
                ING[Ingress / ALB Controller]
                DEP[Deployment: scalable-web-service<br/>min 2 replicas]
                HPA[Horizontal Pod Autoscaler<br/>CPU / Memory]
            end
        end

        ACM[ACM Certificate]
        CW[CloudWatch<br/>Logs + Metrics + Alarm]
        IAM[IAM / IRSA<br/>No static keys in pods]
    end

    APP[(Container<br/>ghcr.io/.../scalable-web-service:v1<br/>:8080 /health /metrics)]

    Users -->|HTTPS| ALB
    ACM -.->|TLS| ALB
    ALB --> ING
    ING --> DEP
    HPA -->|scales| DEP
    DEP --> APP
    DEP -->|logs & metrics| CW
    ALB -->|health check /health| DEP
    Private -->|egress via| NAT
    IAM -.->|pod identity| DEP
```

## Traffic & scaling flow

```mermaid
sequenceDiagram
    participant U as User
    participant ALB as ALB
    participant P as Pod
    participant HPA as HPA
    participant CW as CloudWatch

    U->>ALB: HTTPS GET /
    ALB->>P: forward (healthy targets only)
    P-->>ALB: 200 OK
    Note over ALB,P: /health fails → target drained

    U->>ALB: sustained load
    P->>P: CPU rises
    HPA->>P: increase replicas (2 → N)
    P->>CW: metrics / logs
    Note over HPA: load drops → scale in
```

## Design decisions (for README & interview)

| Decision | Choice | Why |
|----------|--------|-----|
| Compute | EKS + managed node group | Matches InfraOps/K8s; easy HPA; multi-replica HA |
| Entry | ALB + ACM | PDF requires HTTPS; native health checks |
| Network | Private subnets for nodes/pods | Reduce attack surface; egress via NAT |
| HA | ≥2 replicas, 2 AZs | Survives loss of one instance/node |
| Scaling | HPA on CPU (and/or memory) | App exposes `/metrics`; CPU HPA is enough for PDF |
| Observability | CloudWatch + ALB metrics | Meets “at least one”; fast to implement |
| IAM | IRSA for workloads | Least privilege; no keys in Deployment |
| Out of scope | CI/CD, multi-region, DB | Per PDF — document in README |

## What graders will test

1. `https://<your-url>/` — works
2. `https://<your-url>/health` — healthy
3. Load spike → replica count increases → decreases after load stops
4. Kill one pod → endpoint still works
5. Terraform repo explains VPC, EKS, ALB, scaling, IAM
