resource "google_container_cluster" "cluster-uptime" {
  name     = "cluster-uptime"
  location = var.zona
  project  = var.projeto

  initial_node_count = 3
  #remove_default_node_pool = true

}

resource "google_container_node_pool" "node-pool-uptime" {
  name     = "node-pool-uptime"
  location = var.zona
  project  = var.projeto
  cluster  = google_container_cluster.cluster-uptime.name


  node_config {
    preemptible  = true
    machine_type = var.tipo-vm
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

  }
}
