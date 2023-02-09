// provider
project-id = "warm-pixel-375711"
region = "us-central1"

// vpc
vpc-name = "terraform-vpc"

// firewall
firewall-name = "terraform-allow-ssh"

// subnet 
subnet-name   = "management-subnet"
subnet-cidr = "10.1.0.0/18"   // management subnet   
subnet-region      = "us-central1"

subnet-name-2   = "restricted-subnet"
subnet-cidr-2 = "10.0.0.0/18" // restricted subnet 
subnet-region-2     = "us-central1"

pod-range-name = "k8s-pod-range"
pod-range-ip = "10.48.0.0/14"
service-range-name = "k8s-service-range"
service-range-ip = "10.52.0.0/20"


roles-gke = ["roles/container.admin","roles/storage.objectAdmin"]
  

// nat 
nat-name = "terraform-nat"
router-name = "router"
router-region = "us-central1"

// sa
sa-id = "my-terraform-sa"
sa-name = "my-terraform-sa"
gke-sa-id = "my-gke-sa"
gke-sa-name = "my-gke-sa"

// vm 
vm-name = "terraform-private-vm"
machine-type = "f1-micro"
vm-zone = "us-central1-a"
image-name = "debian-cloud/debian-11"

// gke 
cluster-name = "terraform-private-cluster"
cluster-location = "us-central1-a"
authorized-network-name = "management-subnet-cidr"
node-pool-name = "node-pool"
node-machine-type = "e2-small"