// gke cluster
resource "google_container_cluster" "private-cluster" {
  name                     = var.cluster-name
  location                 = var.cluster-location // the cluster will be a zonal cluster with a single cluster master.
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.vpc.self_link
  subnetwork               = google_compute_subnetwork.restricted-subnet.self_link


 release_channel {
    channel = "REGULAR"
  }

 ip_allocation_policy {
    cluster_secondary_range_name  = var.pod-range-name
    services_secondary_range_name = var.service-range-name 
  }

  private_cluster_config {
    
    enable_private_nodes    = true   // indicates that the cluster's nodes do not have external IP addresses.
    enable_private_endpoint = true// indicates that the cluster is managed using the private IP address of the control plane API endpoint
    master_ipv4_cidr_block  = "172.16.0.0/28" // specifies that access to the public endpoint is restricted to IP address ranges that you authorize.

  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = var.subnet-cidr 
      display_name = var.authorized-network-name 
    }
  }
}

// gke node 
resource "google_container_node_pool" "private-cluster-nodes" {
  name       = var.node-pool-name
  cluster    = google_container_cluster.private-cluster.id
  location   = var.cluster-location 
  node_count = 1

  node_config {
    preemptible  = true 
    machine_type = var.node-machine-type
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
