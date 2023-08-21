resource "yandex_kubernetes_cluster" "k8s-momo" {
  network_id = yandex_vpc_network.mynet.id
  master {
    version = var.k8s_version
    public_ip = true
    zonal {
      zone      = yandex_vpc_subnet.mysubnet.zone
      subnet_id = yandex_vpc_subnet.mysubnet.id
    }
  }
  service_account_id      = yandex_iam_service_account.myaccount.id
  node_service_account_id = yandex_iam_service_account.myaccount.id
  depends_on = [
    yandex_resourcemanager_folder_iam_member.k8s-clusters-agent,
    yandex_resourcemanager_folder_iam_member.vpc-public-admin,
    yandex_resourcemanager_folder_iam_member.images-puller
  ]
  kms_provider {
    key_id = yandex_kms_symmetric_key.kms-key.id
  }
}

resource "yandex_vpc_network" "mynet" {
  name = "mynet"
}

resource "yandex_vpc_subnet" "mysubnet" {
  v4_cidr_blocks = ["10.1.0.0/16"]
  zone           = var.zone
  network_id     = yandex_vpc_network.mynet.id
}

resource "yandex_iam_service_account" "myaccount" {
  name        = var.sa_name
  description = "K8S zonal service account"
}

resource "yandex_resourcemanager_folder_iam_member" "k8s-clusters-agent" {
  # Сервисному аккаунту назначается роль "k8s.clusters.agent".
  folder_id = var.folder_id
  role      = "k8s.clusters.agent"
  member    = "serviceAccount:${yandex_iam_service_account.myaccount.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "vpc-public-admin" {
  # Сервисному аккаунту назначается роль "vpc.publicAdmin".
  folder_id = var.folder_id
  role      = "vpc.publicAdmin"
  member    = "serviceAccount:${yandex_iam_service_account.myaccount.id}"
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
