output "yandex_vpc_network" {
    value = yandex_vpc_network.mynet
}
output "network_id" {
    value = yandex_vpc_network.mynet.id
}
output "subnet_id" {
    value = yandex_vpc_subnet.mysubnet.id
}
