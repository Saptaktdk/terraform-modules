data "google_compute_network" "vpc_network" {
  project                 = var.vpc_project_id
  name                    = var.vpc_name
  
}

data "google_compute_subnetwork" "vpc_subnet" {
  project                 = var.vpc_project_id
  name                    = var.vpc_subnet_name
  region = var.vpc_region
  
}