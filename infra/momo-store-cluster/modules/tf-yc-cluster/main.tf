resource "yandex_kubernetes_cluster" "k8s-momo" {
  network_id = yandex_vpc_network.mynet.id
  master {
    version = var.k8s_version
    public_ip = true
    zonal {
      zone      = var.zone
      subnet_id = yandex_vpc_subnet.mysubnet.id
    }
  }
  service_account_id      = yandex_iam_service_account.myaccount.id
  node_service_account_id = yandex_iam_service_account.myaccount.id
}

resource "yandex_kubernetes_node_group" "my_node_group" {
  cluster_id  = "${yandex_kubernetes_cluster.k8s-momo.id}"
  name        = "prod-node-group"
  description = "cluster 1x1"
  version     = var.k8s_version

  labels = {
    "app" = "momo-store"
  }

  instance_template {
    platform_id = "standard-v2"

    network_interface {
      nat                = true
      subnet_ids         = [yandex_vpc_subnet.mysubnet.id]
    }

    resources {
      memory = 4
      cores  = 4
    }

    boot_disk {
      type = "network-hdd"
      size = 64
    }

    scheduling_policy {
      preemptible = false
    }

    container_runtime {
      type = "containerd"
    }
  }
   scale_policy {
    fixed_scale {
      size = 2
    }
  }

  allocation_policy {
    location {
      zone = var.zone
    }
  }

  maintenance_policy {
    auto_upgrade = true
    auto_repair  = true
  }
}
