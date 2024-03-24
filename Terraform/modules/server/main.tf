# main.tf - server

resource "google_compute_address" "server_reserved_external_ip" {
  name   = "server-reserved-external-ip"
  region = var.server_pop_region
}

resource "google_compute_instance" "server_instance" {
  name         = "server"
  machine_type = var.gcp_default_machine_type
  zone         = "${var.server_pop_region}${var.server_pop_zone}"

  metadata_startup_script = file("${path.module}/cloud-init.sh")

  tags = ["server-ports"]


  boot_disk {
                initialize_params {
                        image = var.gcp_default_machine_image
                }
        }

        network_interface {
                network = "default"
                access_config {
                        nat_ip = google_compute_address.server_reserved_external_ip.address
                }

        }

}