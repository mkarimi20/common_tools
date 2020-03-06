## Before deploy ingress for each services it will make sure all services available
module "ingress_deploy" {
  source  = "fuchicorp/chart/helm"
  deployment_name        = "ingress"
  deployment_environment = "${var.deployment_environment}"
  deployment_endpoint    = "ingress.${var.google_domain_name}"
  deployment_path        = "main-helm"

  # template_custom_vars = {
    
  #   nexusport = "${var.nexus_service_port}"
  #   vaultport = "${var.vault_service_port}"
  #   repo_port = "${var.repo_port}"
  #   email     = "${var.email}"
  #   domain_name = "${var.google_domain_name}"
  # }


  wait      = true
  name      = "services-ingress-${var.deployment_environment}"
  namespace = "${var.deployment_environment}"
  chart     = "./main-helm"

  set {
    name  = "nexusport"
    value = "${var.nexus_service_port}"
  }

  set {
    name  = "vaultport"
    value = "${var.vault_service_port}"
  }

  set {
    name  = "repo_port"
    value = "${var.repo_port}"
  }

  set {
    name  = "email"
    value = "${var.email}"
  }

  set {
    name = "domain_name"
    value = "${var.google_domain_name}"
  }
}
}


