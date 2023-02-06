provider "google" {
  credentials = file(var.credentials_path)
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

module "vpc" {
  source = "./modules/network"
}

module "mine-server" {
  source           = "./modules/instances"
  network_name     = module.vpc.network_name
  instance_address = module.vpc.server_address
  instance_name    = "server"
  machine_type     = "e2-highcpu-4"
  ssh_user         = var.ssh_user
  ssh_pub_key_path = var.ssh_pub_key_path
}

module "monitoring" {
  source           = "./modules/instances"
  network_name     = module.vpc.network_name
  instance_address = module.vpc.monitoring_address
  instance_name    = "monitoring"
  ssh_user         = var.ssh_user
  ssh_pub_key_path = var.ssh_pub_key_path
}
