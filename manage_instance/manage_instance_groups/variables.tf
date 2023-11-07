variable "instance_template_name" {
    type = string
}

variable "machine_type" {
    type = string
}

variable "region" {
    type = string
}

variable "can_ip_forward" {
    type = bool
}

variable "tags" {
    type = tuple([ string ])
}

variable "source_image" {
    type = string
}

variable "auto_delete" {
    type = bool
}

variable "boot" {
    type = string
}

variable "network" {
    type = string
}

variable "create_before_destroy" {
    type = bool
}

variable "automatic_restart" {
    type = bool
}

variable "on_host_maintenance" {
    type = string
}

variable "metadata_startup_script" {
    type = string
}

variable "project" {
  type = string
}

variable "protocol" {
  type = string
}

variable "ports" {
  type = tuple([ string ])
}

variable "target_tags" {
  type = tuple([ string ])
}

variable "source_ranges" {
  type = tuple([ string ])
}

variable "priority" {
  type = number
}

variable "autohealing_health_check" {
  type = string
}

variable "check_interval_sec" {
  type = number
}

variable "healthy_threshold" {
  type = number
}

variable "unhealthy_threshold" {
  type = number
}

variable "request_path" {
  type = string
}

variable "port" {
  type = string
}

variable "instance_group_manager" {
  type = string
}

variable "zone" {
  type = string
}

variable "base_instance_name" {
  type = string
}

variable "instance_template" {
  type = string
}

variable "port_name" {
  type = string
}

variable "initial_delay_sec" {
  type = number
}

variable "autoscaler" {
  type = string
}

variable "min_replicas" {
  type = number
}

variable "max_replicas" {
  type = number
}

variable "cooldown_period" {
  type = number
}