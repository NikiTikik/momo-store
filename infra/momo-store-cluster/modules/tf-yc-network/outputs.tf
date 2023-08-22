output "yandex_vpc_network" {
    value = data.yandex_vpc_network.mynet
}
output "network_id" {
    value = data.yandex_vpc_network.mynet.id
}
