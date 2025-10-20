
# # resource "google_service_account" "terraform_sa" {
# #   account_id   = "terraform-sa"
# #   display_name = "Service Account for Terraform"
# #   project      = "fundamental-run-464208-v1" # Replace with your GCP project ID
# # }
# # resource "google_project_iam_member" "sa_editor_role" {
# #   project = "fundamental-run-464208-v1" # Replace with your GCP project ID
# #   role    = "roles/editor"       # Or a more specific role (e.g., roles/compute.admin)
# #   member  = "serviceAccount:${google_service_account.terraform_sa.email}"
# # }
# #####################################################
# # Google Cloud VM Instance (Windows - e2-medium)
# #####################################################

# # terraform {
# #   required_providers {
# #     google = {
# #       source  = "hashicorp/google"
# #       version = "~> 6.0" # use the latest stable
# #     }
# #   }

# #   required_version = ">= 1.6.0"
# # }

# # provider "google" {
# #   project = "fundamental-run-464208-v1" # 🔹 Replace with your GCP project ID
# #   region  = "us-central1"
# #   zone    = "us-central1-a"
# # }

# # # --------------------------------------------------
# # # Create Windows VM Instance
# # # --------------------------------------------------
# # resource "google_compute_instance" "windows_vm" {
# #   name         = "windows-vm"
# #   machine_type = "e2-medium"
# #   zone         = "us-central1-a"

# #   # Use default network and subnetwork
# #   network_interface {
# #     network = "default"
# #     access_config {} # Allocates an external IP
# #   }

# #   # Boot disk with Windows OS
# #   boot_disk {
# #     initialize_params {
# #       image = "windows-cloud/windows-server-2022-dc-v20241008" # ✅ Windows Server 2022 Datacenter
# #       size  = 50                                               # GB
# #       type  = "pd-balanced"
# #     }
# #   }

# #   # Enable Windows username/password generation
# #   metadata = {
# #     windows-startup-script-cmd = "winrm quickconfig -q"
# #   }

# #   tags = ["windows-vm"]
# # }

# # # --------------------------------------------------
# # # Firewall rule (allow RDP from your IP)
# # # --------------------------------------------------
# # resource "google_compute_firewall" "allow_rdp" {
# #   name    = "allow-rdp"
# #   network = "default"

# #   allows {
# #     protocol = "tcp"
# #     ports    = ["3389"]
# #   }

# #   source_ranges = ["0.0.0.0/0"] # 🔥 You can restrict this to your IP for security
# #   target_tags   = ["windows-vm"]
# # }

# ##########################################################
# # Google Cloud VM (Ubuntu - e2-medium, default network)
# ##########################################################

# terraform {
#   required_providers {
#     google = {
#       source  = "hashicorp/google"
#       version = "~> 6.0"
#     }
#   }

#   required_version = ">= 1.6.0"
# }

# provider "google" {
#   project = var.project_id
#   region  = var.region
#   zone    = var.zone
# }

# # -----------------------------
# # Create Linux VM Instance
# # -----------------------------
# resource "google_compute_instance" "linux_vm" {
#   name         = "linux-vm"
#   machine_type = "e2-medium"
#   zone         = var.zone

#   # Use default network
#   network_interface {
#     network       = "default"
#     access_config {}  # Allocates external IP
#   }

#   # Ubuntu boot disk
#   boot_disk {
#     initialize_params {
#       image = "ubuntu-os-cloud/ubuntu-2204-lts"
#       size  = 30
#       type  = "pd-balanced"
#     }
#   }

#   # Metadata for SSH access
#   metadata = {
#     ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
#   }

#   tags = ["linux-vm"]
# }

# # -----------------------------
# # Allow SSH Firewall Rule
# # -----------------------------
# resource "google_compute_firewall" "allow_ssh" {
#   name    = "allow-ssh"
#   network = "default"

#   allows {
#     protocol = "tcp"
#     ports    = ["22"]
#   }

#   source_ranges = ["0.0.0.0/0"] # ⚠️ open to all IPs; restrict for prod
#   target_tags   = ["linux-vm"]
# }
