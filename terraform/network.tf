# // Create VPC
resource "google_compute_network" "vpc" {
 name                    = var.vpc-name
 auto_create_subnetworks = false
}


// firewall configuration applied to spectific target
resource "google_compute_firewall" "allow-ssh" {
  name    = var.firewall-name
  network = google_compute_network.vpc.name   
  # target_tags = ["vm"]

  allow {
    protocol = "tcp"
    ports    = ["22","80"]
  }
  # target_service_accounts = [google_service_account.my-gke-sa.email]
  source_ranges = ["35.235.240.0/20"]
  direction = "INGRESS"

}

// Management subnet 
resource "google_compute_subnetwork" "management-subnet" {
 name          = var.subnet-name
 ip_cidr_range = var.subnet-cidr
 network       = google_compute_network.vpc.id
 region        = var.subnet-region
}

// Restricted subnet  
resource "google_compute_subnetwork" "restricted-subnet" {
 name          = var.subnet-name-2
 ip_cidr_range = var.subnet-cidr-2
 network       = google_compute_network.vpc.id
 region        = var.subnet-region-2

  secondary_ip_range {
    range_name    = var.pod-range-name
    ip_cidr_range = var.pod-range-ip 
  }
  secondary_ip_range {
    range_name    = var.service-range-name
    ip_cidr_range = var.service-range-ip
  }
}

# Cloud Router
resource "google_compute_router" "router" {
  name    = var.router-name
  region = var.router-region 
  network = google_compute_network.vpc.id
  bgp {
    asn            = 64514
    advertise_mode = "CUSTOM"
  }
}

# NAT Gateway  
resource "google_compute_router_nat" "nat" {
  name                               = var.nat-name
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS" 

  subnetwork {
    name                    = google_compute_subnetwork.management-subnet.id 
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}
