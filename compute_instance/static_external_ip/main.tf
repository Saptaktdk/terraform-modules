resource "google_compute_instance" "default" {
  name         = var.instance_name
  machine_type = var.instance_machine_type
  zone         = var.instance_zone
  project      = var.instance_project_id
  description = var.instance_description
  labels = var.instance_labels

  tags = var.instance_tags

  boot_disk {
    initialize_params {
      image = var.boot_disk_image
      size = var.boot_disk_size
      type = var.boot_disk_type
    }

    device_name = var.boot_disk_name
  }

  network_interface {
    network = data.google_compute_network.vpc_network.self_link
    subnetwork = data.google_compute_subnetwork.vpc_subnet.self_link

    access_config {
      // Ephemeral public IP
      nat_ip = google_compute_address.static_external_ip.address
    }
  }
  metadata_startup_script = file(var.metadata_startup_script)
  depends_on = [ google_compute_address.static_external_ip ]
}