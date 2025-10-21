# -----------------------
# VPC Variable settings
#--------------------------
variable "vpc_name" {
  description = "VPC Name"
  type        = string
}

variable "routing_mode" {
  description = "VPC Routing Mode"
  type        = string
}

variable "auto_create_subnetworks" {
  description = "Auto Create Subnetworks"
  type        = bool
}

variable "delete_default_routes_on_create" {
  description = "Delete Default Routes on Create"
  type        = bool
}

# -------------------------------
# Route Variable settings   
#-------------------------------
variable "route_name" {
  description = "Route Name"
  type        = string
}
variable "dest_range" {
  description = "Destination Range"
  type        = string
}
variable "next_hop_gateway" {
  description = "Next Hop Gateway"
  type        = string
}

# -------------------------------
# Subnet Variable settings  
#-------------------------------
variable "subnet_name" {
  description = "Subnet Name"
  type        = string
}
variable "ip_cidr_range" {
  description = "IP CIDR Range"
  type        = string
}
variable "region" {
  description = "Region"
  type        = string
}
# variable "network" {
#   description = "Network"
#   type        = string
# }
variable "private_ip_google_access" {
  description = "Private IP Google Access"
  type        = bool
}
variable "stack_type" {
  description = "Stack Type"
  type        = string
}
variable "private_subnet_name" {
  description = "Subnet Name"
  type        = string
}
variable "private_ip_cidr_range" {
  description = "IP CIDR Range"
  type        = string
}
variable "private_region" {
  description = "Region"
  type        = string
}
# -------------------------------
# Secondary IP Range Variable settings  
#-------------------------------

# variable "secondary_range_name1" {
#   description = "Secondary Range Name"
#   type        = string
# }
# variable "secondary_ip_cidr_range1" {
#   description = "Secondary IP CIDR Range"
#   type        = string
# }

# variable "secondary_range_name2" {
#   description = "Secondary Range Name"
#   type        = string
# }
# variable "secondary_ip_cidr_range2" {
#   description = "Secondary IP CIDR Range"
#   type        = string
# }
# -----------------------------
# Firewall Variable settings
#------------------------------
variable "firewall_name" {
  description = "Firewall Name"
  type        = string
}
variable "allowed_protocol" {
  description = "Allowed Protocol"
  type        = string
}

# variable "allowed_ports" {
#   description = "Allowed Ports"
#   type        = list(string)
# }
variable "source_ranges" {
  description = "Source Ranges"
  type        = list(string)
}
# -----------------------------
# VM Instance Variable settings
#------------------------------
# variable "instance_name" {
#   description = "Instance Name"
#   type        = string
# }
# variable "machine_type" {
#   description = "Machine Type"
#   type        = string
# }
# variable "zone" {
#   description = "Zone"
#   type        = string
# }
# variable "boot_disk_image" {
#   description = "Boot Disk Image"
#   type        = string
# }
# variable "boot_disk_size" {
#   description = "Boot Disk Size"
#   type        = number
# }
# variable "boot_disk_type" {
#   description = "Boot Disk Type"
#   type        = string
# }
# variable "network_interface_network" {
#   description = "Network Interface Network"
#   type        = string
# }
# variable "network_interface_subnetwork" {
#   description = "Network Interface Subnetwork"
#   type        = string
# }
# variable "network_interface_access_config" {
#   description = "Network Interface Access Config"
#   type        = bool
# }

# -----------------------------
# Tags Variable settings
#------------------------------
# variable "instance_tags" {
#   description = "Instance Tags"
#   type        = list(string)
# }
# -----------------------------
# Metadata Variable settings    
#------------------------------
# variable "metadata_startup_script" {
#   description = "Metadata Startup Script"
#   type        = string
# }

# -----------------------------
# Outputs Variable settings
#------------------------------
# variable "output_instance_name" {
#   description = "Output Instance Name"
#   type        = string
# }
# variable "output_instance_ip" {
#   description = "Output Instance IP"
#   type        = string
# }
# variable "output_vpc_name" {
#   description = "Output VPC Name"
#   type        = string
# }
# -----------------------------
# gke Variable settings 
#------------------------------
variable "gke_name" {
  description = "GKE Cluster Name"
  type        = string
}
variable "gke_location" {
  description = "GKE Cluster Location"
  type        = string
}
variable "gke_initial_node_count" {
  description = "GKE Initial Node Count"
  type        = number
}
# variable "gke_remove_default_node_pool" {
#   description = "GKE Remove Default Node Pool"
#   type        = bool
# }
variable "gke_networking_mode" {
  description = "GKE Networking Mode"
  type        = string
}
variable "gke_private_cluster_master_ipv4_cidr_block" {
  description = "GKE Private Cluster Master IPv4 CIDR Block"
  type        = string
}
variable "project_id" {
  description = "GCP Project ID"
  type        = string
}


# ####################################################
# End of 10-variables.tf




