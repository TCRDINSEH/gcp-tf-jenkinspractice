resource "google_compute_subnetwork" "public" {
  name                     = var.subnet_name
  ip_cidr_range            = var.ip_cidr_range
  region                   = var.region
  network                  = google_compute_network.vpc.id
  private_ip_google_access = var.private_ip_google_access
  stack_type               = var.stack_type

}

resource "google_compute_subnetwork" "private" {
  name                     = var.private_subnet_name
  ip_cidr_range            = var.private_ip_cidr_range
  region                   = var.private_region
  network                  = google_compute_network.vpc.id
  private_ip_google_access = var.private_ip_google_access
  stack_type               = var.stack_type


  secondary_ip_range {
    range_name    = "k8s-pods"
    ip_cidr_range = "172.16.0.0/14"

  }

  secondary_ip_range {
    range_name    = "k8s-services"
      ip_cidr_range = "172.20.0.0/18"
  }
}
