provider "google" {

  credentials = file(var.gcp_credentials_path)
  project     = var.gcp_project_id
  region      = var.gcp_region

}

resource "google_compute_firewall" "placeholder" {
  name    = "placeholder-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["3300"]  
  }

  source_ranges = ["0.0.0.0/0"]  # Adjust as needed for your network security

  target_tags = ["placeholder"]  # Apply this firewall rule to instances with this tag
}

module "cache" {
  source               = "./modules/cache"

  cache_instance_count = var.cache_instance_count
  cache_data_disk_size_gb = var.cache_data_disk_size_gb
  gcp_data_disk_type = var.gcp_data_disk_type

  gcp_default_machine_type = var.gcp_default_machine_type
  gcp_region = var.gcp_region
  gcp_region_network = var.gcp_region_network
  gcp_default_machine_image = var.gcp_default_machine_image
}

output "cache_reserved_external_ips" {
  value = module.cache.cache_reserved_external_ips
}

output "cache_reserved_internal_ips" {
  value = module.cache.cache_reserved_internal_ips
}