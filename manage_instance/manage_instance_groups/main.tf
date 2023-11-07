# Creating Instance Template 
resource "google_compute_instance_template" "instance_template" {
    name = var.instance_template_name
    machine_type = var.machine_type
    region = var.region
    can_ip_forward = var.can_ip_forward
    tags = var.tags
    disk {
      source_image = var.source_image
      auto_delete = var.auto_delete
      boot = var.boot
    }
    network_interface {
      network = var.network
      access_config {
        // Ephemeral public IP
      }
    }
    lifecycle {
      create_before_destroy = var.create_before_destroy
    }
    scheduling {
      automatic_restart = var.automatic_restart
      on_host_maintenance = var.on_host_maintenance
    }
    metadata_startup_script = file(var.metadata_startup_script)

}

# Creating Firewall Rule
resource "google_compute_firewall" "allow_http" {
    project = var.project
    name = "allow-http-rule"
    network = var.network
    allow {
      protocol = var.protocol
      ports = var.ports
    }
    target_tags = var.target_tags
    source_ranges = var.source_ranges
    priority = var.priority
}

# Creating autohealing health check for the instance group
resource "google_compute_health_check" "autohealing" {
    name = var.autohealing_health_check
    check_interval_sec = var.check_interval_sec
    timeout_sec = vaar.timeout_sec
    healthy_threshold = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold

    http_health_check {
      request_path = var.request_path
      port = var.port
    }
}

# Creating an Instance Group Manager
resource "google_compute_instance_group_manager" "instance_group" {
    name = var.instance_group_manager
    zone = var.zone
    base_instance_name = var.base_instance_name
    version {
      name = var.instance_template
      instance_template = google_compute_instance_template.instance_template.id
    }
    named_port {
      name = var.port_name
      port = var.port
    }

    auto_healing_policies {
      health_check = google_compute_health_check.autohealing
      initial_delay_sec = var.initial_delay_sec
    }

}

# Creating an Autoscaler for the instance group
resource "google_compute_autoscaler" "default" {
  name = var.autoscaler
  zone = var.zone
  target = google_compute_instance_group_manager.instance_group.id
  autoscaling_policy {
    min_replicas = var.min_replicas
    max_replicas = var.max_replicas
    cooldown_period = var.cooldown_period
  }

} 