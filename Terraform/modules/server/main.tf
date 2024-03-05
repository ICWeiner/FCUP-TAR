# main.tf - web-server

resource "google_compute_address" "web-server_reserved_external_ip" {
  name = "web-server-reserved-external-ip"
  region = var.gcp_region_network
}

resource "google_compute_address" "web-server_reserved_internal_ip" {
  name   = "web-server-reserved-internal-ip" 
  region = var.gcp_region_network
  address_type = "INTERNAL"
}


resource "google_compute_instance" "web-server_instance" {
  name         = "web-server"
  machine_type = var.gcp_default_machine_type
  zone         = var.gcp_region

  boot_disk {
                initialize_params {
                        image = var.gcp_default_machine_image
                }
        }

        network_interface {
                network = "default"

                access_config {
                        nat_ip = google_compute_address.web-server_reserved_external_ip.address
                }
                
                network_ip = google_compute_address.web-server_reserved_internal_ip.address
        }

}