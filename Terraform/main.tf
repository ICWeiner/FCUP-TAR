provider "google" {

  credentials = file(var.gcp_credentials_path)
  project     = var.gcp_project_id
  region      = var.gcp_region

}

resource "google_compute_firewall" "server-ports" {
  name    = "server-ports"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80","443"]  
  }

  source_ranges = ["0.0.0.0/0"] 

  target_tags = ["server-ports"]
}

resource "google_compute_firewall" "dns-ports" {
  name    = "dns-ports"
  network = "default"

  allow {
    protocol = "udp"
    ports    = ["53"]  
  }

  allow {
    protocol = "tcp"
    ports    = ["53"]  
  }

  source_ranges = ["0.0.0.0/0"] 

  target_tags = ["dns-ports"]
}


module "dns" {
  source  = "./modules/dns"


  gcp_default_machine_type = var.gcp_default_machine_type
  gcp_region = var.gcp_region
  gcp_region_network = var.gcp_region_network
  gcp_default_machine_image = var.gcp_default_machine_image
}

module "cache" {
  source               = "./modules/cache"


  gcp_default_machine_type = var.gcp_default_machine_type
  gcp_region = var.gcp_region
  gcp_region_network = var.gcp_region_network
  gcp_default_machine_image = var.gcp_default_machine_image
}


module "server" {
  source               = "./modules/server"

  gcp_default_machine_type = var.gcp_default_machine_type
  gcp_region = var.gcp_region
  gcp_region_network = var.gcp_region_network
  gcp_default_machine_image = var.gcp_default_machine_image
}
