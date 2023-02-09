// gke SA
resource "google_service_account" "my-gke-sa" {
  account_id   = var.gke-sa-id 
  display_name = var.gke-sa-name 
}

// roles of sa
resource "google_project_iam_binding" "my-gke-sa-roles" {
project = var.project-id
count = length(var.roles-gke)
role =  var.roles-gke[count.index]

members = [
  "serviceAccount:${google_service_account.my-gke-sa.email}"
]
}

// private vm
resource "google_compute_instance" "vm" {
  name         = var.vm-name 
  machine_type = var.machine-type
  zone         = var.vm-zone
  # tags         = ["vm"]

  boot_disk {
    initialize_params {
      image = var.image-name
    }
  }

  network_interface {
    network = google_compute_network.vpc.name
    subnetwork = google_compute_subnetwork.management-subnet.name
  }

  service_account {
    email  = google_service_account.my-gke-sa.email
    scopes = ["cloud-platform"]
  }

}



