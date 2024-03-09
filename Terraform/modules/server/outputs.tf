# outputs - server

output  "server_reserved_external_ip" {
	value = google_compute_address.server_reserved_external_ip.address
}

output  "server_reserved_internal_ip" {
	value = google_compute_address.server_reserved_internal_ip.address
}