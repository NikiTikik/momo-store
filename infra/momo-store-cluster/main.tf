module "tf-yc-network" {
  source = "./modules/tf-yc-network"
  zone = var.zone
} 
module "tf-yc-iam" {
  source = "./modules/tf-yc-iam"
  sa_name = "k8s-adm"
} 
module "tf-yc-cluster" {
  source = "./modules/tf-yc-cluster"
  k8s_version = "1.25"
  zone = "ru-central1-a"
  k8s_subnet_id = "ekk" #module.tf-yc-network.yandex_vpc_network.subnet_id
  k8s_network_id = "ekk" #module.tf-yc-network.yandex_vpc_network.network_id
  k8s_yandex_iam_service_account_id = "ekk" #module.tf-yc-iam.yandex_iam_service_account_id
} 

output "k8s_subnet_id" {
  value = module.tf-yc-network.yandex_vpc_network
}
