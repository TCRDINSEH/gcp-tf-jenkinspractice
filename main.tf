
# resource "google_service_account" "terraform_sa" {
#   account_id   = "terraform-sa"
#   display_name = "Service Account for Terraform"
#   project      = "fundamental-run-464208-v1" # Replace with your GCP project ID
# }
# resource "google_project_iam_member" "sa_editor_role" {
#   project = "fundamental-run-464208-v1" # Replace with your GCP project ID
#   role    = "roles/editor"       # Or a more specific role (e.g., roles/compute.admin)
#   member  = "serviceAccount:${google_service_account.terraform_sa.email}"
# }
