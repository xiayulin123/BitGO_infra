data "terraform_remote_state" "eks" {
  backend = "local"

  config = {
    path = abspath(local.eks_state_path)
  }
}
