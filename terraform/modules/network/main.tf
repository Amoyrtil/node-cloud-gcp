resource "google_compute_network" "vpc_network" {
  name                    = "${var.prefix}-vpc-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "public_subnet" {
  name          = "${var.prefix}-public-subnet"
  ip_cidr_range = "10.0.1.0/24"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_firewall" "allow_ssh" {
  name          = "${var.prefix}-allow-ssh"
  network       = google_compute_network.vpc_network.id
  source_ranges = var.ssh_source_ranges
  direction     = "INGRESS"
  target_tags   = ["allow-ssh"]
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
}
