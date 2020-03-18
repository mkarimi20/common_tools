module "dash_auth_deployer" {
  source  = "fuchicorp/chart/helm"
  deployment_name        = "dash_auth-${var.deployment_environment}"
  deployment_environment = "kube-system"
  deployment_endpoint    = "dashboard.${var.google_domain_name}"
  deployment_path        = "dashboard-auth"
  github_client_id       = "${var.github_client_id}"
  github_client_secret   = "${var.github_client_secret}"
  cooki_secret           = "${var.cooki_secret}"







}