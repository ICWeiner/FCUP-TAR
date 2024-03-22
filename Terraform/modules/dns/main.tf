# main.tf - dns

resource "google_compute_instance" "dns_instance" {
  name         = "dns"
  machine_type = var.gcp_default_machine_type
  zone         = var.gcp_region

  metadata_startup_script = file("${path.module}/cloud-init.sh")

  tags = ["dns-ports"]


  boot_disk {
                initialize_params {
                        image = var.gcp_default_machine_image
                }
        }

        network_interface {
                network = "default"

        }

}