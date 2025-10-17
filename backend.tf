
terraform {
  backend "gcs" {
    bucket = "fundamental-run-464208-v1"
    prefix = "terraform/gke"
  }
}
