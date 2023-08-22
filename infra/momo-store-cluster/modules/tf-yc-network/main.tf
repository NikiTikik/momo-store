# data "yandex_vpc_network" "default" {
#   name = "default"
# }

# data "yandex_vpc_subnet" "default" {
#   name = "${data.yandex_vpc_network.default.name}-${var.zone}"
# }
resource "yandex_vpc_network" "mynet" {
  name = "mynet"
}

resource "yandex_vpc_subnet" "mysubnet" {
  v4_cidr_blocks = ["10.1.0.0/16"]
  zone           = var.zone
  network_id     = yandex_vpc_network.mynet.id
}
