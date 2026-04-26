terraform {
  backend "gcs" {
      bucket = "tf-bkt-mmlab22"
      prefix = "terraform/state"
    }

  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.53.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

module "instances" {
  source     = "./modules/instances"
}

module "storage" {
  source     = "./modules/storage"
}
module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 6.0.0"

    project_id   = "matmaxlabtf"
    network_name = "tf-vpc-mmlab22"
    routing_mode = "GLOBAL"

    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "us-west1"
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "us-west1"
        },
    ]
}
resource "google_compute_firewall" "tf-firewall"{
  name    = "tf-firewall"
	network = "projects/matmaxlabtf/global/networks/tf-vpc-mmlab22"

 # Permite el protocolo ICMP (ping)
  allow {
    protocol = "icmp"
  }

  # Permite acceso SSH (Puerto 22)
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

# Permite tráfico interno en todos los puertos
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_tags = ["web"]
  source_ranges = ["10.10.10.0/24", "10.10.20.0/24", "0.0.0.0/0"]
}

