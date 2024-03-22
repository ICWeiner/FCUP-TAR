# terraform.tfvars

cache_node_instance_count = 2

cache_node_data_disk_size_gb = 10

#cache_node_data_disk_type = "pd-ssd"

gcp_data_disk_type = "pd-standard"

gcp_credentials_path = ""

gcp_project_id = "tar-cdn"

gcp_region = "europe-west1-b"

gcp_region_network = "europe-west1"

gcp_default_machine_type = "e2-medium"

gcp_default_machine_image = "ubuntu-os-cloud/ubuntu-2004-lts"