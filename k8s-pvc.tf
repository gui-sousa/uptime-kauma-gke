resource "kubernetes_persistent_volume_claim_v1" "uptime-pvc" {
  metadata {
    name      = "uptime-pvc"
    namespace = "default"
    labels = {
      app = "uptime-test"
    }
  }

  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "30Gi"
      }
    }

    storage_class_name = "standard-rwo"
  }
}