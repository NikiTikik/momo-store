module "tf-yc-network" {
  source = "./modules/tf-yc-network"
  zone = "ru-central1-a"
} 
module "tf-yc-iam" {
  source = "./modules/tf-yc-iam"
  sa_name = "k8s-adm"
  folder_id = var.folder_id
} 
module "tf-yc-cluster" {
  source = "./modules/tf-yc-cluster"
  k8s_version = "1.25"
  zone = "ru-central1-a"
  subnet_id = module.tf-yc-network.yandex_vpc_network.subnet_id
  network_id = module.tf-yc-network.yandex_vpc_network.network_id
  yandex_iam_service_account_id = module.tf-yc-iam.yandex_iam_service_account_id
} 

output "subnet_id" {
  value = module.tf-yc-network.yandex_vpc_network
}
output "yandex_iam_service_account_id" {
  value = module.tf-yc-iam.yandex_iam_service_account_id
}
