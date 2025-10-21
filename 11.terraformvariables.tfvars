# -----------------------
# VPC Variable settings
#--------------------------
vpc_name                        = "tf-vpc"
routing_mode                    = "REGIONAL"
auto_create_subnetworks         = false
delete_default_routes_on_create = true
route_name                      = "default-route-to-internet"
dest_range                      = "0.0.0.0/0"
next_hop_gateway                = "default-internet-gateway"

# -------------------------------   
# Subnet Variable settings
#-------------------------------
subnet_name              = "tf-subnet"
ip_cidr_range            = "10.0.0.0/19"
region                   = "us-central1"
private_ip_google_access = true
stack_type               = "IPV4_ONLY"
private_subnet_name      = "private-subnet2"
private_ip_cidr_range    = "10.0.32.0/19"
private_region           = "us-central1"
secondary_ip_range_name1 = "k8s-pods"
secondary_ip_cidr_range1 = "172.16.0.0/14"
secondary_ip_range_name2 = "k8s-services"
secondary_ip_cidr_range2 = "172.20.0.0/18"
# -------------------------------
# GKE Variable settings
#-------------------------------
gke_name                                    = "tf-gke-cluster"
gke_location                                = "us-central1-a"
gke_initial_node_count                      = 1
gke_remove_default_node_pool                = true
gke_networking_mode                         = "VPC_NATIVE"
gke_cluster_secondary_range_name            = "k8s-pods"
gke_services_secondary_range_name           = "k8s-services"
gke_private_cluster_enable_private_nodes    = true
gke_private_cluster_enable_private_endpoint = false
gke_private_cluster_master_ipv4_cidr_block  = "192.168.0.0/28"
# -------------------------------
# Firewall Variable settings
#-------------------------------
firewall_name    = "allow-iap-ssh2"
source_ranges    = ["35.235.240.0/20"]
allowed_protocol = "tcp"
project_id       = "fundamental-run-464208-v1"
