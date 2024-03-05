# outputs - web-server

output  "web-server_reserved_external_ip" {
	value = google_compute_address.web-server_reserved_external_ip.address
}

output  "web-server_reserved_internal_ip" {
	value = google_compute_address.web-server_reserved_internal_ip.address
}