# main.tf - cache-node

resource "google_compute_address" "cache-node_reserved_external_ip" {
  name = "cache-node-reserved-external-ip-${count.index}"
  region = var.gcp_region_network
}

resource "google_compute_address" "cache-node_reserved_internal_ip" {
  name   = "cache-node-reserved-internal-ip-${count.index}" 
  region = var.gcp_region_network
  address_type = "INTERNAL"
}

resource "google_compute_disk" "cache_node_data_disk" {
  count = var.cache_node_instance_count
  name  = "cache_node-data-disk-${count.index}"
  size  = var.cache_node_data_disk_size_gb
  type  = var.gcp_cache_node_data_disk_type
  zone  = var.gcp_region
}


resource "google_compute_instance" "cache-node_instance" {
  name         = "cache-node"
  machine_type = var.gcp_default_machine_type
  zone         = var.gcp_region

  metadata_startup_script = file("${path.module}/cloud-init.sh")

  tags = []


  boot_disk {
                initialize_params {
                        image = var.gcp_default_machine_image
                }
        }

        network_interface {
                network = "default"

                access_config {
                        nat_ip = google_compute_address.cache-node_reserved_external_ip_[count.index].address
                }
                
                network_ip = google_compute_address.cache-node_reserved_internal_ip_[count.index].address
        }

}