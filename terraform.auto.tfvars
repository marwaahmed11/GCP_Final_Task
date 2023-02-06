// provider
project-id = "warm-pixel-375711"
region = "us-central1"

// vpc
vpc-name = "terraform-vpc"

# // firewall
# firewall-name = "terraform-allow-ssh"

// subnet 
subnet-name   = "management-subnet"
subnet-cidr = "10.0.0.0/24"  // public subnet 
subnet-region      = "us-central1"

subnet-name-2   = "restricted-subnet"
subnet-cidr-2 = "10.0.1.0/24" // private subnet 
subnet-region-2     = "us-central1"

// nat 
nat-name = "terraform-nat"

// sa
sa-id = "my-terraform-sa"
sa-name = "my-terraform-sa"

// vm 
vm-name = "terraform-private-vm"
machine-type = "f1-micro"
vm-zone = "us-central1-a"
image-name = "debian-cloud/debian-11"