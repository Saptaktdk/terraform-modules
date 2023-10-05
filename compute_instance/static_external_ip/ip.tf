resource "google_compute_address" "static_external_ip" {
  name         = var.static_ip_name
  address_type = "EXTERNAL"
  project = var.instance_project_id
  region = var.instance_region
}