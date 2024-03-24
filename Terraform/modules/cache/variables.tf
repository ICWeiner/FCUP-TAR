# variables.tf - server

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

variable "cache_pop_region" {
  type = list(string)
  default = ["europe-west1","me-central1"]
  description = ""
}

variable "cache_pop_zone" {
  type = list(string)
  default = ["-c","-c"]
}