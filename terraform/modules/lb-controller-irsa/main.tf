# IRSA for AWS Load Balancer Controller (v2.8.x policy).
# Policy source: kubernetes-sigs/aws-load-balancer-controller docs/install/iam_policy.json

data "aws_eks_cluster" "this" {
  name = var.cluster_name
}

locals {
  oidc_issuer_host = replace(data.aws_eks_cluster.this.identity[0].oidc[0].issuer, "https://", "")
  sa_subject       = "system:serviceaccount:${var.service_account_namespace}:${var.service_account_name}"
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [var.oidc_provider_arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${local.oidc_issuer_host}:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "${local.oidc_issuer_host}:sub"
      values   = [local.sa_subject]
    }
  }
}

resource "aws_iam_role" "load_balancer_controller" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = merge(var.tags, {
    Name = var.role_name
  })
}

resource "aws_iam_policy" "load_balancer_controller" {
  name        = "${var.role_name}-policy"
  description = "IAM policy for AWS Load Balancer Controller (IRSA)"
  policy      = file("${path.module}/iam_policy.json")

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "load_balancer_controller" {
  role       = aws_iam_role.load_balancer_controller.name
  policy_arn = aws_iam_policy.load_balancer_controller.arn
}
