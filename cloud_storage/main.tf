resource "google_storage_bucket" "test-bucket" {
  name          = var.bucket_name
  location      = var.bucket_location
  
  labels = {
    var.label_key = var.label_value
    
  }

  storage_class = var.storage_class
  uniform_bucket_level_access = var.uniform_bucket_level_access

  lifecycle_rule {
    condition {
      age = var.lifecycle_rule_age
    }
    action {
      type = var.lifecycle_rule_type
      storage_class = var.lifecycle_rule_storage_class
    }
  }

  retention_policy {
    retention_period = var.retention_period
  }

}

resource "google_storage_bucket_object" "test_bucket_folder" {
  name   = var.bucket_folder_name               # folder name should end with '/'
  content = var.bucket_folder_content            # content is ignored but should be non-empty
  bucket = google_storage_bucket.test-bucket.name
}

resource "google_storage_bucket_object" "test_bucket_object" {
  name   = var.bucket_object_name
  source = var.bucket_object_source
  bucket = google_storage_bucket.test-bucket.name
}

resource "google_storage_object_access_control" "view_rule" {
  object = google_storage_bucket_object.test_bucket_object.name
  bucket = google_storage_bucket.test-bucket.name
  role   = var.google_storage_object_access_control_role
  entity = var.google_storage_object_access_control_entity
}