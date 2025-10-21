# -----------------------------
# Create a new VPC network
# -----------------------------
resource "google_compute_network" "custom_vpc" {
  name                    = "mywindows-vpc"
  auto_create_subnetworks = false
}

# -----------------------------
# Create a subnet inside the VPC
# -----------------------------
resource "google_compute_subnetwork" "custom_subnet" {
  name          = "mywindows-subnet"
  region        = "us-central1"
  network       = google_compute_network.custom_vpc.id
  ip_cidr_range = "10.0.0.0/24"
}

# -----------------------------
# Create a firewall rule for RDP (TCP 3389)
# -----------------------------
resource "google_compute_firewall" "rdp_firewall" {
  name    = "allow-rdp"
  network = google_compute_network.custom_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["windows"]
}

# -----------------------------
# Create a Windows Server VM
# -----------------------------
resource "google_compute_instance" "windows_vm" {
  name         = "mywindows-windows-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["windows"]

  boot_disk {
    initialize_params {
      image = "windows-cloud/windows-server-2019-dc"
      size  = 50
      type  = "pd-balanced"
    }
  }

  network_interface {
    network    = google_compute_network.custom_vpc.id
    subnetwork = google_compute_subnetwork.custom_subnet.id
    access_config {} # Gives external IP
  }

  metadata = {
    windows-startup-script-ps1 = <<-EOT
      Write-Host "Windows VM Startup Script Running..."
      New-Item -Path "C:\\startup.txt" -ItemType File -Value "VM setup completed via Jenkins & Terraform."
    EOT
  }
}

# -----------------------------
# Outputs
# -----------------------------
output "instance_name" {
  value = google_compute_instance.windows_vm.name
}

output "instance_ip" {
  value = google_compute_instance.windows_vm.network_interface[0].access_config[0].nat_ip
}

output "vpc_name" {
  value = google_compute_network.custom_vpc.name
}

# ####################################################
# Google Cloud VM Instance (Windows - e2-medium)
# ####################################################

# # --------------------------------------------------
# # Create Windows VM Instance
# # --------------------------------------------------
# resource "google_compute_instance" "windows_vm" {
#   name         = "windows-vm"
#   machine_type = "e2-medium"
#   zone         = "us-central1-a"

#   # Use default network and subnetwork
#   network_interface {
#     network = "default"
#     access_config {} # Allocates an external IP
#   }

#   # Boot disk with Windows OS
#   boot_disk {
#     initialize_params {
#       image = "windows-cloud/windows-server-2022-dc-v20241008" # ✅ Windows Server 2022 Datacenter
#       size  = 50                                               # GB
#       type  = "pd-balanced"
#     }
#   }

#   # Enable Windows username/password generation
#   metadata = {
#     windows-startup-script-cmd = "winrm quickconfig -q"
#   }

#   tags = ["windows-vm"]
# }

# --------------------------------------------------
# Firewall rule (allow RDP from your IP)
# --------------------------------------------------
# resource "google_compute_firewall" "allow_rdp" {
#   name    = "allow-rdp"
#   network = "default"

#   allows {
#     protocol = "tcp"
#     ports    = ["3389"]
#   }

#   source_ranges = ["0.0.0.0/0"] # 🔥 You can restrict this to your IP for security
#   target_tags   = ["windows-vm"]
# }

# #########################################################
# Google Cloud VM (Ubuntu - e2-medium, default network)
# #########################################################


# -----------------------------
# Create Linux VM Instance
# -----------------------------
# resource "google_compute_instance" "linux_vm" {
#   name         = "linux-vm"
#   machine_type = "e2-medium"
#   zone         = "us-central1-a"	

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

# }
