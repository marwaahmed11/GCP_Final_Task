// vm SA
resource "google_service_account" "my-vm-sa" {
  account_id   = var.vm-sa-id 
  display_name = var.vm-sa-name 
}

// roles of sa
resource "google_project_iam_binding" "my-vm-sa-roles" {
project = var.project-id
role =  var.roles-vm

members = [
  "serviceAccount:${google_service_account.my-vm-sa.email}"
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
    email  = google_service_account.my-vm-sa.email
    scopes = ["cloud-platform"]
  }

}



