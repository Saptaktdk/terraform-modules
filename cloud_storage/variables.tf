variable "bucket_name" {
    type = string
}

variable "bucket_location" {
    type = string
}

variable "label_key" {
    type = string
} 

variable "label_value" {
    type = string
}

variable "storage_class" {
    type = string
}

variable "uniform_bucket_level_access" {
    type = bool
}

variable "lifecycle_rule_age" {
    type = number
}

variable "lifecycle_rule_type" {
    type = string
}

variable "lifecycle_rule_storage_class" {
    type = string
}

variable "retention_period" {
  type = number
}

variable "bucket_folder_name" {
    type = string
}

variable "bucket_folder_content" {
    type = string
}

variable "bucket_object_name" {
    type = string
}

variable "bucket_object_source" {
    type = string
}

variable "google_storage_object_access_control_role" {
    type = string
}

variable "google_storage_object_access_control_entity" {
    type = string
}



