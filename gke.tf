# // gke cluster
# resource "google_container_cluster" "private-cluster" {
#   name                     = "terraform-private-cluster"
#   location                 = "us-central1-a" // the cluster will be a zonal cluster with a single cluster master.
#   remove_default_node_pool = true
#   initial_node_count       = 1
#   network                  = google_compute_network.vpc.self_link
#   subnetwork               = google_compute_subnetwork.restricted-subnet.self_link
  

#   addons_config {
#     http_load_balancing {
#       disabled = true
#     }
#   }

#  release_channel {
#     channel = "REGULAR"
#   }

#   private_cluster_config {
#     enable_private_nodes    = true  
#     enable_private_endpoint = false // access gke from your computer
#     master_ipv4_cidr_block  = "172.16.0.0/28"
#   }

# }

# // gke node 
# resource "google_container_node_pool" "private-cluster-nodes" {
#   name       = "cluster node"
#   cluster    = google_container_cluster.private-cluster.id
#   node_count = 1

#   node_config {
#     # preemptible  = false  // cheaper vm mmkn google t5odhom ay w2t
#     machine_type = "e2-small"
#     service_account = google_service_account.my-sa.email
#     oauth_scopes = [
#       "https://www.googleapis.com/auth/cloud-platform"
#     ]
#   }
# }
