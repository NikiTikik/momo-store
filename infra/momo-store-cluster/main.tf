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
  k8s_subnet_id = module.tf-yc-network.subnet_id
  k8s_network_id = module.tf-yc-network.network_id
  k8s_yandex_iam_service_account_id = module.tf-yc-iam.yandex_iam_service_account_id
} 
