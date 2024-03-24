# main.tf - dns

resource "google_compute_address" "dns_reserved_external_ip" {
  name   = "dns-reserved-external-ip"
  region = var.dns_pop_region
}

resource "google_compute_instance" "dns_instance" {
  name         = "dns"
  machine_type = var.gcp_default_machine_type
  zone         = "${var.dns_pop_region}${var.dns_pop_zone}"

  metadata_startup_script = file("${path.module}/cloud-init.sh")

  tags = ["dns-ports"]


  boot_disk {
        initialize_params {
                image = var.gcp_default_machine_image
        }
}

        network_interface {
                network = "default"
                access_config {
                        nat_ip = google_compute_address.dns_reserved_external_ip.address
                }

        }

}