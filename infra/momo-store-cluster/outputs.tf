output "cluster_external_v4_endpoint" {
  value = yandex_kubernetes_cluster.zonal_cluster_resource_name.master.0.external_v4_endpoint
}

output "my_node_group_status" {
  value = yandex_kubernetes_node_group.my_node_group.status
}
