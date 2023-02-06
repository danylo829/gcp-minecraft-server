output "server_ip" {
  value       = module.mine-server.instance_ips
  description = "The public IP address of minecraft server"
}

output "monitoring_ip" {
  value       = module.monitoring.instance_ips
  description = "The public IP address of monitoring instance"
}