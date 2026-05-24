data "terraform_remote_state" "route53" {
  backend = "local"

  config = {
    path = abspath(local.route53_state_path)
  }
}
