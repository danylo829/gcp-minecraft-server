provider "google" {
  credentials = file("../../credentials.json")
  project     = "mine-server-829"
  region      = "europe-north1"
  zone        = "europe-north1-a"
}

module "vpc" {
  source = "../modules/network"
}

module "mine-server" {
  source           = "../modules/instances"
  network_name     = module.vpc.network_name
  instance_address = module.vpc.server_address
  instance_name    = "server"
  machine_type     = "e2-highcpu-4"
}

module "monitoring" {
  source           = "../modules/instances"
  network_name     = module.vpc.network_name
  instance_address = module.vpc.monitoring_address
  instance_name    = "monitoring"
}
