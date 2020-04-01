data "google_client_config" "default" {}

data "google_container_cluster" "mycluster" {
  name = "mycluster"
  location = var.region
}

provider "kubernetes" {
  load_config_file = false
  host = google_container_cluster.mycluster.endpoint
  token = data.google_client_config.default.access_token

  client_certificate = base64decode(google_container_cluster.mycluster.master_auth[0].client_certificate)
  client_key = base64decode(google_container_cluster.mycluster.master_auth[0].client_key)
  cluster_ca_certificate = base64decode(google_container_cluster.mycluster.master_auth[0].cluster_ca_certificate)
}
