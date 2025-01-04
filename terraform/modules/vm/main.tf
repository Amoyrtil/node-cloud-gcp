resource "google_compute_instance" "gce_instance" {
  name         = "${var.prefix}-gce-instance"
  machine_type = var.instance_type
  tags         = ["allow-ssh"] 

  boot_disk {
    auto_delete = false
    source      = google_compute_disk.gce_boot_disk.id
  }

  network_interface {
    network    = var.vpc_id
    subnetwork = var.public_subnet_id
    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}

resource "google_compute_disk" "gce_boot_disk" {
  name  = "${var.prefix}-gce-boot-disk"
  image = var.image_type
  type  = var.persistent_disk_type
  size  = var.persistent_disk_size
}
