resource "google_compute_network" "vpc_network" {
  name                    = "vpc"
  auto_create_subnetworks = true
}

resource "google_compute_address" "server_address" {
  name         = "server-address"
}

resource "google_compute_address" "monitoring_address" {
  name         = "monitoring-address"
}

resource "google_compute_firewall" "general_rule" {
  name        = "general-rule"
  network     = google_compute_network.vpc_network.name
  description = "Allow ssh, icmp ports"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "server-rule" {
  name        = "server-rule"
  network     = google_compute_network.vpc_network.name
  description = "Allow default minecraft server port"

  allow {
    protocol = "tcp"
    ports    = ["25565"]
  }

  target_tags   = ["server"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "server-exporters-rule" {
  name        = "server-exporters-rule"
  network     = google_compute_network.vpc_network.name
  description = "Allow exporters ports"

  allow {
    protocol = "tcp"
    ports    = ["9100", "9144"]
  }

  target_tags = ["server"]
  source_tags = ["monitoring"]
}

resource "google_compute_firewall" "monitoring-rule" {
  name        = "monitoring-rule"
  network     = google_compute_network.vpc_network.name
  description = "Allow grafana port"

  allow {
    protocol = "tcp"
    ports    = ["3000"]
  }

  target_tags   = ["monitoring"]
  source_ranges = ["0.0.0.0/0"]
}
