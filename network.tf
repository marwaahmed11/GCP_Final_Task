# // Create VPC
resource "google_compute_network" "vpc" {
 name                    = var.vpc-name
 auto_create_subnetworks = false
}


# // VPC firewall configuration applied to all instance 
# resource "google_compute_firewall" "allow-ssh" {
#   name    = var.firewall-name
#   network = google_compute_network.vpc.name  // vpc

#   allow {
#     protocol = "tcp"
#     ports    = ["22"]
#   }

#   source_ranges = ["0.0.0.0/0"]
# }

// Management subnet 
resource "google_compute_subnetwork" "management-subnet" {
 name          = var.subnet-name
 ip_cidr_range = var.subnet-cidr
 network       = google_compute_network.vpc.id
 region        = var.subnet-region
}

// Restricted subnet  => delete route to igw ////
resource "google_compute_subnetwork" "restricted-subnet" {
 name          = var.subnet-name-2
 ip_cidr_range = var.subnet-cidr-2
 network       = google_compute_network.vpc.id
 region        = var.subnet-region-2
}

# Cloud Router
resource "google_compute_router" "router" {
  name    = "router"
  region = "us-central1"
  network = google_compute_network.vpc.id
  bgp {
    asn            = 64514
    advertise_mode = "CUSTOM"
  }
}

# NAT Gateway  // allow instance with private ip to access internet 
# https://www.terraform.io/docs/providers/google/r/compute_router_nat.html
resource "google_compute_router_nat" "nat" {
  name                               = var.nat-name
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS" 

  subnetwork {
    name                    = google_compute_subnetwork.management-subnet.id ////// management subnet only
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}
