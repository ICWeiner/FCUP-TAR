# main.tf - server

## TODO automatizar este processo ? https://www.nginx.com/blog/setting-up-nginx/
## NOTA: para isto funcionar, é preciso apagar o ficheiro default em  /etc/nginx/sites-enabled 

resource "google_compute_address" "server_reserved_external_ip" {
  name   = "server-reserved-external-ip"
  region = var.server_pop_region
}

resource "google_compute_instance" "server_instance" {
  name         = "server"
  machine_type = var.gcp_default_machine_type
  zone         = "${var.server_pop_region}${var.server_pop_zone}"

  metadata = {
    ssh-keys = "${var.gce_ssh_user}:${file(var.ssh_pub_key_path)}"
  }
  
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