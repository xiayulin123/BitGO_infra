data "terraform_remote_state" "vpc" {
  backend = "local"

  config = {
    path = abspath(local.vpc_state_path)
  }
}
