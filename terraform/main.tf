terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.14"
    }
    http = {
      source  = "hashicorp/http"
      version = "~> 3.0"
    }
  }
}

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
  zone    = var.gcp_zone
}

provider "http" {
  # No configuration is needed
}

module "network" {
  source            = "./modules/network"
  prefix            = local.prefix
  ssh_source_ranges = local.ssh_source_ranges
}

module "vm" {
  source           = "./modules/vm"
  prefix           = local.prefix
  vpc_id           = module.network.vpc_id
  public_subnet_id = module.network.public_subnet_id
}
