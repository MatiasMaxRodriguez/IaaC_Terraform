resource "google_storage_bucket" "storage-bucket" {
  name          = "tf-bkt-mmlab22"
  location      = "us"
  force_destroy = true
  uniform_bucket_level_access = true
}
