resource "kubernetes_deployment_v1" "uptime_deployment" {
  metadata {
    name = "uptime-deployment"
    labels = {
      app = "uptime-test"
    }
  }

  spec {
    replicas = 1

    strategy {
      type = "Recreate"
    }

    selector {
      match_labels = {
        app = "uptime-test"
      }
    }

    template {
      metadata {
        labels = {
          app = "uptime-test"
        }
      }
      spec {
        volume {
          name = "uptime-pvc-vol"
          persistent_volume_claim {
            claim_name = "uptime-pvc"
          }
        }
        container {
          name  = "uptime-test"
          image = "guisousa/uptime:3.1"

          port {
            container_port = 80
          }

          volume_mount {
            mount_path = "/uptime-kuma/data"
            name       = "uptime-pvc-vol"
          }


        }
      }
    }
  }
}