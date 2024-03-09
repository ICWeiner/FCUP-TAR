variable "gcp_credentials_path" {
  type    = string
  description = "path to file containing json credetials"
}

variable "gcp_project_id" {
  type    = string
}

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
}

variable "cache_data_disk_type" {
  type    = string
}

variable "cache_instance_count" {
  type    = string
}

variable "gcp_data_disk_type" {
  type    = string
}