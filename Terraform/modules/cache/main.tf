# main.tf - cache

resource "google_compute_disk" "cache_data_disk" {
  count = var.cache_instance_count
  name  = "cache-${count.index}-data-disk"
  size  = var.cache_data_disk_size_gb
  type  = var.cache_data_disk_type
  zone  = var.gcp_region
}


resource "google_compute_instance" "cache_instance" {
  count = var.cache_instance_count
  name         = "cache-${count.index}"
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

                
        }

}