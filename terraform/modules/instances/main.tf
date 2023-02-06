resource "google_compute_instance" "Instance" {
  name                      = var.instance_name
  machine_type              = var.machine_type
  tags                      = [var.instance_name, "http-server", "https-server"]
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-focal-v20230104"
    }
  }

  network_interface {
    network = var.network_name
    access_config {
      nat_ip = var.instance_address
    }
  }

  metadata = {
    ssh-keys = format("%s%s%s", var.ssh_user, ":", file(var.ssh_pub_key_path))
  }
}
