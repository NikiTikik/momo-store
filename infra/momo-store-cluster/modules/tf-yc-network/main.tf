data "yandex_vpc_network" "mynet" {
  name = "mynet"
}

data "yandex_vpc_subnet" "mysubnet" {
  zone = var.zone
  name = "${data.yandex_vpc_network.mynet.name}"
}
