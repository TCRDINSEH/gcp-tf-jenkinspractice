resource "google_compute_firewall" "allow_iap_ssh" {
  name    = var.firewall_name
  network = google_compute_network.vpc.name

  allow {
    protocol = var.allowed_protocol
    ports    = [22]
  }

  source_ranges = var.source_ranges
}
