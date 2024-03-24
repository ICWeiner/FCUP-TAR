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

variable "cache_data_disk_size_gb" {
  type    = string
  default = "10"
}

variable "cache_data_disk_type" {
  type    = string
  default = "pd-ssd"
}


variable "cache_instance_count" {
  type    = string
  default = "2"
}

variable "cache_pop" {
  type = list(string)
  default = ["europe-west-1-c","me-central-1-c"]
}