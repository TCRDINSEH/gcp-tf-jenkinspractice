variable "gke_networking_mode" {
  description = "Networking mode for GKE cluster"
  type        = string
}

variable "gke_private_cluster_master_ipv4_cidr_block" {
  description = "Master IPv4 CIDR block for private GKE cluster"
  type        = string
}