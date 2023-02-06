output "network_name" {
  value = google_compute_network.vpc_network.name
}

output "server_address" {
  value = google_compute_address.server_address.address
}

output "monitoring_address" {
  value = google_compute_address.monitoring_address.address
}
