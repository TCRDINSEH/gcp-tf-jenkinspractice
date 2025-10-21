resource "google_compute_network" "vpc" {
  name                            = var.vpc_name
  routing_mode                    = var.routing_mode
  auto_create_subnetworks         = var.auto_create_subnetworks
  delete_default_routes_on_create = var.delete_default_routes_on_create


  # depends_on = [google_project_service.api]
}

# Remove this route to make the VPC fully private.
# You need this route for the NAT gateway.
resource "google_compute_route" "default_route" {
  name             = var.route_name
  dest_range       = var.dest_range
  network          = google_compute_network.vpc.name
  next_hop_gateway = var.next_hop_gateway

}
