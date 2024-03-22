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

  target_tags = ["server-ports"]  # Apply this firewall rule to instances with this tag
}

module "cache_node" {
  source               = "./modules/cache-node"

  cache_node_instance_count = var.cache_node_instance_count
  cache_node_data_disk_size_gb = var.cache_node_data_disk_size_gb


  gcp_default_machine_type = var.gcp_default_machine_type
  gcp_region = var.gcp_region
  gcp_region_network = var.gcp_region_network
  gcp_default_machine_image = var.gcp_default_machine_image
}

output "cache_node_reserved_external_ips" {
  value = module.cache_node.cache_node_reserved_external_ips
}

output "cache_node_reserved_internal_ips" {
  value = module.cache_node.cache_node_reserved_internal_ips
}

module "server" {
  source               = "./modules/server"

  gcp_default_machine_type = var.gcp_default_machine_type
  gcp_region = var.gcp_region
  gcp_region_network = var.gcp_region_network
  gcp_default_machine_image = var.gcp_default_machine_image
}

output "server_reserved_external_ip" {
  value = module.server.server_reserved_external_ip
}

output "server_reserved_internal_ip" {
  value = module.server.server_reserved_internal_ip
}