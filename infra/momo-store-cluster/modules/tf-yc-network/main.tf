data "yandex_vpc_network" "mynet" {
  name = "mynet"
}

data "yandex_vpc_subnet" "mysubnet" {
  name = "mysubnet"
}
