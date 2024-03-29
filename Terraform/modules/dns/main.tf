# main.tf - dns

resource "google_compute_address" "dns_reserved_external_ip" {
  count  = var.dns_instance_count
  name   = "dns-reserved-external-ip-${count.index}"
  region = var.dns_pop_region
}

resource "google_compute_instance" "dns_instance" {
  count        = var.dns_instance_count
  name         = "dns-${count.index}"
  machine_type = var.gcp_default_machine_type
  zone         = "${var.dns_pop_region}${var.dns_pop_zone}"

  metadata = {
    ssh-keys = "${var.gce_ssh_user}:${file(var.ssh_pub_key_path)}"
  }

  metadata_startup_script = file("${path.module}/cloud-init.sh")

  tags = ["dns-ports","default-allow-ssh"]


  boot_disk {
        initialize_params {
                image = var.gcp_default_machine_image
        }
}

        network_interface {
                network = "default"
                access_config {
                        nat_ip = google_compute_address.dns_reserved_external_ip[count.index].address
                }

        }

}