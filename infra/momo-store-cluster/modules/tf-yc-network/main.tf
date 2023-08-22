data "yandex_vpc_network" "mynet" {
  name = "mynet"
}

data "yandex_vpc_subnet" "mysubnet" {
  v4_cidr_blocks = ["10.1.0.0/16"]
  zone           = var.zone
  network_id     = yandex_vpc_network.mynet
}
