provider "google" {
  credentials = file("adfs-dev.json")
  project     = var.projeto
  region      = var.regiao
}

provider "google-beta" {
  credentials = file("adfs-dev.json")
  project     = var.projeto
  region      = var.regiao

}

data "google_client_config" "provider" {

}

provider "kubernetes" {
  host        = "https://${google_container_cluster.cluster-uptime.endpoint}"
  token       = data.google_client_config.provider.access_token
  config_path = "~/.kube/config_a.yaml"

  client_certificate = base64decode(
    google_container_cluster.cluster-uptime.master_auth[0].client_certificate,
  )

  cluster_ca_certificate = base64decode(
    google_container_cluster.cluster-uptime.master_auth[0].cluster_ca_certificate,
  )
  client_key = base64decode(google_container_cluster.cluster-uptime.master_auth[0].client_key)
}