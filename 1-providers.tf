provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = file("fundamental-run-464208-v1-c61a604d3b31.json")

}

terraform {
  required_version = ">= 1.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}
