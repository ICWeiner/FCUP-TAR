# main.tf - cache

resource "google_compute_address" "cache_reserved_external_ip" {
  count  = var.cache_instance_count
  name   = "cache-reserved-external-ip-${count.index}"
  region = var.cache_pop_region[count.index]
}

resource "google_compute_disk" "cache_data_disk" {
  count = var.cache_instance_count
  name  = "cache-${count.index}-data-disk"
  size  = var.cache_data_disk_size_gb
  type  = var.cache_data_disk_type
  zone  = "${var.cache_pop_region[count.index]}${var.cache_pop_zone[count.index]}"
}


resource "google_compute_instance" "cache_instance" {
  count = var.cache_instance_count
  name         = "cache-${count.index}"
  machine_type = var.gcp_default_machine_type
  zone  = "${var.cache_pop_region[count.index]}${var.cache_pop_zone[count.index]}"

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
                        nat_ip = google_compute_address.cache_reserved_external_ip[count.index].address
                }

                
        }

}