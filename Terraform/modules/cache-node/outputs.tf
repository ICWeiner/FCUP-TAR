# outputs - cache-node

output  "cache-node_reserved_external_ips" {
	value = google_compute_address.cache-node_reserved_external_ip_[*].address
}

output  "cache-node_reserved_internal_ips" {
	value = google_compute_address.cache-node_reserved_internal_ip_[*].address
}