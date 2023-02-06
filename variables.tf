// provider 
variable "project-id" {
  
}
variable "region" {
  
}


// vpc

variable "vpc-name" {
  
}


# // firewall
# variable "firewall-name" {
  
# }

// subnet 
variable "subnet-name" {
  
}
variable "subnet-cidr" {
  
}
variable "subnet-region" {
  
}

variable "subnet-name-2" {
  
}
variable "subnet-cidr-2" {
  
}
variable "subnet-region-2" {
  
}

// nat 
variable "nat-name" {
  
}

// service account roles
// service account permissions 
// Compute Admin → Full control of Compute Engine resources (Virtual Machines)
// Kubernetes Engine Admin → Full management of Kubernetes Clusters
variable "rolesList" {
    type =list(string)
    default = ["roles/compute.admin","roles/container.admin"]
}
variable "sa-id" {
  
}
variable "sa-name" {
  
}

// vm 
variable "vm-name" {
  
}
variable "machine-type" {
  
}
variable "vm-zone" {
  
}
variable "image-name"{
  
}