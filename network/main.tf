resource "google_compute_network" "auto_vpc" {
    name = var.auto_vpc_name
    auto_create_subnetworks = var.create_auto_vpc_subnet

}

resource "google_compute_network" "custom_vpc" {
    name = var.custom_vpc_name
    auto_create_subnetworks = var.create_custom_vpc_subnet
}

resource "google_compute_subnetwork" "subnet" {
    name = var.subnet_name
    network = google_compute_network.custom_vpc.id
    region = var.region
    ip_cidr_range = var.ip_cidr_range
    private_ip_google_access = var.private_ip_google_access 
}

resource "google_compute_firewall" "allow_icmp" {
    name = "allow-icmp"
    network = google_compute_network.custom_vpc.id
    allow {
      protocol = var.protocol
    }
    source_ranges = [var.source_range]
    priority = var.priority
}