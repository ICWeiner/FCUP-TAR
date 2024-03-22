# variables.tf - server

variable "gcp_region" {
  type    = string
}

variable "gcp_region_network" {
  type    = string
}

variable "gcp_default_machine_type" {
  type    = string
}

variable "gcp_default_machine_image"{
  type    = string
  description = "Default OS image for the VMs"
}

variable "cache_node_data_disk_size_gb" {
  type    = string
}


variable "cache_node_instance_count" {
  type    = string
}


