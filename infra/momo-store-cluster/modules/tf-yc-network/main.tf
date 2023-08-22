data "yandex_vpc_network" "mynet" {
  name = "mynet"
}

data "yandex_vpc_subnet" "mysubnet" {
  name = "${data.yandex_vpc_network.mynet.id}"
}
