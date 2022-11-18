resource "kubernetes_service_v1" "service_uptime_lb" {
  metadata {
    name      = "uptime-lb"
    namespace = "default"
    labels = {
      app = "uptime-test"
    }
  }

  spec {
    port {
      protocol    = "TCP"
      port        = 80
      target_port = 3001
    }

    selector = {
      app = "uptime-test"
    }
    type = "LoadBalancer"
  }

}
