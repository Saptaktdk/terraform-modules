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
    network = var.vpc_name

    access_config {
      // Ephemeral public IP
    }
  }
}